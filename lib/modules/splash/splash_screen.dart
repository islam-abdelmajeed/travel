import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_agency_app/constants/constant.dart';
import 'package:travel_agency_app/layout/layout_screen.dart';
import 'package:travel_agency_app/modules/home/home_screen.dart';
import 'package:travel_agency_app/modules/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  LayoutScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Center(
        child: Text(
          'Fly Travel',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
