import 'dart:io';

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/db/settings/metadata/ap_song.dart';
import '../../../translations.g.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

<<<<<<< Updated upstream
class SongMetadataOrderSettingPage extends HookConsumerWidget {
=======
class SongMetadataOrderSettingPage extends ConsumerWidget {
>>>>>>> Stashed changes
  const SongMetadataOrderSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
<<<<<<< Updated upstream
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
              : _afterPreloaded(
                  context,
                  ref,
                  settingsFuture.data!,
                ),
=======
    final asyncSettings = ref.watch(apSongMetadataSettingProvider);

    return PageScaffold(
      isAllowedToPopScreen: true,
      appBarTitle: const Text("Metadata Order - Song"),
      body: asyncSettings.when(
        data: (data) => _afterPreloaded(context, ref, data),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
      ),
>>>>>>> Stashed changes
    );
  }

  Widget _afterPreloaded(
    BuildContext context,
    WidgetRef ref,
    ApSongMetadataSettingCollection setting,
  ) {
<<<<<<< Updated upstream
    final orderState = useState(setting.order.toList());
=======
    // final orderState = useState(setting.order.toList());
    final order = setting.order.toList();
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                  final item = orderState.value.removeAt(oldIndex);
                  orderState.value.insert(newIndex, item);
                  ref
                      .read(apSongMetadataSettingProvider.notifier)
                      .updateOrder(orderState.value);
                },
                children: orderState.value.mapWithIndex(
=======
                  final item = order.removeAt(oldIndex);
                  order.insert(newIndex, item);
                  ref
                      .watch(apSongMetadataSettingProvider.notifier)
                      .updateOrder(order);
                },
                children: order.mapWithIndex(
>>>>>>> Stashed changes
                  (e, index) {
                    return ListTile(
                      key: Key(e.type.name),
                      title: Text(t.metadata.song(type: e.type)),
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
