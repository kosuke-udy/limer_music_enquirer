import 'package:freezed_annotation/freezed_annotation.dart';

part 'editorial_notes.freezed.dart';
part 'editorial_notes.g.dart';

@freezed
class EditorialNotes with _$EditorialNotes {
  const factory EditorialNotes({
    String? short,
    String? standard,
    String? name,
    String? tagline,
  }) = _EditorialNotes;

  factory EditorialNotes.fromJson(Map<String, dynamic> json) =>
      _$EditorialNotesFromJson(json);
}
