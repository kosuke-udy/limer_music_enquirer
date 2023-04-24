import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';

import 'list_card.dart';

class ResourceCardVerticalList extends ConsumerWidget {
  static const int _crossAxisCount = 2;
  static const double _cardTextAreaHeight = 56;

  /* ---------- Properties ---------- */

  final List<ResourceKind> resources;

  /* ---------- Constructor ---------- */

  const ResourceCardVerticalList({
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
      child: Column(
        children: resources.map(
          (e) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: inset,
              ),
              child: ResourceListCard(
                resource: e,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
