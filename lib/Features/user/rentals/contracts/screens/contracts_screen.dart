import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/requests/widgets/rent_request_widget.dart';
import 'package:mabeet/Features/user/rentals/requests/widgets/rent_request_widget_shimmer.dart';
import 'package:mabeet/Features/user/rentals/services/owner_cubit.dart';
import 'package:mabeet/Features/user/rentals/services/owner_state.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/widgets/internet_error_widget.dart';
import 'package:mabeet/data/repos/owner_repo.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerCubit(ownerRepository: OwnerRepository(api: DioConsumer(dio: Dio())))..loadContracts(),
      child: Scaffold(
        body: BlocConsumer<OwnerCubit, OwnerState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is OwnerLoading) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RequestWidgetShimmer(showActions: false,);
                },
              );
            }

            if (state is OwnerLoaded) {
              if (state.myProperties.isEmpty) {
                return Center(
                  child: Text('${AppStrings.noResultsSearch.tr()} .'),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.contracts.length,
                itemBuilder: (context, index) {
                  return RequestWidget(booking: state.contracts[index],onAccept: (){},onReject: (){},);
                },
              );
            }

            if (state is OwnerError) {
              return InternetErrorWidget(message: state.message, onRetry: context.read<OwnerCubit>().loadContracts,);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
