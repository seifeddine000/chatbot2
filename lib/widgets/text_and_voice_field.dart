
import 'package:chatbot_prj/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../models/chat_model.dart';
import '../providers/chat_provider.dart';
import '../services/ai_handler.dart';
import '../services/voice_handler.dart';

enum InputMode {
  text,
  voice,
}

class TextAndVoiceField extends ConsumerStatefulWidget {
  const TextAndVoiceField({super.key});

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  InputMode _inputMode = InputMode.voice;
  final _messageController = TextEditingController();
  final AIHandler _openAI = AIHandler();
  final VoiceHandler voiceHandler = VoiceHandler();
  //tts
  final FlutterTts flutterTts = FlutterTts();

  var _isReplying = false;
  var _isListening = false;
  //vars for stop the speek 
  bool _isSpeaking = false;
  String _lastSpokenText = '';



  @override
  void initState() {
    //tts
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
    voiceHandler.initSpeech();
    super.initState();
    // handl of icon 
    flutterTts.setCompletionHandler(() {
  if (_isSpeaking) {
    setState(() {
      _isSpeaking = false;
    });
  }
});
  }

  @override
  void dispose() {
    //tts
    flutterTts.stop();

    _messageController.dispose();
    _openAI.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (value) {
              value.isNotEmpty
                  ? setInputMode(InputMode.text)
                  : setInputMode(InputMode.voice);
            },
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none

              ),
            ),
          ),

        ),
        const SizedBox(
          width: 06,
          height: 70,
        ),

        ToggleButton(
          // last spoken and isspeaking 
          speak: () => speak(_lastSpokenText),
          lastSpokenText: _lastSpokenText,
          isSpeaking: _isSpeaking,
          //
          stopSpeaking: stopSpeaking,
          isListening: _isListening,
          isReplying: _isReplying,
          inputMode: _inputMode,
          sendTextMessage: () {
            final message = _messageController.text;
            _messageController.clear();
            sendTextMessage(message);
          },
          sendVoiceMessage: sendVoiceMessage,
        )
        // ... Add other children if needed
      ],
    ); // Row
  }

//tts
  void speak(String message) async {
  if (!_isSpeaking && _lastSpokenText.isNotEmpty) {
    await flutterTts.speak(_lastSpokenText);
    setState(() {
      _isSpeaking = true;
    });
  }
}
//stop speeking 
void stopSpeaking() async {
  if (_isSpeaking) {
    await flutterTts.stop();
    setState(() {
      _isSpeaking = false;
    });
  }
}


  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }
//send voice 
  void sendVoiceMessage() async {
    if (voiceHandler.speechToText.isListening) {
      await voiceHandler.stopListening();
      setListeningState(false);
    } else {
      setListeningState(true);
      final result = await voiceHandler.startListening();
      setListeningState(false);
      sendTextMessage(result);
    }
  }
//send text 
  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToChatList(message, true, DateTime.now().toString());
    addToChatList('Typing...', false, 'typing');
    setInputMode(InputMode.voice);
    final aiResponse = await _openAI.getResponse(message);
    _lastSpokenText = aiResponse; 
    removeTyping();
    addToChatList(aiResponse, false, DateTime.now().toString());
    speak(aiResponse); // This will read aloud the response from OpenAI
    setReplyingState(false);
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }

  void addToChatList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(ChatModel(
      id: id,
      message: message,
      isMe: isMe,
    ));
  }
}
