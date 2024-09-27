import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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

      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget{
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final player = AudioPlayer();

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2,"0")}";
  }

  void handlePlayPause() {
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
    player.setUrl('https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3');
    // player.setFilePath('sounds/Herege.mp3');

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
              'Audio Player'
          ),
        ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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



//
// class PlayAudio extends StatefulWidget {
//   const PlayAudio({super.key});
//
//   @override
//   State<PlayAudio> createState() => _PlayAudioState();
// }
//
// class _PlayAudioState extends State<PlayAudio> {
//   final player = AudioPlayer();
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         playSound();
//       },
//         child: const Text("Press me")
//     );
//   }
//
//   Future<void> playSound() async {
//     String audioPath = "sounds/sound2.mp3";
//     await player.play(AssetSource(audioPath));
//   }
//
// }
