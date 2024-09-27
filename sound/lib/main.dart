import 'package:flutter/material.dart';
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
    return ElevatedButton(
      onPressed: () {
        playSound();
      },
        child: const Text("Press me")
    );
  }

  Future<void> playSound() async {
    String audioPath = "sounds/sound2.mp3";
    await player.play(AssetSource(audioPath));
  }

}
