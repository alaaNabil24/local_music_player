part of 'music_cubit.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class GetListLoading extends MusicState {}

class GetListSuss extends MusicState {}

class GetListError extends MusicState {}


class PlaySongState extends MusicState {}

class StopSongState extends MusicState {}