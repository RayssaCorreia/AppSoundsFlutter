import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class LibFlutterBeep extends StatefulWidget {
  const LibFlutterBeep({super.key});

  @override
  State<LibFlutterBeep> createState() => _LibFlutterBeepState();
}

class _LibFlutterBeepState extends State<LibFlutterBeep> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Beep Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("Beep Success"),
                onPressed: () => FlutterBeep.beep(),
              ),
              ElevatedButton(
                child: Text("Beep Fail"),
                onPressed: () => FlutterBeep.beep(false),
              ),
              ElevatedButton(
                child: Text("Beep Android Custom"),
                onPressed: () => FlutterBeep.playSysSound(
                    AndroidSoundIDs.TONE_CDMA_ABBR_ALERT),
              ),
              ElevatedButton(
                child: Text("Beep something"),
                onPressed: () => FlutterBeep.playSysSound(41),
              ),
              ElevatedButton(
                child: Text("Beep iOS Custom"),
                onPressed: () =>
                    FlutterBeep.playSysSound(iOSSoundIDs.AudioToneBusy),
              ),
            ],
          ),
        ),
      ),
    );
  }
}