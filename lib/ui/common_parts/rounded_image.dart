import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui_constants/ui_constants.dart';

class RoundedImage extends ConsumerWidget {
  late final ImageProvider<Object>? imageProvider;
  late final String? url;
  final double size;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    final radius = constants.radius.medium;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: imageProvider != null || url != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(radius - 1),
                child: imageProvider != null
                    ? Image(
                        fit: BoxFit.cover,
                        image: imageProvider!,
                      )
                    : Image.network(
                        fit: BoxFit.cover,
                        url!,
                      ),
              )
            : Container(),
      ),
    );
  }
}
