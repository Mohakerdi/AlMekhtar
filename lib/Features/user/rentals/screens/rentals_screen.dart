import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/CustomAppBar.dart';
import 'package:mabeet/Features/user/rentals/screens/add_property_screen.dart';
import 'package:mabeet/Features/user/rentals/services/rentals_cubit.dart';
import 'package:mabeet/Features/user/rentals/services/rentals_state.dart';
import 'package:mabeet/Features/user/rentals/widgets/rentals_property.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RentalsCubit()..loadRentals(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Rentals'),
        body: BlocConsumer<RentalsCubit, RentalsState>(
          listener: (context, state) {
            if (state is RentalsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is RentalsLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Rentals loaded successfully!'),
                  backgroundColor: AppColors.primary700,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is RentalsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RentalsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.rentals.length,
                itemBuilder: (context, index) {
                  final property = state.rentals[index];
                  return RentalsProperty(property: property);
                },
              );
            }

            if (state is RentalsError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddPropertyScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
