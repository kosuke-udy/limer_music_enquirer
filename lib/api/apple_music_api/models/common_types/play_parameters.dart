import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_parameters.freezed.dart';
part 'play_parameters.g.dart';

@freezed
class PlayParameters with _$PlayParameters {
  const factory PlayParameters({
    required String id,
    required String kind,
    bool? reporting,
    String? catalogId,
  }) = _PlayParameters;

  factory PlayParameters.fromJson(Map<String, dynamic> json) =>
      _$PlayParametersFromJson(json);
}
