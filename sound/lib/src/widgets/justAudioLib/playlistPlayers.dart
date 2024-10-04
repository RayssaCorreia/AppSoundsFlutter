import 'package:flutter/material.dart';

class PlaylistPlayers extends StatefulWidget {
  const PlaylistPlayers({super.key});

  @override
  State<PlaylistPlayers> createState() => _PlaylistPlayersState();
}

class _PlaylistPlayersState extends State<PlaylistPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
          'PLAYER',
          ),
        ),
    );
  }
}
