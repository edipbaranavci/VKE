// ignore_for_file: must_be_immutable, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class RakamButtons extends StatelessWidget {
  String? rakamText;
  Function()? function;
  RakamButtons({
    this.function,
    this.rakamText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ButtonTheme(
        height: 70.0,
        minWidth: 70.0,
        child: OutlineButton(
          splashColor: Theme.of(context).highlightColor,
          highlightedBorderColor: Theme.of(context).highlightColor,
          borderSide: BorderSide(color: Theme.of(context).buttonColor),
          onPressed: function,
          child: Text(
            '$rakamText',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}

class NumberFinalButtons extends StatelessWidget {
  Function()? function;
  Widget? child;
  NumberFinalButtons({this.child, this.function, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(5),
      child: ButtonTheme(
        height: 80.0,
        minWidth: 70.0,
        child: OutlineButton(
          borderSide: BorderSide.none,
          onPressed: function,
          child: child,
        ),
      ),
    );
  }
}


ShareWidget(previewContainer) {
  ShareFilesAndScreenshotWidgets().shareScreenshot(
      previewContainer, 3.0, "Title", "Name.png", "image/png",
      text: "Vücut kitle index'i hesaplama uygulamasını kullanmalısın!"
          "\nhttps://play.google.com/store/apps/details?id=com.ekabav.vucut_kitle_endex");
}

bool Sorgu(String sorgulanan) {
  bool sonuc = true;
  if (sorgulanan != '') {
    if (double.parse(sorgulanan) > 280) {
      sonuc = false;
    } else {
      sonuc = true;
    }
  } else {
    sonuc = true;
  }
  return sonuc;
}

class BoyVeKilo extends StatelessWidget {
  String text;
  BoyVeKilo({this.text = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      const Text(
        '(max:280) :',
      )
    ]);
  }
}

//Veri Gösterme Kısmı
class DatasVKE extends StatelessWidget {
  GlobalKey? previewContainer;
  String vkeTuru;
  double sonuc;
  Color renk;
  Widget? ads;

  DatasVKE({
    this.ads,
    this.vkeTuru = '',
    this.renk = Colors.greenAccent,
    this.sonuc = 0,
    this.previewContainer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(child: ads,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),),
          child: RepaintBoundary(
            key: previewContainer,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Text(
                          'VKE Sonucum',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).highlightColor),
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      sonuc.toStringAsFixed(2),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(color: renk),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'VKE',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                              color:
                                              Theme.of(context).primaryColor),
                                        ),
                                        Text(
                                          vkeTuru,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(color: renk),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xff82858A),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Text(
                                'Bilgi',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                    color: Theme.of(context).highlightColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      child: Text(
                                        'Zayıf',
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                      width: 100,
                                    ),
                                    SizedBox(
                                      child: Center(
                                          child: Text(
                                            'Normal',
                                            style: TextStyle(color: Colors.green),
                                          )),
                                      width: 100,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'Aşırı Kilolu',
                                        style: TextStyle(color: Colors.redAccent),
                                        textAlign: TextAlign.right,
                                      ),
                                      width: 100,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 120,
                                    color: Colors.green,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('16,0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('18,5',
                                            style:
                                            Theme.of(context).textTheme.bodyText1)
                                      ],
                                    ),
                                    width: 138,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('25,0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text('40,0',
                                            style:
                                            Theme.of(context).textTheme.bodyText1)
                                      ],
                                    ),
                                    width: 138,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'EKABAV tarafından desteklenmektedir',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Theme.of(context).hintColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20))),
          margin: const EdgeInsets.all(10),
          child: MaterialButton(
            onPressed: () => ShareWidget(previewContainer),
            child: Text(
              'Paylaş',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Theme.of(context).indicatorColor),
            ),
          ),
        ),
      ],
    );
  }
}
