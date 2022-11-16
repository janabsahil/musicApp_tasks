import 'package:flutter/material.dart';

@immutable
abstract class TrackEvent {
  const TrackEvent();
}

@immutable
class GetAllTrackListEvent extends TrackEvent {
  const GetAllTrackListEvent();
}

@immutable
class GetTrackDetailsEvent extends TrackEvent {
  final int trackId;
  const GetTrackDetailsEvent(this.trackId);
}

@immutable
class GetTrackLyricsEvent extends TrackEvent {
  final int trackId;
  const GetTrackLyricsEvent(this.trackId);
}
