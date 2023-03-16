import 'dart:math';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  RoundedImage({
    Key? key,
    required ImageProvider<Object> image,
    required double width,
    required double height,
    BoxFit? fit,
  }) : super(key: key) {
    borderRadius = min(width, height) / 10;
    imageWidget = Image(
      image: image,
      width: width,
      height: height,
      fit: fit,
    );
  }

  RoundedImage.network({
    Key? key,
    required String url,
    required double width,
    required double height,
    BoxFit? fit,
  }) : super(key: key) {
    borderRadius = min(width, height) / 10;
    imageWidget = Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
    );
  }

  late final double borderRadius;
  late final Image imageWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageWidget,
      ),
    );
  }
}
