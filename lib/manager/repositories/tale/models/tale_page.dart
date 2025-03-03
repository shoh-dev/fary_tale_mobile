// TalePage Model
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tale_interaction.dart';

part 'tale_page.g.dart';
part 'tale_page.freezed.dart';

@freezed
class TalePage with _$TalePage {
  const TalePage._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TalePage({
    required String id,
    required String taleId,
    required int pageNumber,
    required String text,
    required String backgroundImage,
    String? backgroundAudio,
    @Default([]) List<TaleInteraction> taleInteractions,
  }) = _TalePage;

  static const empty = TalePage(
    id: '',
    taleId: '',
    pageNumber: 0,
    text: '',
    backgroundImage: '',
    taleInteractions: [],
  );

  factory TalePage.fromJson(Map<String, dynamic> json) => _$TalePageFromJson(json);

  //updateInteractionMethod
  TalePage updateInteraction(TaleInteraction interaction) {
    final interactions = List<TaleInteraction>.from(taleInteractions);
    final index = interactions.indexWhere((element) => element.id == interaction.id);
    if (index != -1) {
      interactions[index] = interaction;
    }
    return copyWith(taleInteractions: interactions);
  }
}
