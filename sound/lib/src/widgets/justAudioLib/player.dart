import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 24,
    color: Colors.green,
    fontWeight: FontWeight.bold,
  );
}

class _PlayerState extends State<Player> {
  final player = AudioPlayer();
  final player2 = AudioPlayer();

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2,"0")}";
  }

  void handlePlayPause( ) {
    if(player.playing){
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.setAsset('assets/beep/BPM120140-R651-Scifi.mp3');
    player.positionStream.listen((p) {
      setState(() => position = p);
    });

    player.durationStream.listen((d) {
      setState(() => duration = d!);
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'PLAYER'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('1',
              style: CustomTextStyle.nameOfTextStyle,
            ),
            Text(formatDuration(position)),
            Slider(
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: handleSeek,
            ),
            Text(formatDuration(duration)),
            IconButton(
              icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
              onPressed: handlePlayPause,
            ),
          ],
        ),
      ),
    );
  }
}
