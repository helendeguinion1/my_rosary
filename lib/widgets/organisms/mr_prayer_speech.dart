import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

enum TtsState { playing, stopped, paused, continued }

class MrPrayerSpeech extends StatefulWidget {
  const MrPrayerSpeech({
    required this.prayer,
    Key? key,
    required this.checkDonePlaying,
  }) : super(key: key);

  final String prayer;
  final Function(bool) checkDonePlaying;
  @override
  State<MrPrayerSpeech> createState() => _MrPrayerSpeechState();
}

class _MrPrayerSpeechState extends State<MrPrayerSpeech> {
  final String defaultLanguage = 'en-US';
  late FlutterTts flutterTts;
  String text =
      'Hail Mary, full of grace. The Lord is with thee. Blessed art thou amongst women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death, Amen.';
  double volume = 1;
  double rate = 0.4;
  double pitch = 1.0;
  String? language;
  String? languageCode;
  List<String> languages = <String>[];
  List<String> languageCodes = <String>[];
  late Map<String, String> voice;

  TtsState ttsState = TtsState.stopped;

  bool get isPlaying => ttsState == TtsState.playing;
  bool get isStopped => ttsState == TtsState.stopped;
  bool get isPaused => ttsState == TtsState.paused;
  bool get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initTts();
    });
  }

  dynamic initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
      widget.checkDonePlaying(false);
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
      widget.checkDonePlaying(true);
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<void> _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future<void> _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {
      setState(() => ttsState = TtsState.stopped);
    }
    widget.checkDonePlaying(true);
  }

  Future<void> _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  Future<void> _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future<void> _speak() async {
    await flutterTts.setVoice(voice);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    await flutterTts.speak(widget.prayer);
  }

  Future<void> _getDefaultVoice() async {
    var voices = await flutterTts.getVoices;
    if (voices != null) {
      setState(() {
        voice = voices[14].cast<String, String>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MrText(
          text: 'Pray with Audio',
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.teal,
          fontStyle: FontStyle.italic,
        ),
        Row(
          children: [
            isPlaying
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 215, 243, 241),
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(24)),
                      child: IconButton(
                          onPressed: _pause,
                          icon: const Icon(
                            Icons.pause,
                            size: 32,
                            color: Colors.teal,
                          )),
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 243, 241),
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(24)),
              child: IconButton(
                  onPressed: isPlaying || isContinued ? _stop : _speak,
                  icon: isPlaying || isContinued
                      ? const Icon(
                          Icons.stop,
                          color: Color.fromARGB(255, 240, 105, 96),
                          size: 32,
                        )
                      : const Icon(
                          Icons.play_arrow_outlined,
                          size: 32,
                          color: Colors.teal,
                        )),
            )
          ],
        )
      ],
    );
  }
}
