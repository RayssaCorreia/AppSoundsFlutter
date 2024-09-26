import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sound',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlayAudio(),
    );
  }
}


class PlayAudio extends StatefulWidget {
  const PlayAudio({super.key});

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: () {
        playSound();
      },
        child: const Text("Press me")
    );
  }
  void playSound() {
  String audioPath = "audio/sound.mp3";
  }
}
