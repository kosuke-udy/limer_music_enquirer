import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_parts/m3_cards.dart';
import '../../common_values/common_values.dart';

class ResourceCard extends HookConsumerWidget {
  const ResourceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return FilledCard(
      margin: EdgeInsets.only(
        right: common.size.screenPadding,
        bottom: common.size.screenPadding,
      ),
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
