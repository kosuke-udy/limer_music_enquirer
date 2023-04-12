import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reorderables/reorderables.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/db/settings/metadata/ap_song.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongMetadataOrderSettingPage extends HookConsumerWidget {
  const SongMetadataOrderSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load the setting once
    final asyncSetting = ref.read(apSongMetadataSettingProvider);
    final isLoading = asyncSetting.isLoading;
    final hasError = asyncSetting.hasError;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : hasError
            ? Center(
                child: Text(asyncSetting.error.toString()),
              )
            : _afterSettingsLoaded(
                context,
                ref,
                asyncSetting.value!,
              );
  }

  Widget _afterSettingsLoaded(
    BuildContext context,
    WidgetRef ref,
    ApSongMetadataSettingCollection setting,
  ) {
    final order = setting.order;

    final common = ref.watch(commonValuesProvider);

    return RefreshableListView(
      children: [
        Area(
          headline: const Headline(
            "Order",
          ),
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
            ),
            child: ReorderableColumn(
              ignorePrimaryScrollController: true,
              reorderAnimationDuration: Duration.zero,
              onReorder: (oldIndex, newIndex) {
                // final newList = list.toList();
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = order.removeAt(oldIndex);
                order.insert(newIndex, item);
                ref
                    .watch(apSongMetadataSettingProvider.notifier)
                    .updateOrder(order);
              },
              children: order.map(
                (e) {
                  return ListTile(
                    key: Key(e.type.index.toString()),
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
      ],
    );
  }
}
