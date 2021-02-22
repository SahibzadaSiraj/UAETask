import 'package:flutter/material.dart';

class TransparentLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const TransparentLoading({Key key, this.isLoading, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/back.jpg")
              )
          ),
          child: Stack(
            children: <Widget>[
              child,
              isLoading
                  ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
                  : Container()
            ],
          ),
        ));
  }
}