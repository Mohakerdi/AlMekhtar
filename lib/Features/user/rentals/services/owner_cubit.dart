import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/repos/owner_repo.dart';
import 'owner_state.dart';

class OwnerCubit extends Cubit<OwnerState> {
  final OwnerRepository _ownerRepository;


  OwnerCubit({required OwnerRepository ownerRepository})
      : _ownerRepository = ownerRepository,
        super(OwnerInitial());

  OwnerLoaded get _currentStateData {
    if (state is OwnerLoaded) {
      return state as OwnerLoaded;
    }
    return OwnerLoaded(
      myProperties: []
    );
  }

  Future<void> loadMyProperties() async {
    if (state is! OwnerLoading) emit(OwnerLoading());

    try {
      final properties = await _ownerRepository.getMyProperties();
      emit(OwnerLoaded(
        myProperties: properties,
      ));
    } catch (e) {
      emit(OwnerError('${AppStrings.failedLoad.tr()} $e',
      ));
    }
  }

  Future<String> deleteProperty(int id) async {
    try {
      final message = await _ownerRepository.deleteProperty(id);
      final currentData = _currentStateData;

      final updatedProperty = currentData.myProperties.where((b) => b.propertyId != id).toList();

      emit(OwnerLoaded(
        myProperties: updatedProperty
      ));
      return message;
    } catch (e) {
      emit(OwnerError(AppStrings.bookingCancelError.tr(),
      ));
      rethrow;
    }
  }

  Future<void> loadPendingRequests() async {
    if (_currentStateData.pendingRequests.isEmpty && state is! OwnerLoading) {
      emit(OwnerLoading());
    }

    try {
      final requests = await _ownerRepository.getPendingBookingRequests();
      final currentData = _currentStateData;

      emit(OwnerLoaded(
        myProperties: currentData.myProperties,
        pendingRequests: requests,
      ));
    } catch (e) {
      emit(OwnerError('${AppStrings.failedLoad.tr()} $e'));
    }
  }

  Future<String> acceptRequest(int bookingId) async {
    try {
      final message = await _ownerRepository.acceptBooking(bookingId);
      final currentData = _currentStateData;
      final updatedRequests = currentData.pendingRequests
          .where((b) => b.bookingId != bookingId)
          .toList();

      emit(OwnerLoaded(
        myProperties: currentData.myProperties,
        pendingRequests: updatedRequests,
      ));

      return message;
    } catch (e) {
      emit(OwnerError(AppStrings.failedLoad.tr(),
      ));
      rethrow;
    }
  }
}