import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../db/settings/metadata_order/ap_song.dart';
import '../../app_isar.dart';

part 'ap_song_metadata_order.g.dart';

@riverpod
class ApSongMetadataOrderSetting extends _$ApSongMetadataOrderSetting {
  @override
  Future<List<ApSongMetadataInfo>> build() async {
    return ref.watch(_currentSettingProvider.future).then((v) => v.order);
  }

  Future<void> updateList(List<ApSongMetadataInfo> newOrder) async {
    ref.watch(_settingsProvider.notifier).updateCurrent(newOrder);
  }
}

@riverpod
class _CurrentSetting extends _$CurrentSetting {
  @override
  Future<ApSongMetadataOrderSettingCollection> build() async {
    return ref.watch(_settingsProvider.future).then((value) => value.last);
  }
}

@riverpod
class _Settings extends _$Settings {
  @override
  Future<List<ApSongMetadataOrderSettingCollection>> build() async {
    final list = await ref
        .watch(appIsarProvider)
        .apSongMetadataOrderSettingCollections
        .where()
        .findAll();
    return list;
  }

  Future<void> updateCurrent(List<ApSongMetadataInfo> newOrder) async {
    final current = await ref.read(_currentSettingProvider.future);
    put(
      id: current.id,
      order: newOrder,
    );
  }

  Future<void> put({
    int? id,
    required List<ApSongMetadataInfo> order,
  }) async {
    final appIsar = ref.watch(appIsarProvider);
    appIsar.writeTxn(() async {
      appIsar.apSongMetadataOrderSettingCollections
          .put(ApSongMetadataOrderSettingCollection()
            ..id = id
            ..order = order);
    });
    ref.invalidateSelf();
  }
}
