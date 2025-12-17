import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  TextEditingController paymentCardNumber = TextEditingController();
  TextEditingController paymentCvv = TextEditingController();

}
