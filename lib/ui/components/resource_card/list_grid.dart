import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';

import 'list_card.dart';

class ResourceCardGridList extends ConsumerWidget {
  final List<ResourceKind> resources;

  const ResourceCardGridList({
    Key? key,
    required this.resources,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return Padding(
      padding: EdgeInsets.only(
        left: common.size.screenPadding,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
