import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class LibAudioPlayers extends StatefulWidget {
  const LibAudioPlayers({super.key});

  @override
  State<LibAudioPlayers> createState() => _LibAudioPlayersState();
}

class _LibAudioPlayersState extends State<LibAudioPlayers> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sound',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sounds'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    audioRecord = Record();
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async{
    try{
      if(await audioRecord.hasPermission()){
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });

      }
    }
    catch(error){
      print("Error Start Recording: $error");
    }
  }

  Future<void> stopRecording() async{
    try{
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    }
    catch(error){
      print("Error Stopping record: $error");
    }
  }

  Future<void> playRecording() async{
    try{
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    }

    catch(error){
      print('Error playing Recording: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(isRecording)
               Text(
                'Recording in Progress',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ElevatedButton(
                onPressed: isRecording ? stopRecording :startRecording,
                child: isRecording ? const Text('Stop') : const Text('Start')
            ),
            SizedBox(
              height: 25,
            ),
            if(!isRecording && audioPath != null)
              ElevatedButton(
                onPressed: playRecording,
                child: const Text("Play"),
              ),
          ],
        ),
      ),
    );
  }
}
