import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/helper.dart';
import '../../models/subs.dart';
import '../../models/video.dart';
import '../videoPlayer/videoPlayer.dart';
class VideoPlayerScreenArguments {
  final String videoUrl;
  final List<List<SubtitleApi>> subtitles;
  final String audioYoruba;
  final bool isYorubaAudioPlaying;

  VideoPlayerScreenArguments({required this.videoUrl, required this.subtitles, required this.audioYoruba, this.isYorubaAudioPlaying = false});
}

class VideoListView extends StatefulWidget {
  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  List<SubtitleApi> mapSubtitleData(List<dynamic> subtitleData) {
    return subtitleData.map((subtitle) {
      final startTime = subtitle.startTime.toString();
      final endTime = subtitle.endTime.toString();
      final text = subtitle.text.map<String>((t) => t.toString()).toList();

      return SubtitleApi(startTime: startTime, endTime: endTime, text: text);
    }).toList();
  }





  late Future<List<VideoData>> _futureVideos;
  final List<Tag> tags = [
    Tag('Culture'),
    Tag('Education'),
    Tag('Histoire'),
    Tag('Dahomey'),
    Tag('Education'),
    Tag('Cuisine'),
  ];

  @override
  void initState() {
    super.initState();
    _futureVideos = AuthApi.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (context, index) {
                  final tag = tags[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        tag.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.05,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            FutureBuilder<List<VideoData>>(
              future: _futureVideos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final videos = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final video = videos[index];
                      final videoTags = tags

                          .toList();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                final fonSubtitles = mapSubtitleData(video.subtitlesFon);
                                final yorubaSubtitles = mapSubtitleData(video.subtitlesYoruba);
                                final isYorubaAudioPlaying = false;
                                Get.to(
                                        () => VideoPlayerScreen(),
                                    arguments: VideoPlayerScreenArguments(
                                    videoUrl: video.path!,
                                    subtitles: [fonSubtitles, yorubaSubtitles],
                                    audioYoruba: video.audioYoruba!,
                                    isYorubaAudioPlaying: isYorubaAudioPlaying,
                                ));
                              },

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.network(
                                          video.cover ?? '',
                                          fit: BoxFit.fitWidth,
                                          width: screenWidth,
                                          height: screenWidth * 0.55,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          color: Colors.black54,
                                          child: Text(
                                            'Il y a 2 heures',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Center(
                                          child: Icon(
                                            Icons.play_circle_fill,
                                            size: screenWidth * 0.1,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      video.title ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Wrap(
                                            spacing: 8.0,
                                            runSpacing: 25.0,
                                            children: videoTags
                                                .map((tag) => Text(
                                              '#${tag.name}',
                                              style: TextStyle(color: Colors.grey),
                                            ))
                                                .toList(),
                                          ),
                                        ),
                                        Text(
                                          'Il y a 5 jours',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xFFD3D3D3),
                          ),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Une erreur s'est produite : ${snapshot.error}");
                } else {
                  return CircularProgressIndicator(); // Indicateur de chargement pendant la récupération des vidéos
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _calculateTimeSincePublished(String? publishedAt) {
    if (publishedAt != null) {
      DateTime publishedDateTime = DateTime.parse(publishedAt);
      Duration difference = DateTime.now().difference(publishedDateTime);
      if (difference.inDays > 0) {
        return '${difference.inDays} jour(s)';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} heure(s)';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute(s)';
      } else {
        return '${difference.inSeconds} seconde(s)';
      }
    } else {
      return 'Date non disponible';
    }
  }
}