import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_values/common_values.dart';

class RoundedImage extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const BoxFit _boxFit = BoxFit.contain;

  /* ---------- Properties ---------- */

  final double size;
  late final ImageProvider<Object>? imageProvider;
  late final String? url;

  /* ---------- Constructors ---------- */

  RoundedImage(
    ImageProvider<Object> image, {
    Key? key,
    required this.size,
  }) : super(key: key) {
    imageProvider = image;
    url = null;
  }

  RoundedImage.network(
    this.url, {
    Key? key,
    required this.size,
  }) : super(key: key) {
    imageProvider = null;
  }

  /* ---------- Methods ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    final radius = common.radius.medium;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: imageProvider != null || url != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(radius - 1),
                child: Container(
                  width: size,
                  height: size,
                  color: Theme.of(context).colorScheme.surface,
                  child: imageProvider != null
                      ? Image(
                          fit: _boxFit,
                          image: imageProvider!,
                        )
                      : Image.network(
                          fit: _boxFit,
                          url!,
                        ),
                ),
              )
            : Container(),
      ),
    );
  }
}
