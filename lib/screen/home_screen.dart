// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_buddy/core/services/api_services.dart';
import 'package:sms_buddy/screen/quote_screen.dart';
import 'package:sms_buddy/utils/app_urls.dart';
import 'package:sms_buddy/utils/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List smsStatusList = [
  //   {"status": "Birthday", "icon": "assets/image/birthday.png"},
  //   {"status": "Love", "icon": "assets/image/love.png"},
  //   {"status": "Motivational", "icon": "assets/image/motivational.png"},
  //   {"status": "BreakUps", "icon": "assets/image/sad.png"},
  // ];

  // ! ======== google ad ======

  //! Banner add
  BannerAd? _bannerAd;

  // ! Inter ads Intance
  InterstitialAd? _interstitialAd;

  // !Reward Ads Instance
  RewardedAd? _rewardedAd;

  // ! check if banner ad loaded
  bool isBannerAdLoaded = false;

  // ! load banner ad
  loadBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AppConfig.bannerAdUnit,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print("Banner ad Loaded");
            setState(() {
              isBannerAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            print('Failed to load Banner $error');
            ad.dispose();
          },
        ),
        request: const AdRequest())
      ..load();
  }

  // ! load InterstitialAd
  loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AppConfig.interAdUnit,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          print("Inter ad Loaded");
          setState(() {
            _interstitialAd = ad;
          });
        }, onAdFailedToLoad: (error) {
          print('Failed to Inter Load $error');
        }));
  }

  // ! Load Reward Video Ad
  loadVideoAd(){
    RewardedAd.load(
      adUnitId: AppConfig.rewardAdUnit,
       request: const AdRequest(), 
       rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad){
          print("Reward ad Loaded");
          setState(() {
            _rewardedAd = ad;
          });
        }, 
        onAdFailedToLoad: (error){
           print('Failed to reward Load $error');
        })
       );
  }

  @override
  void initState() {
    super.initState();
    loadBannerAd();
    loadInterstitialAd();
    loadVideoAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: ApiServices.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/json/loading.json',
                  width: 200, height: 200),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return InkWell(
                            onTap: () {
                              loadVideoAd();
                              _rewardedAd!.show(onUserEarnedReward: ( ad, reward) {
                                // !Logic
                                // !User 100 coin
                                print("Add watched");
                              },);
                              // loadInterstitialAd();
                              // _interstitialAd!.show();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => QuoteScreen(
                                      categoryName: data.name.toString(),
                                      categoryID: data.id.toString())));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: 400,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1, color: Colors.green)),
                              child: Column(
                                children: [
                                  Image.network(
                                    '${AppUrls.baseUrl}${data.thumbnail}',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    data.name!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: isBannerAdLoaded
          ? SizedBox(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          : SizedBox(),
    );
  }
}
