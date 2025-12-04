import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/Features/user/home/widgets/search_field.dart';
import 'package:mabeet/core/constants/images.dart';
import '../../widgets/filter_overlay.dart';

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
        child: FilterOverlay(),
      ),
    );
  }

  final List<String> imageAssets = [
    AppImages.kDamascus,
    AppImages.kRefDemasheq,
    AppImages.kDaraa,
    AppImages.kQonaytera,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SearchField(
              onBtnPressed: () {
                _showOverlay(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
