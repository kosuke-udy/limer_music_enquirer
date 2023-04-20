import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';

import 'view_card.dart';

class ResourceCardGridView extends ConsumerWidget {
  static const int _crossAxisCount = 2;

  /* ---------- Properties ---------- */

  final List<ResourceKind> resources;

  /* ---------- Constructor ---------- */

  const ResourceCardGridView({
    Key? key,
    required this.resources,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    final inset = common.size.screenPadding;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - inset * 3) / _crossAxisCount;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: inset,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          mainAxisSpacing: inset,
          crossAxisSpacing: inset,
        ),
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return ResourceCard(
            resource: resources[index],
          );
        },
      ),
    );
  }
}
