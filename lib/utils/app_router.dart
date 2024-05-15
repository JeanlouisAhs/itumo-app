import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/onboarding/onboarding.dart';
import '../views/splash/splashScreen.dart';
import '../views/videoList/videoList.dart';
class AppRouter {
  static const String splash = '/splash';
  static const String onboarding = '/onboard';
  static const String videolist = '/videolist';
  static const String tutorial = '/tuto';
  static const String videoviewer ='/videoviewer';
  static const String vidoeupload ='/videoupload';

  static List<GetPage> getPages = [
    GetPage(name: AppRouter.splash, page: () => SplashScreen()),
    GetPage(name: AppRouter.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRouter.videolist, page: () => VideoList()),
    //GetPage(name: AppRouter.videoviewer, page: () => VideoPl),
    //GetPage(name: AppRouter.tutorial, page: () => VideoListView()),
    //GetPage(name: AppRouter.tutorial, page: () => HomeScreen()),
    //GetPage(name: AppRouter.photoDetails, page: () => DetailsScreen()),
    // GetPage(name: AppRouter.vidoeupload, page: () => DatabaseViewerScreen()),
  ];
}
