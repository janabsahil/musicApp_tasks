import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/track_event.dart';
import 'package:untitled/blocs/track_state.dart';
import 'package:untitled/routes.dart';
import 'package:untitled/views/track_details.dart';

import '../blocs/track_bloc.dart';
import '../models/track.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Track> tracksList = [];
    BlocProvider.of<TrackBloc>(context).add(const GetAllTrackListEvent());

    return Scaffold(
      backgroundColor: const Color(0XFF191b1f),
      appBar: buildAppBar(),
      body: SafeArea(
        child: BlocBuilder<TrackBloc, TrackState>(builder: (context, state) {
          if (state is AllTrackState) {
            tracksList = state.trackList;
          }

          return tracksList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : buildHomeBody(context, tracksList);
        }),
      ),
    );
  }

  buildHomeBody(BuildContext context, List<Track> tracksList) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tracksList.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, index) {
        Track track = tracksList[index];
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pushNamed(context, Routes.trackDetails,
              arguments: track.trackId),
          child: Container(
            width: screenSize.width,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${track.trackName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "${track.albumName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "${track.artistName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0XFF191b1f),
      title: const Text('Hello Rohan'),
      bottom: const PreferredSize(
        preferredSize: Size.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Let's listen to something cool today",
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        )
      ],
    );
  }
}
