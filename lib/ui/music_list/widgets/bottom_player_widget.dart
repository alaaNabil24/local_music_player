import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_task/ui/music_list/cubit/music_cubit.dart';
import 'package:music_player_task/ui/music_list/widgets/song_slider.dart';

class BottomPlayerWidget extends StatelessWidget {
  const BottomPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, MusicState>(
      builder: (context, state) {

        var cubit = context.read<MusicCubit>();

        return SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SongSlider()
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.cyan.withOpacity(0.3),
                    child: Center(
                      child: IconButton(
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                          onPressed: () => cubit.audioManagerInstance.previous()),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          cubit.audioManagerInstance.playOrPause();
                        },
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(
                          cubit.audioManagerInstance.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.cyan.withOpacity(0.3),
                    child: Center(
                      child: IconButton(
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                          onPressed: () => cubit.audioManagerInstance.next()),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
