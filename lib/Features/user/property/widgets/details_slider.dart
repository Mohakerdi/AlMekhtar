import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mabeet/core/constants/icons.dart';

class DetailsSlider extends StatefulWidget {
  const DetailsSlider({super.key, required this.imageAssets});

  final List<String> imageAssets;

  @override
  State<DetailsSlider> createState() => _DetailsSliderState();
}

class _DetailsSliderState extends State<DetailsSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.imageAssets.length,
            itemBuilder: (context, index, realIndex) {
              final imagePath = widget.imageAssets[index];

              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    width: 380,
                    height: 380,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(color: Colors.white),
                    errorWidget: (context, url, error) =>
                    const Icon(AppIcons.homeIcon, size: 50, color: Colors.white),
                  )
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              aspectRatio: 0.8,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 65,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.imageAssets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _carouselController.animateToPage(index);
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 65,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _currentImageIndex == index
                            ? Colors.indigo
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: widget.imageAssets[index],
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(color: Colors.white),
                        errorWidget: (context, url, error) =>
                        const Icon(AppIcons.homeIcon, size: 50, color: Colors.white),
                      )
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
