import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_task/ui/music_list/cubit/music_cubit.dart';
import 'package:music_player_task/utils/theme/app_colors.dart';

import '../widgets/bottom_player_widget.dart';
import '../widgets/songs_list_widget.dart';

class MusicListPage extends StatelessWidget {
  const MusicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicCubit()..checkAndRequestPermissions()..getListData(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<MusicCubit, MusicState>(
            builder: (context, state) {
              return state is GetListSuss || state is PlaySongState
                  ? const SongsListsWidget()
                  : Center(
                    child: const CircularProgressIndicator(
                        color: AppColors.green,
                      ),
                  );
            },
          ),
          bottomNavigationBar: BottomPlayerWidget(),
        ),
      ),
    );
  }
}
