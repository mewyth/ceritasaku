import 'dart:async';
import 'package:cerita_saku/view/Login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          child: Image.network(
              'https://img.freepik.com/free-vector/floral-mandala-owl-outline-design_1409-4631.jpg?w=740&t=st=1701592762~exp=1701593362~hmac=83ba3927a8be78ca9a4b997c3e4c2b111942bdea75f5248e5a75b0dc741afb65'),
        ),
      ),
    );
  }
}