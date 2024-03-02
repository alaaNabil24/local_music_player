import 'package:audio_manager/audio_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../data/models/music_data.dart';
import '../../../repositorys/music_repository_impl.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(MusicInitial());

  //todo : vars

  var audioManagerInstance = AudioManager.instance;

  List<MusicData>? listSong;

  MusicRepositoryImpl musicRepositoryImpl = MusicRepositoryImpl();

  //todo : methods

  String formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format =
        "${(minute < 10) ? "0$minute" : "$minute"}:${(second < 10) ? "0$second" : "$second"}";
    return format;
  }

  getListData() async {
    emit(GetListLoading());

    var res = await musicRepositoryImpl.getAllMusic();
    res.fold((l) {
      if (kDebugMode) {
        print(l.toString());
      }

      emit(GetListError());
    }, (r) {
      listSong = r;

      debugPrint(r.toString());
      emit(GetListSuss());
    });
  }

  bool hasPermission = false;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  checkAndRequestPermissions({bool retry = false}) async {
    hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );
  }

  playAudio({String? title, String? path})  {


     audioManagerInstance
        .start("file://$path" ?? "", title ?? "", desc: "", cover: "")
        .then((value) => debugPrint(value.toString()));

    emit(PlaySongState());
  }
}
