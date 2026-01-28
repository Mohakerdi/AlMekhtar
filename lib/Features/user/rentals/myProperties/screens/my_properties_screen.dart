import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/rentals/myProperties/widgets/owner_property.dart';
import 'package:mabeet/Features/user/rentals/myProperties/widgets/owner_property_shimmer.dart';
import 'package:mabeet/Features/user/rentals/services/owner_cubit.dart';
import 'package:mabeet/Features/user/rentals/services/owner_state.dart';
import 'package:mabeet/core/api/dio_consumer.dart';
import 'package:mabeet/core/constants/images.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/core/widgets/internet_error_widget.dart';
import 'package:mabeet/data/repos/owner_repo.dart';

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({super.key});

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OwnerCubit(
        ownerRepository: OwnerRepository(api: DioConsumer(dio: Dio())),
      )..loadMyProperties(),
      child: Scaffold(
        body: BlocConsumer<OwnerCubit, OwnerState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OwnerLoading) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return OwnerPropertyShimmer();
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
                itemCount: state.myProperties.length,
                itemBuilder: (context, index) {
                  final property = state.myProperties[index];
                  return OwnerProperty(property: property);
                },
              );
            }

            if (state is OwnerError) {
              return InternetErrorWidget(message: state.message, onRetry: context.read<OwnerCubit>().loadMyProperties);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
