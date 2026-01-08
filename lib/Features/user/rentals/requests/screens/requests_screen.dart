import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/services/owner_cubit.dart';
import 'package:mabeet/Features/user/rentals/services/owner_state.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/models/booking_model.dart';
import 'package:mabeet/data/repos/owner_repo.dart';
import '../widgets/rent_request_widget.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  late final OwnerCubit _ownerCubit;

  @override
  void initState() {
    super.initState();
    _ownerCubit = OwnerCubit(
      ownerRepository: OwnerRepository(api: DioConsumer(dio: Dio())),
    );
    _ownerCubit.loadPendingRequests();
  }

  Future<void> _handleAction(
      BuildContext context,
      Booking booking,
      bool accept,
      ) async {
    try {
      String message;
      if (accept) {
        message = await _ownerCubit.acceptRequest(booking.bookingId);
      }

      if (!mounted) return;

      _ownerCubit.loadPendingRequests();
    } catch (e) {

    }
  }

  @override
  void dispose() {
    _ownerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ownerCubit,
      child: BlocBuilder<OwnerCubit, OwnerState>(
        builder: (context, state) {
          if (state is OwnerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OwnerError) {
            return Center(
              child: Text('Error loading requests: ${state.message}'),
            );
          }

          if (state is OwnerLoaded) {
            if (state.pendingRequests.isEmpty) {
              return Center(
                child: Text('${AppStrings.emptyBookingsMsg.tr()}.'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.pendingRequests.length,
              itemBuilder: (context, index) {
                final booking = state.pendingRequests[index];
                return RequestWidget(
                  booking: booking,
                  onAccept: () => _handleAction(context, booking, true),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
