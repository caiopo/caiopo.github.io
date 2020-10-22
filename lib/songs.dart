import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personal_site/utils.dart';

class SongsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Image.asset('assets/music.png', width: 24, height: 24),
      ),
      label: Text(
        'SONG RECOMMENDATION',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      tooltip: 'Opens a random song that I\'m listening on repeat!',
      backgroundColor: Colors.yellow,
      onPressed: () => recommendSong(),
    );
  }
}

Future<void> recommendSong() async {
  final response = await get('https://caio-top-songs.builtwithdark.com/top');

  if (200 <= response.statusCode && response.statusCode < 300) {
    final body = jsonDecode(response.body);

    final tracks = body['toptracks']['track'].sublist(0, 10);

    for (final t in tracks) {
      print('${t['name']} ${t['playcount']}');
    }

    tracks.shuffle();
    final chosen = tracks.first;

    print(chosen);

    openUrl(chosen['url']);
  }
}
