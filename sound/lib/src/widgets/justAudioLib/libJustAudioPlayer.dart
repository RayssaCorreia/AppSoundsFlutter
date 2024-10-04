import 'package:flutter/material.dart';

import 'player.dart';
import 'playlistPlayers.dart';

class LibJustAudio extends StatefulWidget {
  const LibJustAudio({super.key});

  @override
  State<LibJustAudio> createState() => _LibJustAudioState();
}

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class _LibJustAudioState extends State<LibJustAudio> {
  final ButtonStyle style =
  ElevatedButton.styleFrom(
    backgroundColor: const Color(0xff00dbff),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'ASSETS AUDIO PLAYER'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 800,
            height: 10000,
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  style: style,
                  child: const Text('Player',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Player()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Playlist Players',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlaylistPlayers()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
