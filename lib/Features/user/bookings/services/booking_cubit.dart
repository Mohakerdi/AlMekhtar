import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/repos/booking_repo.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository _bookingRepository;

  BookingCubit({required BookingRepository bookingRepository})
      : _bookingRepository = bookingRepository,
        super(BookingInitial());

  BookingLoaded get _currentStateData {
    if (state is BookingLoaded) {
      return state as BookingLoaded;
    }
    return BookingLoaded(
      pendingBookings: [],
      activeBookings: [],
      historyBookings: [],
    );
  }

  Future<void> loadPendingBookings() async {
    if (state is! BookingLoading) emit(BookingLoading());

    try {
      final pending = await _bookingRepository.getPendingAwaitingBookings();
      final currentData = _currentStateData;
      emit(BookingLoaded(
        pendingBookings: pending,
        activeBookings: currentData.activeBookings,
        historyBookings: currentData.historyBookings,
      ));
    } catch (e) {
      emit(BookingError('${AppStrings.failedLoad.tr()} $e',
      ));
    }
  }

  Future<void> loadActiveBookings() async {
    if (state is! BookingLoading) emit(BookingLoading());

    try {
      final active = await _bookingRepository.getActiveAcceptedBookings();

      final currentData = _currentStateData;

      emit(BookingLoaded(
        pendingBookings: currentData.pendingBookings,
        activeBookings: active,
        historyBookings: currentData.historyBookings,
      ));
    } catch (e) {
      emit(BookingError('${AppStrings.failedLoad.tr()} $e',
      ));
    }
  }

  Future<void> loadHistoryBookings() async {
    if (state is! BookingLoading) emit(BookingLoading());

    try {
      final history = await _bookingRepository.getHistoryBookings();

      final currentData = _currentStateData;

      emit(BookingLoaded(
        pendingBookings: currentData.pendingBookings,
        activeBookings: currentData.activeBookings,
        historyBookings: history,
      ));
    } catch (e) {
      emit(BookingError('${AppStrings.failedLoad.tr()} $e',
      ));
    }
  }

  Future<String> cancelBooking(int bookingId) async {
    try {
      final message = await _bookingRepository.cancelBooking(bookingId);
      final currentData = _currentStateData;

      final updatedPending = currentData.pendingBookings.where((b) => b.bookingId != bookingId).toList();
      final updatedActive = currentData.activeBookings.where((b) => b.bookingId != bookingId).toList();

      emit(BookingLoaded(
        pendingBookings: updatedPending,
        activeBookings: updatedActive,
        historyBookings: currentData.historyBookings,
      ));
      return message;
    } catch (e) {
      emit(BookingError(AppStrings.bookingCancelError.tr(),
      ));
      rethrow;
    }
  }
}