import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_task/ui/music_list/cubit/music_cubit.dart';
import 'package:music_player_task/ui/music_list/widgets/song_card.dart';

class SongsListsWidget extends StatelessWidget {
  const SongsListsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) => SongCard(
              song: context.read<MusicCubit>().listSong![index],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
        itemCount: context.read<MusicCubit>().listSong!.length);
  }
}
