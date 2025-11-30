import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';
import 'package:mabeet/core/theme/text_styles.dart';

class FilterOverlay extends StatelessWidget {
  const FilterOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboradSpace = MediaQuery.of(context).viewInsets.bottom;
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
              child: Column(
                children: [
                  Divider(color: Colors.grey.withAlpha(100)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, keyboradSpace),
                    child: Column(
                      children: [
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            iconSize: 30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: AppColors.primary700,
                            minimumSize: Size(300, 60),
                          ),
                          child: Text(
                            'Apply Filter',
                            style: AppTextStyles.labelButton,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
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
