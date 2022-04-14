import 'package:app_quiz_image/components/quiz_page.dart';
import 'package:app_quiz_image/services/admob.dart';
import 'package:app_quiz_image/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize().then((InitializationStatus status) {
      print('Initialization done: ${status.adapterStatuses}');
      MobileAds.instance
          .updateRequestConfiguration(RequestConfiguration(
              tagForChildDirectedTreatment:
                  TagForChildDirectedTreatment.unspecified))
          .then((value) {
        createInterstitialAd();
      });
    });
  }

  void createInterstitialAd() {
    _interstitialAd ??= InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          print('${ad.runtimeType} loaded.');
          _interstitialReady = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('${ad.runtimeType} failed to load: $error.');
          ad.dispose();
          _interstitialAd = null;
          createInterstitialAd();
        },
        onAdOpened: (Ad ad) => print('${ad.runtimeType} onAdOpened.'),
        onAdClosed: (Ad ad) {
          print('${ad.runtimeType} closed.');
          ad.dispose();
          createInterstitialAd();
        },
        onApplicationExit: (Ad ad) =>
            print('${ad.runtimeType} onApplicationExit.'),
      ),
    )..load();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  if (_interstitialReady = true) {
                    _interstitialAd.show();
                  } else {
                    _interstitialReady = false;
                    _interstitialAd = null;
                  }
                  Get.to(QuizImage());
                },
                color: orangeColor,
                child: Text('Open'),
              ),
              BannerAdWidget(AdSize.banner),
            ],
          ),
        ),
      ),
    );
  }
}
