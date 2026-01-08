import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/repos/payment_repo.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository paymentRepository;

  PaymentCubit({required this.paymentRepository}) : super(PaymentInitial());

  TextEditingController paymentCardNumber = TextEditingController();
  TextEditingController paymentCvv = TextEditingController();

  String? fullSavedCardNumber;
  String? savedCvv;

  String? startTerm;
  String? endTerm;

  void saveCardDetails() {
    fullSavedCardNumber = paymentCardNumber.text;
    savedCvv = paymentCvv.text;
  }

  Future<void> submitOfferPayment({required int apartmentId}) async {
    if (fullSavedCardNumber == null ||
        savedCvv == null ||
        startTerm == null ||
        endTerm == null) {
      emit(
        PaymentFailure(
          errorMessage: AppStrings.paymentErrorMsg.tr(),
        ),
      );
      return;
    }

    emit(PaymentLoading());

    final response = await paymentRepository.offer(
      apartmentId: apartmentId,
      startTerm: startTerm!,
      endTerm: endTerm!,
      cardNumber: fullSavedCardNumber!,
      cvv: savedCvv!,
    );

    response.fold(
      (errorMessage) {
        emit(PaymentFailure(errorMessage: errorMessage));
      },
      (successMessage) {
        fullSavedCardNumber = null;
        savedCvv = null;
        emit(PaymentSuccess(message: successMessage));
      },
    );
  }

  void updateDates({required DateTime start,required DateTime end,required double costPerNight,}) {
    final nights = end.difference(start).inDays + 1;
    final total = nights * costPerNight + 10;

    startTerm = DateFormat('yyyy-M-d').format(start);
    endTerm   = DateFormat('yyyy-M-d').format(end);

    emit(PaymentPriceUpdated(nights: nights, total: total));
  }

  Future<void> submitFinalPayment({required int bookingId}) async {
    if (fullSavedCardNumber == null ||savedCvv == null) {
      emit(
        PaymentFailure(
          errorMessage: AppStrings.paymentErrorMsg.tr(),
        ),
      );
      return;
    }

    emit(PaymentLoading());

    final response = await paymentRepository.finalPayment(
      bookingId: bookingId,
      cardNumber: fullSavedCardNumber!,
      cvv: savedCvv!,
    );

    response.fold(
          (errorMessage) {
        emit(PaymentFailure(errorMessage: errorMessage));
      },
          (successMessage) {
        fullSavedCardNumber = null;
        savedCvv = null;
        emit(PaymentSuccess(message: successMessage));
      },
    );
  }
}
