import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_task/ui/music_list/cubit/music_cubit.dart';

import '../../../data/models/music_data.dart';
import 'icon_text.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key, required this.song});
  final MusicData song;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text(
                          song.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "Artist : ${song.artist}",
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<MusicCubit>()
                          .playAudio(path: song.filePath, title: song.title);
                    },
                    child: const IconText(
                        textColor: Colors.blue,
                        iconColor: Colors.blue,
                        string: "play",
                        iconSize: 25,
                        iconData: Icons.play_arrow),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
