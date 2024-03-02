import 'package:flutter/material.dart';
import 'package:music_player_task/ui/music_list/pages/music_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: const MusicListPage(),
    );
  }
}

