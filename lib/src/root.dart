import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instgram/src/app.dart';
import 'package:flutter_clone_instgram/src/controller/auth_controller.dart';
import 'package:flutter_clone_instgram/src/models/instagram_user.dart';
import 'package:flutter_clone_instgram/src/pages/login.dart';
import 'package:flutter_clone_instgram/src/pages/signup_page.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          //TODO 내부 파이어베이스 유저 정보를 조회 with user.data.uid
          return FutureBuilder<IUser?>(
            future: controller.loginUser(user.data!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const App();
              } else {
                return Obx(
                  () => controller.user.value.uid != null
                    ? const App()
                    : SignupPage(uid: user.data!.uid),
              );
            }
            },
          );
          return const App();
        } else {
          return const Login();
        }
        return Container();
      },
    );
  }
}
