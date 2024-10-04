import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'model/PlayingControlsSmall.dart';
import 'model/PositionSeekWidget.dart';
import 'model/MyAudio.dart';

class MultiPlayerAudio2 extends StatefulWidget {
  const MultiPlayerAudio2({super.key});

  @override
  State<MultiPlayerAudio2> createState() => _MultiPlayerAudio2State();
}

class _MultiPlayerAudio2State extends State<MultiPlayerAudio2> {

  final audios = <MyAudio>[
    MyAudio(
        name: 'Triangle',
        audio: Audio('assets/beep/BPM+30-8BitTriangle.mp3'),
        imageUrl:
        'https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg'),
    MyAudio(
        name: 'Plus Scifi',
        audio: Audio('assets/beep/BPM120140-R651-Scifi.mp3'),
        imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81M1U6GPKEL._SL1500_.jpg'),
    MyAudio(
        name: 'Scifi',
        audio: Audio('assets/beep/BPM120-R61-Scifi.mp3'),
        imageUrl: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg'),
    MyAudio(
        name: 'Square',
        audio: Audio('assets/beep/BPM120-R61-8BitSquare.mp3'),
        imageUrl:
        'https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg '),
    MyAudio(
        name: 'Sine',
        audio: Audio('sound/assets/beep/BPM120-R61-8BitSine.mp3'),
        imageUrl:
        'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
    MyAudio(
        name: '8bit Triangle',
        audio: Audio('sound/assets/beep/BPM120-R61-8BitTriangle.mp3'),
        imageUrl: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg'),
  ];

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.playlistFinished.listen((data) {
      print('finished : $data');
    });

    _assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    });

    _assetsAudioPlayer.current.listen((data) {
      print('current : $data');
    });

  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  MyAudio find(List<MyAudio> source, String fromPath) {
    return source.firstWhere((element) => element.audio.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Column(
                children: audios
                    .map(
                      (e) => PlayerWidget(
                    myAudio: e,
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  final MyAudio myAudio;

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();

  const PlayerWidget({
    required this.myAudio,
  });
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _assetsAudioPlayer.loopMode,
      builder: (context, AsyncSnapshot<LoopMode> snapshotLooping) {
        if (!snapshotLooping.hasData) return const SizedBox();
        final loopMode = snapshotLooping.data!;
        return StreamBuilder(
          stream: _assetsAudioPlayer.isPlaying,
          initialData: false,
          builder: (context, AsyncSnapshot<bool> snapshotPlaying) {
            if (!snapshotPlaying.hasData) return const SizedBox();
            final isPlaying = snapshotPlaying.data!;
            return Neumorphic(
              margin: EdgeInsets.all(8),
              style: NeumorphicStyle(
                boxShape:
                NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 8,
                                  surfaceIntensity: 1,
                                  shape: NeumorphicShape.concave,
                                ),
                                child: Image.network(
                                  widget.myAudio.imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.myAudio.name),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: PlayingControlsSmall(
                          loopMode: loopMode,
                          isPlaying: isPlaying,
                          toggleLoop: () {
                            _assetsAudioPlayer.toggleLoop();
                          },
                          onPlay: () {
                            if (_assetsAudioPlayer.current.value == null) {
                              _assetsAudioPlayer.open(widget.myAudio.audio,
                                  autoStart: true);
                            } else {
                              _assetsAudioPlayer.playOrPause();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                      stream: _assetsAudioPlayer.realtimePlayingInfos,
                      builder: (context,
                          AsyncSnapshot<RealtimePlayingInfos> snapshot) {
                        if (!snapshot.hasData) return const SizedBox();
                        final infos = snapshot.data!;
                        return PositionSeekWidget(
                          seekTo: (to) {
                            _assetsAudioPlayer.seek(to);
                          },
                          duration: infos.duration,
                          currentPosition: infos.currentPosition,
                        );
                      }),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
