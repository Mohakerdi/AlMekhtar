import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/bookings/widgets/booking_property.dart';
import 'package:mabeet/Features/user/bookings/widgets/bookings_property_shimmer.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_cubit.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_state.dart';
import 'package:mabeet/Features/user/home/search/widgets/search_field.dart';
import 'package:mabeet/data/models/property.dart';
import '../widgets/filter_overlay.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _showOverlay(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: FilterOverlay(onApply: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: BlocBuilder<SearchFilterCubit, SearchFilterState>(
        builder: (context, state) {
          final properties = state.properties ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SearchField(onPressed: () => _showOverlay(context)),
                const SizedBox(height: 20),
                if (state.isLoading)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    separatorBuilder: (ctx, idx) => const SizedBox(height: 15),
                    itemBuilder: (ctx, idx) => const BookingPropertyShimmer(),
                  )
                else if (state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                else if (properties.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text('No properties found matching your filters.'),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: properties.length,
                    separatorBuilder: (ctx, idx) => const SizedBox(height: 15),
                    itemBuilder: (ctx, index) => BookingProperty(property: properties[index]),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
