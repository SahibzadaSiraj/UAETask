import 'package:dubai_task/database/sqlite_database.dart';
import 'package:dubai_task/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginService extends ChangeNotifier{
  bool _isLoginPage=true;
  bool _isLoading=false;
  bool _showPassword = true;


  var formKey = new GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var dobController = TextEditingController();
  String fullName;
  String lastName;
  String email;
  String phone;
  String address;
  String dob;
  String gender;
  String password;



  set isLoginPage(v){
    _isLoginPage=v;
    notifyListeners();
  }
  set isLoading(v){
    _isLoading=v;
    notifyListeners();
  }

  set showPassword(value) {
    _showPassword = value;
    notifyListeners();
  }

  bool get isLoginPage=>_isLoginPage;
  bool get isLoading=>_isLoading;
  bool get showPassword => _showPassword;


  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  validateAndSubmit({context}) {
    if (validateAndSave()) {
      if (isLoginPage) {

        signIn(context);
      } else {
        // signUp(context);
        signUp(context);
      }
    }
  }
  signIn(BuildContext context){
    Map<String,dynamic>jsonData={

      DatabaseHelper.email:email.toString().trim()
      // DatabaseHelper.password:password.toString().trim(),
    };
    print(jsonData);

    dbHelper.singleUser(email.toString().trim()).then((value) {
      print("value :$value");
      if(value.isNotEmpty){

        Future.delayed(Duration(seconds: 2)
        ,(){
              isLoading=false;
              Toast.show("Login Successfully Done",
                  context,gravity:Toast.CENTER,duration: Toast.LENGTH_LONG,backgroundRadius: 5,
                  textColor: Colors.black,
                  border: Border.all(color: Colors.grey),
                  backgroundColor: Colors.white);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            });
      }
   else{
        Toast.show("Something went wrong...",
            context,gravity:Toast.CENTER,duration: Toast.LENGTH_LONG,backgroundRadius: 5,
            textColor: Colors.black,
            border: Border.all(color: Colors.grey),
            backgroundColor: Colors.white);
        isLoading=false;
      }
    });
  }
signUp(BuildContext context){
  Map<String,dynamic>jsonData={
    DatabaseHelper.fullName:fullName.toString().trim(),
    DatabaseHelper.lastName:lastName.toString().trim(),
    DatabaseHelper.email:email.toString().trim(),
    DatabaseHelper.phone:phone.toString().trim(),
    DatabaseHelper.password:password.toString().trim(),
    DatabaseHelper.address:address.toString().trim(),
    DatabaseHelper.dob:dob.toString().trim(),
    DatabaseHelper.gender:gender.toString().trim()
  };
  print(jsonData);
  dbHelper.insert(jsonData,DatabaseHelper.table).then((value) {
    print("value :$value");
    dobController.clear();
    if(value!=null){

      Future.delayed(Duration(seconds: 2)
          ,(){
            isLoading=false;
            Toast.show("Registration Successfully Done",
                context,gravity:Toast.CENTER,duration: Toast.LENGTH_LONG,backgroundRadius: 5,
                textColor: Colors.black,
                border: Border.all(color: Colors.grey),
                backgroundColor: Colors.white);
            isLoginPage=true;

          });
    }
    else{
      Toast.show("Something went wrong...",
          context,gravity:Toast.CENTER,duration: Toast.LENGTH_LONG,backgroundRadius: 5,
          textColor: Colors.black,
          border: Border.all(color: Colors.grey),
          backgroundColor: Colors.white);
      isLoading=false;
    }
  });


}

}