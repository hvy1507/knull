import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/data/model/message.model.dart';

part 'gemini.state.freezed.dart';

@freezed
class GeminiState with _$GeminiState {
  const factory GeminiState({
    @Default(Status.idle) Status status,
    @Default([]) List<Message> messages,
  }) = _GeminiState;
}
