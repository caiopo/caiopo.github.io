import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personal_site/utils.dart';

class SongsButton extends StatefulWidget {
  @override
  _SongsButtonState createState() => _SongsButtonState();
}

class _SongsButtonState extends State<SongsButton>
    with TickerProviderStateMixin {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Image.asset(
          loading ? 'assets/icons/hourglass.png' : 'assets/icons/music.png',
          key: Key('$loading'),
          width: 24,
          height: 24,
        ),
      ),
      tooltip: 'Opens a random song that I\'m listening on repeat!',
      backgroundColor: Colors.yellow,
      onPressed: loading
          ? null
          : () async {
              try {
                setState(() => loading = true);
                await recommendSong();
              } finally {
                setState(() => loading = false);
              }
            },
    );
  }
}

Future<void> recommendSong() async {
  final response =
      await get(Uri.parse('https://caio-top-songs.builtwithdark.com/top'));

  if (200 <= response.statusCode && response.statusCode < 300) {
    final body = jsonDecode(response.body);

    final tracks = body['toptracks']['track'].sublist(0, 20);
    tracks.shuffle();

    final chosen = tracks.first;

    openUrl(chosen['url']);
  }
}

Future<String?> youtubeLink(String query) async {
  try {
    final result = await get(Uri.parse(
      'https://caio-top-songs.builtwithdark.com/yt/${query.replaceAll(' ', '+')}',
    ));
    final video = jsonDecode(result.body)['video'].first;
    return 'https://www.youtube.com/watch?v=' + video['encrypted_id'];
  } catch (e) {
    print(e);
    return null;
  }
}
