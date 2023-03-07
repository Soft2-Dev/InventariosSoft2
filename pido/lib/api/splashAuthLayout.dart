import 'package:flutter/material.dart';
import 'package:pido/ui/layout/homePages.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "img/icon.png",
      textType: TextType.NormalText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Color(0xff3c3c3c),
    );
  }
}
