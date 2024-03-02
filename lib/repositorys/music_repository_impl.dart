import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:music_player_task/data/models/music_data.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'music_repositorys.dart';

class MusicRepositoryImpl extends MusicRepository {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  MusicData? songs;
  @override
  Future<Either<dynamic, List<MusicData>>> getAllMusic() async {


    try {


      List<SongModel> songs = await _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      LogConfig logConfig = LogConfig(logType: LogType.ERROR);
      _audioQuery.setLogConfig(logConfig);
      List<MusicData> list = songs
          .map((e) => MusicData(
              title: e.title ?? "",
              artist: e.artist ?? "",
              duration: e.duration ?? 0,
              filePath: e.data ?? ""))
          .toList();
      debugPrint("suss>>>>$list");
      debugPrint(songs[0].toString());

      return Right(list);
    } catch (e) {
      if (kDebugMode) {
        print("errorr>>$e");
      }

      debugPrint(e.toString());
      return left(e);
    }
  }
}
