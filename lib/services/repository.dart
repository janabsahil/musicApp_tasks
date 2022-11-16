import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Repository {
  final String baseUrl = "https://api.musixmatch.com/ws/1.1";
  final String apiKey = "2d782bc7a52a41ba2fc1ef05b9cf40d7";
  //final String apiKey = "fb102a68f09b4a33844e78684f362d73"; // (Me)

  final Dio dio = Dio();

  Future<Response?> getAllTracksList() async {
    try {
      Response response = await dio.get('$baseUrl/chart.tracks.get',
          queryParameters: {'apikey': apiKey});
      return response;
    } on DioError catch (e) {
      if (kDebugMode) print(e.response);
      return null;
    }
  }

  Future<Response?> getTrackDetails(int trackId) async {
    try {
      Response response = await dio.get('$baseUrl/track.get',
          queryParameters: {'apikey': apiKey, 'track_id': trackId});
      return response;
    } on DioError catch (e) {
      if (kDebugMode) print(e.response);
      return null;
    }
  }

  Future<Response?> getTrackLyrics(int trackId) async {
    try {
      Response response = await dio.get('$baseUrl/track.lyrics.get',
          queryParameters: {'apikey': apiKey, 'track_id': trackId});
      return response;
    } on DioError catch (e) {
      if (kDebugMode) print(e.response);
      return null;
    }
  }
}
