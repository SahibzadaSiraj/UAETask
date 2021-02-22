import 'package:dubai_task/service_provider/signup_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFromField extends StatelessWidget {
  final bool hidePassword;
  final String title;
  final IconData icon;
  final TextInputType inputType;
  final int num;

  TextFromField(
      {this.title, this.num, this.icon, this.inputType, this.hidePassword});


  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<LoginService>(context);
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 20.0, color: Colors.black12)]),
          padding:
          EdgeInsets.only(left: 5.0, right: 6.0, top: 0.0, bottom: 0.0),
          child: Theme(
            data: ThemeData(
              hintColor: Colors.transparent,
            ),
            child: TextFormField(
              controller: num==7?loginState.dobController:null,
              // controller: num == 4 ? loginState.passwordController : null,
              onSaved: (value) {
                switch (num) {
                  case 1:
                    loginState.fullName = value.toString().trim();
                    break;
                  case 2:
                    loginState.lastName = value.toString().trim();
                    break;
                  case 3:
                    loginState.email = value.toString().trim();
                    break;
                  case 4:
                    loginState.phone = value.toString().trim();
                    break;
                  case 5:
                    loginState.password = value.toString().trim();
                    break;
                  case 6:
                    loginState.address = value.toString().trim();
                    break;
                  case 7:
                    loginState.dob = value.toString().trim();
                    break;

                }
              },
              validator: (value) {
                switch (num) {
                  case 4:
                    return value.length< 8 ? "number should be 8 digit":null;
                    break;
                  default:
                    return value.isEmpty ? "Field required" : null;
                }
              },
              obscureText:
              num==5?loginState.showPassword:
              hidePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 8),
                  border: InputBorder.none,
                  labelText: title,
                  suffixIcon: num== 5? InkWell(
                      onTap: (){
                        loginState.showPassword=!loginState.showPassword;
                      },
                      child: Icon(
                        loginState.showPassword?
                        Icons.visibility:
                        Icons.visibility_off,
                        )):null,

                  icon: num == 4
                      ? Container(
                      padding: EdgeInsets.only(top: 2),
                      width: 70,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/uae.jpg',
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '+971',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Lemon',
                            ),
                          ),
                        ],
                      ))
                      : Container(
                      width: 50,
                      child: Icon(
                        icon,
                        color: Colors.black38,
                      )),
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600)),
              keyboardType: inputType,
            ),
          ),
        ),
      );
  }
}