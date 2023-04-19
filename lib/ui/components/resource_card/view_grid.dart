import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_values/common_values.dart';

import 'card_resource.dart';

class ResourceCardGridView extends ConsumerWidget {
  const ResourceCardGridView({
    Key? key,
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
          crossAxisCount: 2, // 横方向のウィジェット数
        ),
        itemCount: 4, // ウィジェット数
        itemBuilder: (BuildContext context, int index) {
          return const ResourceCard();
        },
      ),
    );
  }
}
