import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart' as chewie;
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';
import '../../models/subs.dart';
import '../../models/video.dart';
import '../videoList/videoItem.dart';

class VideoPlayerScreen extends StatefulWidget {
  static const routeName = '/videoPlayerScreen';

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late chewie.ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  late AudioPlayer _audioPlayer;
  bool _isYorubaAudioPlaying = false;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    final arguments = Get.arguments as VideoPlayerScreenArguments;
    final videoUrl = arguments.videoUrl;

    _videoPlayerController = VideoPlayerController.network(videoUrl);
    await _videoPlayerController.initialize();
    await _videoPlayerController.setVolume(0.0);

    _chewieController = chewie.ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );

    setState(() {});
  }

  void _initAudioPlayer() async {
    final arguments = Get.arguments as VideoPlayerScreenArguments;
    final audioYorubaUrl = arguments.audioYoruba;

    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(audioYorubaUrl);

    _isYorubaAudioPlaying = arguments.isYorubaAudioPlaying;
    if (_isYorubaAudioPlaying) {
      _videoPlayerController.addListener(() {
        if (_videoPlayerController.value.isPlaying && _audioPlayer.playing == false) {
          _audioPlayer.seek(Duration(seconds: _videoPlayerController.value.position.inSeconds));
          _audioPlayer.play();
        }
      });
    }
  }

  void _toggleAudioTrack() async {
    setState(() {
      _isYorubaAudioPlaying = !_isYorubaAudioPlaying;
    });

    if (_isYorubaAudioPlaying) {
      await _audioPlayer.seek(Duration(seconds: _videoPlayerController.value.position.inSeconds));
      await _audioPlayer.play();
    } else {
      await _audioPlayer.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _chewieController.videoPlayerController.value.isInitialized
                  ? chewie.Chewie(controller: _chewieController)
                  : CircularProgressIndicator(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Piste audio Yoruba: '),
              Switch(
                value: _isYorubaAudioPlaying,
                onChanged: (value) {
                  _toggleAudioTrack();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
