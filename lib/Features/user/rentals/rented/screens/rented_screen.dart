import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/Features/user/rentals/addNewProperty/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/rented/services/rented_cubit.dart';
import 'package:mabeet/Features/user/rentals/rented/services/rented_state.dart';
import 'package:mabeet/Features/user/rentals/widgets/rentals_property.dart';
import 'package:mabeet/core/constants/strings.dart';
import 'package:mabeet/data/repos/dummy_properties.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class RentedScreen extends StatelessWidget {
  const RentedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RentedCubit()..loadRentals(),
      child: Scaffold(
        body: BlocConsumer<RentedCubit, RentedState>(
          listener: (context, state) {
            if (state is RentedError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is RentedLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Rentals loaded successfully!'),
                  backgroundColor: AppColors.primary700,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is RentedLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RentedLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.rentals.length,
                itemBuilder: (context, index) {
                  final property = state.rentals[index];
                  return RentalsProperty(property: property);
                },
              );
            }

            if (state is RentedError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
