
import 'package:dubai_task/app_constant/colors.dart';
import 'package:dubai_task/pages/animation/fade_animation.dart';
import 'package:dubai_task/service_provider/address_service.dart';
import 'package:dubai_task/widget/add_address_dailog.dart';

import 'package:dubai_task/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}


class _AddressPageState extends State<AddressPage> {

  @override
  void initState() {
    super.initState();
    final addressState=Provider.of<AddressService>(context,listen: false);
    addressState.getAddress();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final addressState=Provider.of<AddressService>(context);
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
                          decoration: BoxDecoration( color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },

                                  child: Icon(Icons.arrow_back_ios,size: 26,color: Colors.white,)),
                              Text(
                                "Addresses",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.whiteColor,
                                  fontSize: 24,),
                              ),
                              Text(
                                "         ",
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: size.height*0.02,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.whiteColor,
                                  fontSize: 24,),
                              ),
                              InkWell(
                                onTap: (){
                                  showDialog(context: context,
                                      builder: (context){
                                        return AddAddressDialog();
                                      });
                                },
                                child: Text(
                                  "Add New+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.whiteColor,
                                    fontSize: 20,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: size.height*0.8,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return Container(
                                margin: EdgeInsets.all(5),
                                width: size.width*0.6,
                                height: size.height*0.1,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.location_on,color: AppColor.secondaryColor,),
                                  title: Text("${addressState.addressList[index]['address']}"),
                                ),

                              );
                            },

                            itemCount: addressState.addressList.length),
                      )
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


