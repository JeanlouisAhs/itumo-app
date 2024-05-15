import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/subs.dart';

class AuthApi {
  static Future<List<VideoData>> getVideos() async {
    try {
      const url = 'https://8682-35-227-90-203.ngrok-free.app/videos/list';
      var response = await http.get(Uri.parse(url));

      print('Réponse de l\'API : ${response.body}');

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        Map<String, dynamic> responseJson = jsonDecode(responseBody);
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> videosData = responseJson['video'].map((videoData) => jsonDecode(videoData.replaceAll("'", '"'))).toList();
        final List<VideoData> videos = [];

        for (var videoData in videosData) {
          final VideoData video = VideoData.fromJson(videoData);
          videos.add(video);
        }

        return videos;
      } else {
        throw Exception('La réponse de l\'API a un statut différent de 200');
      }
    } catch (e) {
      print(e);
      throw Exception('Erreur lors de la récupération des vidéos depuis l\'API : $e');
    }
  }
}