import 'package:dubai_task/app_constant/colors.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatefulWidget {
  final BuildContext context;
  MyDrawer({this.context});
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage("assets/log.jpg")
              )
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddressPage()));
           Navigator.pop(context);
            },
            leading: Icon(Icons.location_on,color: AppColor.mainColor,),
            title: Text("All Addresses"),
          ),
          ListTile(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>PhonePage()));
              Navigator.pop(context);
            },
            leading: Icon(Icons.phone_android,color: AppColor.mainColor,),
            title: Text("All Phone Number"),
          )
        ],
      ),
    );
  }
}
