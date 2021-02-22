import 'dart:async';
import 'package:dubai_task/pages/login/login_page.dart';
import 'package:dubai_task/service_provider/address_service.dart';
import 'package:dubai_task/service_provider/signup_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashKing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginService()),
        ChangeNotifierProvider.value(value: AddressService()),
      ],
      child: MaterialApp(
        home: SplashScreenKing(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColorBrightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.red,
        ),
      ),
    );
  }
}

/// Component UI
class SplashScreenKing extends StatefulWidget {
  @override
  _SplashScreenKingState createState() => _SplashScreenKingState();
}

/// Component UI
class _SplashScreenKingState extends State<SplashScreenKing> {
  /// Setting duration in splash screen
  startTime() async {
    return new Timer(
        Duration(milliseconds: 4500),
        () => Navigator.of(context).pushReplacement(
            PageRouteBuilder(pageBuilder: (_, __, ___) => LoginScreen())));
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/nike.png"))),
          ),
        ),
      ),
    );
  }
}
