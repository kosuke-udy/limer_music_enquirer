import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import '../common_values/common_values.dart';

class Area extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final Widget? headline;
  final Widget child;

  /* ---------- Constructor ---------- */

  const Area({
    Key? key,
    this.headline,
    required this.child,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        bottom: common.size.insetsMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (headline != null) headline!,
          child,
        ],
      ),
    );
  }
}
