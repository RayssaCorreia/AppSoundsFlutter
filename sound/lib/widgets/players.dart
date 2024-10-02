import 'package:flutter/material.dart';

class BoxPlayer extends StatefulWidget {
  const BoxPlayer({super.key});

  @override
  State<BoxPlayer> createState() => _BoxPlayerState();
}

class _BoxPlayerState extends State<BoxPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 42.0,
        height: 42.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1',
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
    );
  }
}
