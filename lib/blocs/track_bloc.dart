import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/lyrics.dart';
import 'package:untitled/models/track.dart';

import '../services/repository.dart';
import 'track_event.dart';
import 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc(TrackState initialState) : super(initialState) {
    on<GetAllTrackListEvent>(_handleGetAllTrackList);
    on<GetTrackDetailsEvent>(_handleGetTrackDetails);
    on<GetTrackLyricsEvent>(_handleGetTrackLyrics);
  }

  _handleGetAllTrackList(
      GetAllTrackListEvent event, Emitter<TrackState> emit) async {
    Response? response = await Repository().getAllTracksList();

    var data = jsonDecode(response?.data);
    var statusCode = data['message']['header']['status_code'];
    if (statusCode == 200) {
        var list = data['message']['body']['track_list'];
        List<Track> trackList =
        (list as List).map((e) => Track.fromJson(e['track'])).toList();

        List<Track> filteredTrackList = trackList.where((element) => element.hasLyrics == 1).toList();

        AllTrackState newState =
        AllTrackState(index: state.index + 1, trackList: filteredTrackList);

        emit(newState);
    }
  }

  _handleGetTrackDetails(event, emit) async {
    Response? response = await Repository().getTrackDetails(event.trackId);

    var data = jsonDecode(response?.data);
    var statusCode = data['message']['header']['status_code'];
    if (statusCode == 200) {
      var trackData = data['message']['body']['track'];
      Track track = Track.fromJson(trackData);

      TrackDetailState newState =
      TrackDetailState(index: state.index + 1, track: track);

      emit(newState);
    }
  }

  _handleGetTrackLyrics(event, emit) async {
    Response? response = await Repository().getTrackLyrics(event.trackId);

    var data = jsonDecode(response?.data);
    var statusCode = data['message']['header']['status_code'];
    if (statusCode == 200) {
      var lyricsData = data['message']['body']['lyrics'];
      Lyrics lyrics = Lyrics.fromJson(lyricsData);

      TrackLyricState newState =
      TrackLyricState(index: state.index + 1, lyrics: lyrics);

      emit(newState);
    }
  }
}
