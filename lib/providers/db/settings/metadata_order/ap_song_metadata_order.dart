import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../db/settings/metadata_order/ap_song_metadata.dart';
import '../../app_isar.dart';

export '../../../../db/settings/metadata_order/ap_song_metadata.dart'
    show
        ApSongStandardMetadataInfo,
        ApSongClassicalMetadataInfo,
        ApSongStandardMetadata,
        ApSongClassicalMetadata;

part 'ap_song_metadata_order.g.dart';

@riverpod
class ApSongStandardMetadataOrderSetting
    extends _$ApSongStandardMetadataOrderSetting {
  @override
  Future<List<ApSongStandardMetadataInfo>> build() async {
    return ref
        .watch(_currentSettingProvider.future)
        .then((v) => v.standardInfoList);
  }

  Future<void> updateList(List<ApSongStandardMetadataInfo> newList) async {
    ref.watch(_settingsProvider.notifier).updateCurrent(
          standardInfoList: newList,
        );
  }
}

@riverpod
class ApSongClassicalMetadataOrderSetting
    extends _$ApSongClassicalMetadataOrderSetting {
  @override
  Future<List<ApSongClassicalMetadataInfo>> build() async {
    return ref
        .watch(_currentSettingProvider.future)
        .then((v) => v.classicalInfoList);
  }

  Future<void> updateList(List<ApSongClassicalMetadataInfo> newList) async {
    ref.watch(_settingsProvider.notifier).updateCurrent(
          classicalInfoList: newList,
        );
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

  Future<void> updateCurrent({
    List<ApSongStandardMetadataInfo>? standardInfoList,
    List<ApSongClassicalMetadataInfo>? classicalInfoList,
  }) async {
    final current = await ref.read(_currentSettingProvider.future);
    put(
      id: current.id,
      standardInfoList: standardInfoList,
      classicalInfoList: classicalInfoList,
    );
  }

  Future<void> put({
    int? id,
    bool? classicalFirst,
    List<ApSongStandardMetadataInfo>? standardInfoList,
    List<ApSongClassicalMetadataInfo>? classicalInfoList,
  }) async {
    final current = await ref.read(_currentSettingProvider.future);

    final appIsar = ref.watch(appIsarProvider);
    appIsar.writeTxn(() async {
      appIsar.apSongMetadataOrderSettingCollections.put(
          ApSongMetadataOrderSettingCollection()
            ..id = id
            ..classicalFirst = classicalFirst ?? current.classicalFirst
            ..standardInfoList = standardInfoList ?? current.standardInfoList
            ..classicalInfoList =
                classicalInfoList ?? current.classicalInfoList);
    });
    ref.invalidateSelf();
  }
}
