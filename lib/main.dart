import 'package:cricbuzz/Home.dart';
import 'package:cricbuzz/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Recent/RScorCard.dart';

void main() {
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    ),
  );
}
