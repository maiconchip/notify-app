import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class MediaGridView extends StatelessWidget {
  const MediaGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/gallery_images/1.png",
      "assets/gallery_images/2.png",
      "assets/gallery_images/3.png",
      "assets/gallery_images/4.png",
      "assets/gallery_images/5.png",
      "assets/gallery_images/6.png",
      "assets/gallery_images/7.png",
      "assets/gallery_images/8.png",
      "assets/gallery_images/9.png",
      "assets/gallery_images/10.png",
      "assets/gallery_images/11.png",
      "assets/gallery_images/12.png",
    ];
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 12,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return FadedScaleAnimation(
            Image.asset(
              images[index],
            ),
          );
        });
  }
}
