import 'package:dubai_task/app_constant/colors.dart';
import 'package:dubai_task/pages/address/address.dart';
import 'package:dubai_task/pages/drawer/drawer.dart';
import 'package:dubai_task/pages/phone/phones.dart';
import 'package:dubai_task/service_provider/address_service.dart';

import 'package:dubai_task/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animation/fade_animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final addressState = Provider.of<AddressService>(context, listen: false);
    addressState.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addressState = Provider.of<AddressService>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: size.height,
          child: TransparentLoading(
            isLoading: false,
            child: Container(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeAnimation(
                      delay: 0.3,
                      child: Container(
                        height: 60,
                        width: size.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  _scaffoldkey.currentState.openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  size: 35,
                                  color: Colors.white,
                                )),
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor,
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              "         ",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    MaterialButton(
                      minWidth: size.width * 0.8,
                      height: 45,
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AddressPage()));
                      },
                      child: Text("All Addresses"),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    MaterialButton(
                      minWidth: size.width * 0.8,
                      height: 45,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => PhonePage()));
                      },
                      color: Colors.grey,
                      child: Text("All Phone"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
