import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_cubit.dart';
import 'package:mabeet/Features/user/home/search/cubit/search_filter_state.dart';
import 'package:mabeet/Features/user/home/search/screens/search_screen.dart';
import 'package:mabeet/core/constants/icons.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/state.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterOverlay extends StatelessWidget {

  final void Function() onApply;

  const FilterOverlay({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {

    final cubit = context.read<SearchFilterCubit>();

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'Filters',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(AppIcons.exitIcon),
                ),
              ],
            ),

            body: BlocBuilder<SearchFilterCubit, SearchFilterState>(
              builder: (context, state) {
                final stateModel = syrianStates.firstWhere(
                      (s) => s.name == state.governorate?.name,
                  orElse: () => syrianStates[0],
                );
                final availableAreas = stateModel.areas;

                final selectedArea = state.area != null && availableAreas.contains(state.area)
                    ? state.area
                    : availableAreas.isNotEmpty ? availableAreas[0] : null;

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Governorat: ', style: AppTextStyles.bodyLarge),
                          Expanded(
                            child: DropdownButtonFormField<Location>(
                              value: state.governorate,
                              items: [
                                for (final location in Location.values)
                                  DropdownMenuItem(
                                    value: location,
                                    child: Row(children: [Text(location.name)]),
                                  ),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  cubit.updateGovernorate(val);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                      const Divider(),

                      Row(
                        children: [
                          Text(
                            'City:             ',
                            style: AppTextStyles.bodyLarge,
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedArea,
                              items: [
                                for (final area in availableAreas)
                                  DropdownMenuItem(
                                    value: area,
                                    child: Row(children: [Text(area)]),
                                  ),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  cubit.updateArea(val);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                      const Divider(),

                      Row(
                        children: [
                          Text('Cost Range: ', style: AppTextStyles.bodyLarge),
                          Expanded(
                            child: SfRangeSlider(
                              min: 0.0,
                              max: 100.0,
                              values: SfRangeValues(state.minCost, state.maxCost),
                              onChanged: (dynamic newValues) {
                                cubit.updateCostRange(newValues.start, newValues.end);
                              },
                              interval: 20.0,
                              showLabels: true,
                              showTicks: true,
                              enableTooltip: true,
                              tooltipShape: const SfPaddleTooltipShape(),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),

                      Row(
                        children: [
                          Text('Area Range: ', style: AppTextStyles.bodyLarge),
                          Expanded(
                            child: SfRangeSlider(
                              min: 30.0,
                              max: 210.0,
                              values: SfRangeValues(state.minArea, state.maxArea),
                              onChanged: (dynamic newValues) {
                                cubit.updateAreaRange(newValues.start, newValues.end);
                              },
                              interval: 30.0,
                              showLabels: true,
                              showTicks: true,
                              enableTooltip: true,
                              tooltipShape: const SfPaddleTooltipShape(),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),

                      Row(
                        children: [
                          Text('Rating Range: ', style: AppTextStyles.bodyLarge),
                          Expanded(
                            child: SfRangeSlider(
                              min: 0.0,
                              max: 5.0,

                              values: SfRangeValues(state.minRate, state.maxRate),
                              onChanged: (dynamic newValues) {

                                cubit.updateRateRange(newValues.start, newValues.end);
                              },

                              interval: 1.0,
                              showLabels: true,
                              showTicks: true,
                              enableTooltip: true,
                              tooltipShape: const SfPaddleTooltipShape(),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order: ', style: AppTextStyles.bodyLarge),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Asc'),
                              value: 'asc',
                              groupValue: state.order,
                              onChanged: (String? value) {
                                if (value != null) {
                                  cubit.updateOrder(value);
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Desc'),
                              value: 'desc',
                              groupValue: state.order,
                              onChanged: (String? value) {
                                if (value != null) {
                                  cubit.updateOrder(value);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.resetFilters();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.gray400,
                              ),
                              child: const Text('Reset'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final BuildContext filterContext = context; // Capture the FilterOverlay's context
                                cubit.applyFilters();
                                Navigator.of(filterContext).pop();
                                onApply();
                              },
                              child: const Text('Apply'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}