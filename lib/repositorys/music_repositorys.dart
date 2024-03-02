import 'package:dartz/dartz.dart';

import '../data/models/music_data.dart';

abstract class MusicRepository {


  Future<Either<dynamic, List<MusicData>>> getAllMusic();

}