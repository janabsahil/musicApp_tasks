import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/lyrics.dart';

import '../models/track.dart';

@immutable
class TrackState extends Equatable {
  final int index = 0;

  @override
  List<Object> get props => [];
}

class AllTrackState extends TrackState {
  final int index;
  final List<Track> trackList;

  get getIndex => index;

  AllTrackState({
    required this.index,
    required this.trackList,
  });

  @override
  List<Object> get props => [index, trackList];
}

class TrackDetailState extends TrackState {
  final int index;
  final Track track;

  get getIndex => index;

  TrackDetailState({
    required this.index,
    required this.track,
  });

  @override
  List<Object> get props => [index, track];
}

class TrackLyricState extends TrackState {
  final int index;
  final Lyrics lyrics;

  get getIndex => index;

  TrackLyricState({
    required this.index,
    required this.lyrics,
  });

  @override
  List<Object> get props => [index, lyrics];
}