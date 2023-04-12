import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../db/settings/metadata/ap_song.dart';
import '../../app_isar.dart';

part 'ap_song.g.dart';

@riverpod
class ApSongMetadataSetting extends _$ApSongMetadataSetting {
  @override
  Future<List<ApSongMetadataInfo>> build() async {
    return ref.watch(_currentSettingProvider.future).then((v) => v.order);
  }

  Future<void> updateOrder(List<ApSongMetadataInfo> newOrder) async {
    ref.watch(_settingsProvider.notifier).updateCurrent(newOrder);
  }
}

@riverpod
class _CurrentSetting extends _$CurrentSetting {
  @override
  Future<ApSongMetadataSettingCollection> build() async {
    return ref.watch(_settingsProvider.future).then((value) => value.last);
  }
}

@riverpod
class _Settings extends _$Settings {
  @override
  Future<List<ApSongMetadataSettingCollection>> build() async {
    final list = await ref
        .watch(appIsarProvider)
        .apSongMetadataSettingCollections
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
      appIsar.apSongMetadataSettingCollections
          .put(ApSongMetadataSettingCollection()
            ..id = id
            ..order = order);
    });
    ref.invalidateSelf();
  }
}
