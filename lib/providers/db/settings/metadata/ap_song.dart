import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../db/settings/metadata/ap_song.dart';
import '../../app_isar.dart';

export '../../../../db/settings/metadata/ap_song.dart';

part 'ap_song.g.dart';

@riverpod
class ApSongMetadataSetting extends _$ApSongMetadataSetting {
  @override
  Future<ApSongMetadataSettingCollection> build() async {
    return ref.watch(_settingsProvider.future).then((value) => value.last);
  }

  // Update the order of the metadata.
  Future<void> updateOrder(List<ApSongMetadataInfo> newOrder) async {
    ref.watch(_settingsProvider.notifier).updateCurrent(newOrder);
  }
}

@Riverpod(keepAlive: true)
class _Settings extends _$Settings {
  @override
  Future<List<ApSongMetadataSettingCollection>> build() async {
    final appIsar = await ref.watch(appIsarProvider.future);
    final list =
        await appIsar.apSongMetadataSettingCollections.where().findAll();

    // If the list is empty, create a new one with the default order.
    if (list.isEmpty) {
      put(
        order: ApSongMetadataType.defaultOrder
            .map((e) => ApSongMetadataInfo()
              ..type = e
              ..isVisible = true)
            .toList(),
      );

      return build();
    }

    return list;
  }

  // Update the current collection.
  Future<void> updateCurrent(List<ApSongMetadataInfo> newOrder) async {
    final current = await ref.read(apSongMetadataSettingProvider.future);
    put(
      id: current.id,
      order: newOrder,
    );
  }

  // Put a new collection into the database.
  Future<void> put({
    int? id,
    required List<ApSongMetadataInfo> order,
  }) async {
    final appIsar = await ref.watch(appIsarProvider.future);
    appIsar.writeTxn(() async {
      appIsar.apSongMetadataSettingCollections
          .put(ApSongMetadataSettingCollection()
            ..id = id
            ..order = order);
    });
    ref.invalidateSelf();
  }
}
