import 'package:dubai_task/app_constant/colors.dart';
import 'package:dubai_task/pages/animation/fade_animation.dart';
import 'package:dubai_task/service_provider/signup_signin_service.dart';
import 'package:dubai_task/widget/form_field.dart';
import 'package:dubai_task/widget/gender.dart';
import 'package:dubai_task/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  var _txtStyle = TextStyle(
      fontFamily: "Sofia",
      fontWeight: FontWeight.w600,
      color: Colors.black54,
      fontSize: 16.0);
  String birthDateInString;
  DateTime birthDate;
  bool isDateSelected= false;
  String selectedGender;
  List gender = ["Male", "Female", "Other"];
  String select;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final loginState=Provider.of<LoginService>(context);

    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: size.height,

            child:
            TransparentLoading(
              isLoading: false,
              child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    child: Form(
                      key: loginState.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          FadeAnimation(
                            delay: 0.3,
                            child: Container(
                              height: 60,
                              width: size.width,
                             alignment: Alignment.center,
                             decoration: BoxDecoration( color: Colors.deepOrange,
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(20),
                                 bottomRight: Radius.circular(20),
                               )
                             ),
                              child: Text(
                                loginState.isLoginPage? "Login":"Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.whiteColor,
                                  fontSize: 28,),
                              ),
                            ),
                          ),

                          FadeAnimation(
                            delay: 0.3,
                            child: Container(
                              width: size.width*0.4,
                              height: size.height*0.18,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: AssetImage("assets/nike.png")
                               )
                             ),
                            ),
                          ),
                         loginState.isLoginPage?SizedBox(height: 60,):Container(),

                         loginState.isLoginPage?Container()
                         :FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.person,
                              hidePassword: false,
                              title: "Full Name",
                              num: 1,
                              inputType: TextInputType.emailAddress,
                            ),
                          ),
                          loginState.isLoginPage?Container()
                              :SizedBox(
                            height: 8.0,
                          ),
                          loginState.isLoginPage?Container()
                              :FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.person,
                              hidePassword: false,
                              title: "Last Name",
                              num: 2,
                              inputType: TextInputType.emailAddress,
                            ),
                          ),
                          loginState.isLoginPage?Container()
                              : SizedBox(
                            height: 8.0,
                          ),
                           FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.email,
                              hidePassword: false,
                              title: "Email",
                              num: 3,
                              inputType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),


                          loginState.isLoginPage?Container()
                              : FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.perm_contact_calendar,
                              hidePassword: false,
                              title: "phone",
                              num: 4,
                              inputType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.enhanced_encryption,
                              hidePassword:true,
                              title: "Password",
                              num: 5,
                              inputType: TextInputType.text,
                            ),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),
                          loginState.isLoginPage?Container()
                              : FadeAnimation(
                            delay: 0.3,
                            child: TextFromField(
                              icon: Icons.location_city,
                              hidePassword: false,
                              title: "address",
                              num: 6,
                              inputType: TextInputType.emailAddress,
                            ),
                          ),
                          loginState.isLoginPage?Container()
                              : SizedBox(
                            height: 8.0,
                          ),
                          loginState.isLoginPage?Container()
                              :  FadeAnimation(
                            delay: 0.3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:7,
                                  child: TextFromField(
                                    icon: Icons.date_range_rounded,
                                    hidePassword: false,
                                    title: "DOB",
                                    num: 7,
                                    inputType: TextInputType.emailAddress,
                                  ),
                                ),
                                Expanded(
                                     flex: 1,
                                    child: InkWell(
                                      onTap: ()async{
                                        final datePick= await showDatePicker(
                                            context: context,
                                            initialDate: new DateTime.now(),
                                            firstDate: new DateTime(1950),
                                            lastDate: new DateTime(2100)
                                        );
                                        if(datePick!=null && datePick!=birthDate){
                                          setState(() {

                                            birthDate=datePick;
                                            isDateSelected=true;

                                            // put it here
                                            birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019

                                       });
                                          loginState.dobController.text=birthDateInString;
                                          // print(birthDateInString);
                                        }
                                      },
                                      child: Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Icon(Icons.date_range_sharp,
                                      size: 30,
                                      color:Colors.green,),
                                    ),))
                              ],
                            ),
                          ),
                          loginState.isLoginPage?Container()
                              : SizedBox(
                            height: 10
                          ),
                          //Use the above widget where you want the radio button
                          loginState.isLoginPage?Container()
                              :  Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text("Select Gender:",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                                ),),
                              )),
                          loginState.isLoginPage?Container()
                              : Container(
                            height: 46,
                            width: size.width*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GenderValues(0, 'Male'),
                                GenderValues(1, 'Female'),
                                GenderValues(2, 'Others'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height:8,
                          ),
                          InkWell(
                            onTap: () {
                              loginState.isLoading=true;
                              loginState.validateAndSubmit
                                (context: context);

                            },
                            child: Container(
                              height: 46,
                              width: size.width*0.8,
                              decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45.withOpacity(0.15),
                                      blurRadius: 19.0,
                                      spreadRadius: 2.0)
                                ],
                              ),
                              child: Center(
                                child:
                                loginState.isLoading?Container(
                                  width: 25,height: 25,
                                  child: CircularProgressIndicator(
                                    backgroundColor: AppColor.secondaryColor,
                                  ),
                                ):
                                Text(
                                  loginState.isLoginPage
                                      ? "Login"
                                      :
                                  "Register",
                                  style: _txtStyle.copyWith(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          //
                          // FadeAnimation(
                          //   delay: 0.3,
                          //   child: InkWell(
                          //     onTap: () {
                          //       // Navigator.of(context).push(PageRouteBuilder(
                          //       //     pageBuilder: (_, __, ___) =>  ForgotPasswordEmail()));
                          //     },
                          //     child: SizedBox(
                          //       width: size.width,
                          //       child: Container(
                          //         padding: EdgeInsets.only(
                          //           right: 25,
                          //           top: 15,
                          //         ),
                          //         alignment: Alignment.centerRight,
                          //         child: Text(
                          //           'Forget Password',
                          //           style: TextStyle(
                          //             color: AppColor.mainColor,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //     // : Container(),

                          FadeAnimation(
                            delay: 0.3,
                            child: InkWell(
                              onTap: () {


                                loginState.isLoginPage = !loginState.isLoginPage;


                              },
                              child: SizedBox(
                                width: size.width,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    right: 0,
                                    top: 6,
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        loginState.isLoginPage
                                            ? 'Don\'t have account? '
                                            :
                                        'Already have account? ',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        loginState.isLoginPage
                                            ? 'Register Now.'
                                            :
                                        'Login Now.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),

                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}


