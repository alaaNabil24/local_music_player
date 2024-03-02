import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_task/ui/music_list/cubit/music_cubit.dart';

class SongSlider extends StatefulWidget {
  SongSlider({super.key});

  @override
  State<SongSlider> createState() => _SongSliderState();
}

class _SongSliderState extends State<SongSlider> {
  TextStyle style = const TextStyle(color: Colors.black);
  double ?_slider;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, MusicState>(
      builder: (context, state) {

        var cubit = context.read<MusicCubit>();
        return Row(
          children: <Widget>[
            Text(
              cubit.formatDuration(cubit.audioManagerInstance.position),
              style: style,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      thumbColor: Colors.blueAccent,
                      overlayColor: Colors.blue,
                      thumbShape:

                      RoundSliderThumbShape(
                        disabledThumbRadius: 5,
                        enabledThumbRadius: 5,
                      ),


                      overlayShape:

                      RoundSliderOverlayShape(
                        overlayRadius: 10,
                      ),
                      activeTrackColor: Colors.blueAccent,
                      inactiveTrackColor: Colors.grey,
                    ),
                    child: Slider(
                      value: _slider ?? 0,
                      onChanged: (value) {
                        setState(() {
                          _slider = value;
                        });
                      },
                      onChangeEnd: (value) {
                        if (cubit.audioManagerInstance.duration != null) {
                          Duration msec = Duration(
                              milliseconds:
                              (cubit.audioManagerInstance.duration.inMilliseconds *
                                  value)
                                  .round());
                          cubit.audioManagerInstance.seekTo(msec);
                        }
                      },
                    )),
              ),
            ),
            Text(
              cubit.formatDuration(cubit.audioManagerInstance.duration),
              style: style,
            ),
          ],
        );
      },
    );
  }
}
