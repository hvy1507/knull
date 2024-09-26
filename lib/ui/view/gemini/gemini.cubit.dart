import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/data/model/message.model.dart';
import 'package:skeleton/ui/view/gemini/gemini.state.dart';

class GeminiCubit extends Cubit<GeminiState> {
  GeminiCubit() : super(const GeminiState());

  final TextEditingController controller = TextEditingController();

  Future<void> getResponse() async {
    if (controller.text.isEmpty) return;

    final userMessage = Message(text: controller.text, isUser: true);
    emit(state.copyWith(
      status: Status.loading,
      messages: [...state.messages, userMessage],
    ));

    try {
      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: 'AIzaSyBKpiSNAiClQHjtwqs9v5JILx1D1KWk_ZA'
      );
      final prompt = controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      final assistantMessage = Message(
        text: response.text!,
        isUser: false,
      );
      emit(
        state.copyWith(
          status: Status.loaded,
          messages: [...state.messages, assistantMessage],
        ),
      );
      controller.clear();
    } catch (e) {
      emit(
        state.copyWith(status: Status.error),
      );
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
