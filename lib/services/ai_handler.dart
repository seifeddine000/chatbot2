
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<String> getResponse(String message) async {
    try {
      final request = CompleteText(prompt: message,maxTokens: 250, model: AdaModel());
      final response = await _openAI.onCompletion(request: request);
      if (response != null) {
        return response.choices[0].text.trim();
      }
      return 'some thing went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }

  void dispose() {}
}
