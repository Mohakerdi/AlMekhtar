import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/requests/widgets/rent_request_widget_shimmer.dart';
import 'package:mabeet/Features/user/rentals/services/owner_cubit.dart';
import 'package:mabeet/Features/user/rentals/services/owner_state.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/widgets/internet_error_widget.dart';
import 'package:mabeet/data/repos/owner_repo.dart';
import '../widgets/rent_request_widget.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerCubit(
        ownerRepository: OwnerRepository(api: DioConsumer(dio: Dio())),
      )..loadPendingRequests(),
      child: Scaffold(
        body: BlocBuilder<OwnerCubit, OwnerState>(
          builder: (context, state) {
            if (state is OwnerLoading) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RequestWidgetShimmer();
                },
              );
            }
            if (state is OwnerError) {
              return InternetErrorWidget(message: state.message, onRetry: context.read<OwnerCubit>().loadPendingRequests);
            }

            if (state is OwnerLoaded) {
              if (state.pendingRequests.isEmpty) {
                return Center(
                  child: Text('${AppStrings.noResultsSearch.tr()}.'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.pendingRequests.length,
                itemBuilder: (context, index) {
                  final booking = state.pendingRequests[index];

                  return RequestWidget(
                    booking: booking,
                    onAccept: () {
                      context.read<OwnerCubit>().acceptRequest(booking.bookingId);
                      context.read<OwnerCubit>().loadPendingRequests();
                    },
                    onReject: () {
                      context.read<OwnerCubit>().rejectRequest(booking.bookingId);
                      context.read<OwnerCubit>().loadPendingRequests();
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
