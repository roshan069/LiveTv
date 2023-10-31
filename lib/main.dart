import 'package:flutter/material.dart';
import 'package:music/homemusic.dart';

void main() {
  runApp(const MyMusic());
}

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeMusic(),
    );
  }
}
