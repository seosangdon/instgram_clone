import 'package:flutter_clone_instgram/src/controller/auth_controller.dart';
import 'package:flutter_clone_instgram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instgram/src/controller/home_controller.dart';
import 'package:flutter_clone_instgram/src/controller/mypage_controller.dart';
import 'package:flutter_clone_instgram/src/controller/upload_controller.dart';
import 'package:flutter_clone_instgram/src/pages/mypage.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }

  static additionalBinding(){
    Get.put(MypageController(),permanent: true);
    Get.put(HomeController(),permanent: true);
  }
}
