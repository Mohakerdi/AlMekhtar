import 'package:flutter/material.dart';

class ImagesWidget extends StatelessWidget {
  final List<String> images;

  const ImagesWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 395,
      child: PageView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(images[0], fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(images[1], fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(images[2], fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(images[3], fit: BoxFit.cover),
          ),
          /*Image.asset(property.imageURLs[1]),
                  Image.asset(property.imageURLs[2]),
                  Image.asset(property.imageURLs[3]),*/
        ],
      ),
    );
    // Container(
    //   width: 390,
    //   height: 280,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     image: DecorationImage(
    //       image: AssetImage(property.imageURLs[0]),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // ),
  }
}
