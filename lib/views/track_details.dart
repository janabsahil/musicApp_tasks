import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/track_event.dart';
import 'package:untitled/models/lyrics.dart';

import '../blocs/track_bloc.dart';
import '../blocs/track_state.dart';
import '../models/track.dart';

class TrackDetailsPage extends StatelessWidget {
  final int trackId;

  const TrackDetailsPage({Key? key, required this.trackId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TrackBloc>(context).add(GetTrackDetailsEvent(trackId));
    BlocProvider.of<TrackBloc>(context).add(GetTrackLyricsEvent(trackId));

    Track track = Track();
    Lyrics lyrics = Lyrics();

    return Scaffold(
      backgroundColor: const Color(0XFF191b1f),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFF191b1f),
        title: const Text('Track Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<TrackBloc, TrackState>(builder: (context, state) {
          if (state is TrackDetailState) {
            track = state.track;
          }

          if (state is TrackLyricState) {
            lyrics = state.lyrics;
          }

          return track.albumName == null || lyrics.lyricsBody == null
              ? const Center(child: CircularProgressIndicator())
              : buildTrackDetailsBody(context, track, lyrics);
        }),
      ),
    );
  }

  buildTrackDetailsBody(context, Track track, Lyrics lyrics) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 1.2,
      width: screenSize.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Album Name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              "${track.albumName}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
              "Track Name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              "${track.trackName}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              "${lyrics.lyricsBody}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              "By ${track.artistName}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
