import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  BannerAdWidget(this.size);
  final AdSize size;
  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  // ignore: unused_field
  static final AdRequest request = AdRequest();
  BannerAd _bannerAd;
  // ignore: unused_field
  bool _bannerAdIsLoaded = false;
  final Completer<BannerAd> bannerCompleter = Completer<BannerAd>();

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        listener: AdListener(
          onAdLoaded: (Ad ad) {
            print('$BannerAd loaded.');
            bannerCompleter.complete(ad as BannerAd);
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('$BannerAd failedToLoad: $error');
            bannerCompleter.completeError(null);
          },
          onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
          onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
          onApplicationExit: (Ad ad) => print('$BannerAd onApplicationExit.'),
        ),
        request: AdRequest());
    Future<void>.delayed(Duration(seconds: 1), () => _bannerAd?.load());
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _bannerAd = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BannerAd>(
        future: bannerCompleter.future,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<BannerAd> snapshot) {
          // ignore: unused_local_variable
          Widget child;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              child = Container();
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                child = AdWidget(ad: _bannerAd);
              } else {
                child = Text('Error loading $BannerAd');
              }
          }

          return Container(
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: child,
            color: Colors.white,
          );
        });
  }
}
