import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';
import 'package:mabeet/data/models/property.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterOverlay extends StatefulWidget {
  const FilterOverlay({super.key});

  @override
  State<FilterOverlay> createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {
  Location _selectedGovernorat = Location.Damascus;
  Location _selectedCity = Location.RefDemasheq;
  int floor = 0;
  SfRangeValues _costRange = const SfRangeValues(40.0, 60.0);
  SfRangeValues _areaRange = const SfRangeValues(70.0, 120.0);
  SfRangeValues _rateRange = const SfRangeValues(1.0, 3.0);
  String _order = 'asc';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return FractionallySizedBox(
          heightFactor: 0.6,
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
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Governorat: ',style: AppTextStyles.bodyLarge,),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedGovernorat,
                          items: [
                            for (final location in Location.values)
                              DropdownMenuItem(
                                value: location,
                                child: Row(children: [Text(location.name)]),
                              ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedGovernorat = val!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('City:             ',style: AppTextStyles.bodyLarge,),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedCity,
                          items: [
                            for (final location in Location.values)
                              DropdownMenuItem(
                                value: location,
                                child: Row(children: [Text(location.name)]),
                              ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedCity = val!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Cost Range: ',style: AppTextStyles.bodyLarge,),
                      Expanded(
                        child: SfRangeSlider(
                          min: 0.0,
                          max: 100.0,
                          values: _costRange,
                          onChanged: (dynamic newValues) {
                            setState(() {
                              _costRange = newValues;
                            });
                          },
                          interval: 20.0,
                          showLabels: true,
                          showTicks: true,
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Area Range: ',style: AppTextStyles.bodyLarge,),
                      Expanded(
                        child: SfRangeSlider(
                          min: 30.0,
                          max: 210.0,
                          values: _areaRange,
                          onChanged: (dynamic newValues) {
                            setState(() {
                              _areaRange = newValues;
                            });
                          },
                          interval: 30.0,
                          showLabels: true,
                          showTicks: true,
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Rating Range: ',style: AppTextStyles.bodyLarge,),
                      Expanded(
                        child: SfRangeSlider(
                          min: 0.0,
                          max: 5.0,
                          values: _rateRange,
                          onChanged: (dynamic newValues) {
                            setState(() {
                              _rateRange = newValues;
                            });
                          },
                          interval: 1.0,
                          showLabels: true,
                          showTicks: true,
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order: ',style: AppTextStyles.bodyLarge,),
                      // Style for clarity
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Asc'),
                          value: 'asc',
                          groupValue: _order,
                          onChanged: (String? value) {
                            setState(() {
                              _order = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Desc'),
                          value: 'desc',
                          groupValue: _order,
                          onChanged: (String? value) {
                            setState(() {
                              _order = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Reset'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.gray400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Apply'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
