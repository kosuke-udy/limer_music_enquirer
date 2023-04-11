import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reorderables/reorderables.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/db/settings/metadata_order/ap_song_metadata_order.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/components.dart';

class SongMetadataOrderSettingPage extends HookConsumerWidget {
  const SongMetadataOrderSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final standardResult = useFuture(
      ref.read(apSongStandardMetadataOrderSettingProvider.future),
    );

    final classicalResult = useFuture(
      ref.read(apSongClassicalMetadataOrderSettingProvider.future),
    );

    return PageScaffold(
      appBarTitle: const Text("Metadata Order: Song"),
      body: standardResult.hasData && classicalResult.hasData
          ? _build(
              context,
              ref,
              standardResult.data!,
              classicalResult.data!,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _build(
    BuildContext context,
    WidgetRef ref,
    List<ApSongStandardMetadataInfo> standardList,
    List<ApSongClassicalMetadataInfo> classicalList,
  ) {
    final common = ref.watch(commonValuesProvider);

    return RefreshableListView(
      children: [
        Area(
          headline: const Headline(
            "Standard Attributes",
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
                final item = standardList.removeAt(oldIndex);
                standardList.insert(newIndex, item);
                ref
                    .watch(apSongStandardMetadataOrderSettingProvider.notifier)
                    .updateList(standardList);
              },
              children: standardList.map(
                (e) {
                  return ListTile(
                    key: Key(e.data.index.toString()),
                    title: Text(e.data.name),
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
        Area(
          headline: const Headline(
            "Classical Attributes",
          ),
          child: ReorderableListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
            ),
            onReorder: (oldIndex, newIndex) {},
            itemCount: 10,
            itemBuilder: (context, index) {
              return FilledCard(
                key: ValueKey(index),
                margin: EdgeInsets.symmetric(
                  vertical: common.size.insetsSmall,
                ),
                child: ListTile(
                  title: Text("Item $index"),
                  trailing: Icon(
                    Icons.drag_handle_rounded,
                    size: common.size.infoIcon,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
