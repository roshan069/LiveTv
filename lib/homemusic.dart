import 'package:flutter/material.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({super.key});

  @override
  State<HomeMusic> createState() => _HomeMusicState();
}

class _HomeMusicState extends State<HomeMusic> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioUrl = 'http://www.mysite.com/myMp3file.mp3';
  bool isPlayer = false;

  void initState() {
    super.initState();
    //Initialize audioPlayer and load audio
    audioPlayer.setUrl(audioUrl);
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.COMPLETED) {
        setState(() {
          isPlayer = false;
        });
      }
    });
  }

  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    await audioPlayer.player(audioUrl);
    setState(() {
      isPlayer = true;
    });
  }

  void pauseAudio() async {
    await audioPlayer.pause();
    setState(() {
      isPlayer = false;
    });
  }

  void stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlayer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Song Title',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            SizedBox(height: 20);
            isPlaying
                ? IconButton(
                    icon: Icon(Icons.pause_circle_filled),
                    iconSize: 64,
                    onPressed: pauseAudio,
                  )
                : IconButton(
                    icon: Icon(Icons.play_circle_filled),
                    iconSize: 64,
                    onPressed: playAudio,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: stopAudio,
              child: Text('Stop'),
            ),
        ],
      ),
    )
  );
 }
}