import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/db/settings/metadata/ap_song.dart';
import '../../../translations.g.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongMetadataOrderSettingPage extends HookConsumerWidget {
  const SongMetadataOrderSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsFuture =
        useFuture(ref.read(apSongMetadataSettingProvider.future));
    return PageScaffold(
      appBarTitle: const Text("Metadata Order - Song"),
      body: !settingsFuture.hasData
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : settingsFuture.hasError
              ? Center(
                  child: Text(settingsFuture.error.toString()),
                )
              : _afterSettingsLoaded(
                  context,
                  ref,
                  settingsFuture.data!,
                ),
    );
  }

  Widget _afterSettingsLoaded(
    BuildContext context,
    WidgetRef ref,
    ApSongMetadataSettingCollection setting,
  ) {
    final orderState = useState(setting.order.toList());
    final common = ref.watch(commonValuesProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Area(
            child: FilledCard(
              margin: EdgeInsets.symmetric(
                horizontal: common.size.insetsLarge,
              ),
              child: ReorderableListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = orderState.value.removeAt(oldIndex);
                  orderState.value.insert(newIndex, item);
                  ref
                      .read(apSongMetadataSettingProvider.notifier)
                      .updateOrder(orderState.value);
                },
                children: orderState.value.mapWithIndex(
                  (e, index) {
                    return ListTile(
                      key: Key(e.type.name),
                      title: Text(e.type.name),
                      trailing: Platform.isIOS || Platform.isMacOS
                          ? Icon(
                              Icons.drag_handle_rounded,
                              size: common.size.infoIcon,
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
