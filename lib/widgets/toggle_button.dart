
import 'package:chatbot_prj/widgets/text_and_voice_field.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;
  final VoidCallback _sendVoiceMessage;
  final InputMode _inputMode;
  final bool _isReplying;
  final bool _isListening;
  //bool variable if is speeking or not 
  final bool isSpeaking;
  final VoidCallback speak;
  // var of lastext should speek it 
  final String lastSpokenText;
  final VoidCallback stopSpeaking;

  const ToggleButton({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendTextMessage,
    required VoidCallback sendVoiceMessage,
    required bool isReplying,
    required bool isListening,
    required this.isSpeaking,
    required this.stopSpeaking,
    required this.speak,
    required this.lastSpokenText,
  })  : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _sendVoiceMessage = sendVoiceMessage,
        _isReplying = isReplying,
        _isListening = isListening;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // The existing ElevatedButton for sending messages or starting/stopping voice input
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {
            if (widget._isReplying) {
              // If the system is in a replying state, do nothing (or handle accordingly)
              return;
            } else if (widget.isSpeaking) {
              // If currently speaking, stop speaking
              widget.stopSpeaking();
              widget._sendVoiceMessage();


            } else {
              // Handle input mode actions
              if (widget._inputMode == InputMode.text) {
                widget._sendTextMessage();
              } else {
                widget._sendVoiceMessage();
              }
            }
          },
          child: Icon(
            widget._inputMode == InputMode.text
                ? Icons.send
                : widget._isListening || widget.isSpeaking // Adjusted to check if speaking
                ? Icons.mic
                : Icons.mic_off,
          ),
        ),
        // Add this IconButton for the stop functionality
        if (widget._isListening ||
            widget._inputMode ==
                InputMode.voice) // Show the button conditionally
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon:
              //icon of stop 
                  Icon(widget.isSpeaking ? Icons.volume_up : Icons.volume_off),
              onPressed: () {
                if (widget.isSpeaking) {
                  widget.stopSpeaking();
                } else {
                  if (widget.lastSpokenText.isNotEmpty) {
                    widget.speak();
                  }
                }
              },
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
              ),
            ),
          )
      ],
    );
  }
}
