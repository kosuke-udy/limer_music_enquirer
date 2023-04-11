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
class ApSongStandardMetadataOrder extends _$ApSongStandardMetadataOrder {
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
class ApSongClassicalMetadataOrder extends _$ApSongClassicalMetadataOrder {
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
  Future<ApSongMetadataOrderSetting> build() async {
    return ref.watch(_settingsProvider.future).then((value) => value.last);
  }
}

@riverpod
class _Settings extends _$Settings {
  @override
  Future<List<ApSongMetadataOrderSetting>> build() async {
    final list = await ref
        .watch(appIsarProvider)
        .apSongMetadataOrderSettings
        .where()
        .findAll();
    return list;
  }

  Future<void> updateCurrent({
    List<ApSongStandardMetadataInfo>? standardInfoList,
    List<ApSongClassicalMetadataInfo>? classicalInfoList,
  }) async {
    put(
      standardInfoList: standardInfoList,
      classicalInfoList: classicalInfoList,
    );
  }

  Future<void> put({
    int? index,
    List<ApSongStandardMetadataInfo>? standardInfoList,
    List<ApSongClassicalMetadataInfo>? classicalInfoList,
  }) async {
    final current = await ref.read(_currentSettingProvider.future);

    final newStandard = standardInfoList != null
        ? getMetadataValuesAndVisibilities(standardInfoList)
        : null;

    final newClassical = classicalInfoList != null
        ? getMetadataValuesAndVisibilities(classicalInfoList)
        : null;

    final appIsar = ref.watch(appIsarProvider);
    appIsar.writeTxn(() async {
      appIsar.apSongMetadataOrderSettings.put(ApSongMetadataOrderSetting()
        ..id = index
        ..standardValues = newStandard?.first ?? current.standardValues
        ..standardVisibilities =
            newStandard?.second ?? current.standardVisibilities
        ..classicalValues = newClassical?.first ?? current.classicalValues
        ..classicalVisibilities =
            newClassical?.second ?? current.classicalVisibilities);
    });
    ref.invalidateSelf();
  }
}
