import 'package:dubai_task/service_provider/signup_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderValues extends StatefulWidget {
  final int btnValue;
  final String title;

  GenderValues(this.btnValue, this.title);

  _GenderValuesState createState() => _GenderValuesState();
}

class _GenderValuesState extends State<GenderValues> {
  List gender = ["Male", "Female", "Other"];
  String select;
  int index=0;

  @override
  Widget build(BuildContext context) {
    final loginState=Provider.of<LoginService>(context);
    return  Row(
      children: [
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[widget.btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              select='';
              print(value);
              select = value;
              loginState.gender=value;
            });
          },
        ),
        Text(widget.title)
      ],
    );
  }
}

