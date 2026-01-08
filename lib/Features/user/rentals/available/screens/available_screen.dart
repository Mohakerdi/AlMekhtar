import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/home/widgets/popular_property.dart';
import 'package:mabeet/Features/user/rentals/available/services/available_cubit.dart';
import 'package:mabeet/Features/user/rentals/available/services/available_state.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class AvailableScreen extends StatelessWidget {
  const AvailableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AvailableCubit()..loadAvailable(),
      child: Scaffold(
        body: BlocConsumer<AvailableCubit, AvailableState>(
          listener: (context, state) {
            if (state is AvailableError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AvailableLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Available rentals loaded successfully!'),
                  backgroundColor: AppColors.primary700,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AvailableLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AvailableLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.available.length,
                itemBuilder: (context, index) {
                  final property = state.available[index];
                  return PopularProperty(property: property);
                },
              );
            }

            if (state is AvailableError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
