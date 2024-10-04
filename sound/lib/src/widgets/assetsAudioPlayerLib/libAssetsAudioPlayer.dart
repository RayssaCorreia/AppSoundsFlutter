import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'multiAudioPlayers.dart';
import 'multiAudioPlayers2.dart';

class LibAssetsAudioPlayer extends StatefulWidget {
  const LibAssetsAudioPlayer({super.key});

  @override
  State<LibAssetsAudioPlayer> createState() => _LibAssetsAudioPlayerState();
}

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class _LibAssetsAudioPlayerState extends State<LibAssetsAudioPlayer> {

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
                  child: const Text('Multi Audio Players',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MultiAudioPlayers()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Multi Audio Players 2',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MultiPlayerAudio2()),
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
