import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui_constants/ui_constants.dart';

class ClippedText extends ConsumerWidget {
  final String data;
  final TextStyle? style;

  const ClippedText(
    this.data, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    final textColor = style?.color ?? constants.theme.colorScheme.onSurface;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: const Alignment(1.0, 0),
                end: const Alignment(0.7, 0),
                colors: [
                  textColor.withOpacity(1),
                  textColor.withOpacity(0.9),
                  textColor.withOpacity(0),
                ],
                stops: const [0.0, 0.2, 1.0],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: ClipPath(
              clipper: _TextClipper(),
              child: Text(
                data,
                style: style,
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TextClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
