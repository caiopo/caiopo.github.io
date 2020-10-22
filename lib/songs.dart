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

    final tracks = body['toptracks']['track'].sublist(0, 20);
    tracks.shuffle();

    final chosen = tracks.first;

    final url = await youtubeLink(
      '${chosen['artist']['name']} ${chosen['name']}',
    );

    openUrl(url ?? chosen['url']);
  }
}

Future<String> youtubeLink(String query) async {
  try {
    final result = await get('https://caio-top-songs.builtwithdark.com/yt/' +
        query.replaceAll(' ', '+'));
    final video = jsonDecode(result.body)['video'].first;
    return 'https://www.youtube.com/watch?v=' + video['encrypted_id'];
  } catch (e) {
    print(e);
    return null;
  }
}
