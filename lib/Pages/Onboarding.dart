import 'package:encryptor/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoarding extends StatelessWidget {
  final pages = [
    SkOnboardingModel(
        title: 'Welcome Onboard',
        description:
            'The place , for secure password generation and password management',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: './assets/images/hello.png'),
    SkOnboardingModel(
        title: 'Secure Password Generation',
        description:
            'Using Encryptor you can generate safe and hard to decode passwords for free',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: './assets/images/one.png'),
    SkOnboardingModel(
        title: 'Save passwords',
        description:
            'Save generated passwords for hassle-free logins , just copy and paste !',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: './assets/images/two.png'),
    SkOnboardingModel(
        title: 'Made with ❤ , By Avijeet',
        description:
            'All set in , lets dive in and start manging the passwords you !',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: './assets/images/three.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Navigator.pushReplacementNamed(context, "/home");
          Constants.prefs.setBool("isBoarded", true);
        },
        getStartedClicked: (value) {
          Constants.prefs.setBool("isBoarded", true);
          Navigator.pushReplacementNamed(context, "/home");
        },
      ),
    );
  }
}
