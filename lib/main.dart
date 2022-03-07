// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vucut_kitle_endex/theme_service.dart';
import 'envanter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late BannerAd _bannerAd;
  bool _isLoaded = false;

  _bannerCek() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _bannerCek();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().kontrol(),
      home: Scaffold(
        body: const FirstScreen(),
        bottomNavigationBar: Container(
          child: _isLoaded
              ? SizedBox(
            height: _bannerAd.size.height.toDouble(),
            width: _bannerAd.size.width.toDouble(),
            child: AdWidget(
              ad: _bannerAd,
            ),
          )
              : const SizedBox(),
        ),
        appBar: AppBar(
          title: const Text('VKE'),
          elevation: 0,
          centerTitle: true,
          actions: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  ThemeService().degistir();
                });
              },
              child: const Text('Mod Değiştir'),
            )
          ],
        ),
      ),
    );
  }
}

String vkeTuru = 'Normal';
String girilenKilo = '';
String girilenBoy = '';
bool arttiralacakDegerKilo = true;
bool arttiralacakDegerBoy = false;
double sonuc = 0;
Color renk = Colors.greenAccent;
GlobalKey previewContainer = GlobalKey();

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  _bannerCek() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _bannerCek();
  }

  void disponse() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoyVeKilo(
              text: 'Kilo',
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    arttiralacakDegerKilo = true;
                    arttiralacakDegerBoy = false;
                    sonuc = 0;
                  });
                },
                child: Text(
                  girilenKilo == '' ? '0' : girilenKilo,
                  style: arttiralacakDegerKilo != true
                      ? Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Theme.of(context).primaryColor)
                      : Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Theme.of(context).highlightColor),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoyVeKilo(
              text: 'Boy',
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    arttiralacakDegerKilo = false;
                    arttiralacakDegerBoy = true;
                    sonuc = 0;
                  });
                },
                child: Text(
                  girilenBoy == '' ? '0' : girilenBoy,
                  style: arttiralacakDegerBoy != true
                      ? Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Theme.of(context).primaryColor)
                      : Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Theme.of(context).highlightColor),
                ),
              ),
            ),
          ],
        ),
        //Klavye Buraya Gelicek
        sonuc == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              RakamButtons(
                                rakamText: '7',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '7') == true) {
                                        girilenKilo += '7';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '7') == true) {
                                        girilenBoy += '7';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '8',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '8') == true) {
                                        girilenKilo += '8';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '8') == true) {
                                        girilenBoy += '8';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '9',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '9') == true) {
                                        girilenKilo += '9';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '9') == true) {
                                        girilenBoy += '9';
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          Row(
                            children: [
                              RakamButtons(
                                rakamText: '4',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '4') == true) {
                                        girilenKilo += '4';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '4') == true) {
                                        girilenBoy += '4';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '5',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '5') == true) {
                                        girilenKilo += '5';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '5') == true) {
                                        girilenBoy += '5';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '6',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '6') == true) {
                                        girilenKilo += '6';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '6') == true) {
                                        girilenBoy += '6';
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          Row(
                            children: [
                              RakamButtons(
                                rakamText: '1',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '1') == true) {
                                        girilenKilo += '1';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '1') == true) {
                                        girilenBoy += '1';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '2',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '2') == true) {
                                        girilenKilo += '2';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '2') == true) {
                                        girilenBoy += '2';
                                      }
                                    }
                                  });
                                },
                              ),
                              RakamButtons(
                                rakamText: '3',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (Sorgu(girilenKilo + '3') == true) {
                                        girilenKilo += '3';
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (Sorgu(girilenBoy + '3') == true) {
                                        girilenBoy += '3';
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          Row(
                            children: [
                              RakamButtons(
                                rakamText: '0',
                                function: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      if (girilenKilo != '0' &&
                                          girilenKilo != '') {
                                        if (Sorgu(girilenKilo + '0') == true) {
                                          girilenKilo += '0';
                                        }
                                      }
                                    } else if (arttiralacakDegerBoy == true) {
                                      if (girilenBoy != '0' &&
                                          girilenBoy != '') {
                                        if (Sorgu(girilenBoy + '0') == true) {
                                          girilenBoy += '0';
                                        }
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NumberFinalButtons(
                            child: Text(
                              'AC',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).highlightColor),
                            ),
                            function: () {
                              setState(() {
                                arttiralacakDegerKilo == true
                                    ? girilenKilo = ''
                                    : girilenBoy = '';
                              });
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            padding: const EdgeInsets.all(14.5),
                            margin: const EdgeInsets.all(10),
                            child: ButtonTheme(
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                color: Theme.of(context).highlightColor,
                                onPressed: () {
                                  setState(() {
                                    if (arttiralacakDegerKilo == true) {
                                      girilenKilo = girilenKilo.substring(
                                          0, girilenKilo.length - 1);
                                    } else if (arttiralacakDegerBoy == true) {
                                      girilenBoy = girilenBoy.substring(
                                          0, girilenBoy.length - 1);
                                    }
                                  });
                                },
                                iconSize: 50,
                                icon: const Icon(
                                  Icons.backspace,
                                ),
                              ),
                            ),
                          ),
                          NumberFinalButtons(
                            function: () {
                              setState(() {
                                VkeHesapla(double.parse(girilenBoy),
                                    double.parse(girilenKilo));
                                arttiralacakDegerBoy = false;
                                arttiralacakDegerKilo = false;
                              });
                            },
                            child: Text(
                              'GO',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).highlightColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            //Banner ADS REKLAM ve Veri Gösterme
            : DatasVKE(
                previewContainer: previewContainer,
                renk: renk,
                sonuc: sonuc,
                vkeTuru: vkeTuru,
              ),
      ],
    );
  }
}

VkeHesapla(double boy, double kilo) {
  sonuc = 0;
  sonuc = kilo / ((boy * boy) / 10000);
  sonuc = double.parse(sonuc.toStringAsFixed(1));

  if (sonuc < 18.5) {
    vkeTuru = 'Zayıf';
    renk = Colors.blueAccent;
  } else if (sonuc > 18.4 && sonuc < 25.0) {
    vkeTuru = 'Normal';
    renk = Colors.greenAccent;
  } else if (sonuc > 25.0) {
    vkeTuru = 'Aşırı Kilolu';
    renk = Colors.redAccent;
  }
}
