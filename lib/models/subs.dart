class VideoData {
  List<SubtitleApi> subtitlesFon;
  List<SubtitleApi> subtitlesYoruba;
  String title;
  String language;
  String path;
  String audioYoruba;
  String cover;
  double duration;

  VideoData({
    required this.subtitlesFon,
    required this.subtitlesYoruba,
    required this.title,
    required this.language,
    required this.path,
    required this.audioYoruba,
    required this.cover,
    required this.duration,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      subtitlesFon: (json['subtitles_fon'] as List).map((e) => SubtitleApi.fromJson(e)).toList(),
      subtitlesYoruba: (json['subtitles_yoruba'] as List).map((e) => SubtitleApi.fromJson(e)).toList(),
      title: json['title'],
      language: json['language'],
      path: json['path'],
      audioYoruba: json['audio_yoruba'],
      cover: json['cover'],
      duration: double.parse(json['duration'].toString()),
    );
  }
}
class SubtitleApi {
  List<String> text;
  String startTime;
 String endTime;

  SubtitleApi({
    required this.text,
    required this.startTime,
    required this.endTime,
  });

  factory SubtitleApi.fromJson(Map<String, dynamic> json) {
    return SubtitleApi(
      text: json['text'].toString().split(' '),
      startTime: (json['start_time'].toString()) ,
      endTime: (json['end_time']).toString() ,
    );
  }

}