import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vucut_kitle_endex/themes.dart';

class ThemeService{
  final _getStorage = GetStorage();
  String modesMode = 'dark';

  ThemeData kontrol(){
    ThemeData gonder;
    if(_getStorage.read('theme') == 'dark'){
      gonder = Temalar().darkTheme;
  }
    else if(_getStorage.read('theme') == 'light'){
      gonder = Temalar().ligthTheme;
  }
    else{
      gonder = Temalar().ligthTheme;
    }
    return gonder;
}

  void degistir(){
    if(_getStorage.read('theme') == 'dark'){
      Get.changeThemeMode(ThemeMode.light);
      Get.changeTheme(Temalar().ligthTheme);
      modesMode = 'light';
      _getStorage.write('theme', modesMode);
    }
    else{
      Get.changeThemeMode(ThemeMode.dark);
      Get.changeTheme(Temalar().darkTheme);
      modesMode = 'dark';
      _getStorage.write('theme', modesMode);
    }
  }

}