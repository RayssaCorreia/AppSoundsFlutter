import 'package:flutter/material.dart';


import 'src/widgets/assetsAudioPlayerLib/libAssetsAudioPlayer.dart';
import 'src/widgets/justAudioLib/libJustAudioPlayer.dart';
import 'src/widgets/audioPlayersLib/libAudioPlayers.dart';
import 'src/widgets/soundGenerator/libSoundGenerator.dart';
import 'src/widgets/flutterBeepLib/libFlutterBeep.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'beep',
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

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class _HomeState extends State<Home> {
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
            'LIBRARIES OF SOUNDS'
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
                  child: const Text('Assets Audio player',
                  style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibAssetsAudioPlayer()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Just Audio',
                  style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibJustAudio()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Audio Players',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibAudioPlayers()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Sound Generator',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibSoundGenerator()),
                    );
                  },
                ),
                ElevatedButton(
                  style: style,
                  child: const Text('Flutter Beep',
                    style: CustomTextStyle.nameOfTextStyle,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LibFlutterBeep()),
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


