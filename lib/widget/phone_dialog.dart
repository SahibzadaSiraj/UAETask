import 'package:dubai_task/database/sqlite_database.dart';
import 'package:dubai_task/service_provider/address_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PhoneDialog extends StatelessWidget {
  String phoneData;
  @override
  Widget build(BuildContext context) {
    final addressState=Provider.of<AddressService>(context);
    return Center(
      child: Wrap(
        children: [
          AlertDialog(
            title: Text("Add new phone number"),
            content: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    onChanged: (v){
                      phoneData=v;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(

                        hintText: 'Add phone number',
                        contentPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 0)
                    ),
                  )
                ],
              ),
            ),
            actions: [
              MaterialButton(onPressed: (){
                Map<String,dynamic>jsonData={
                  DatabaseHelper.phoneData:phoneData.toString().trim()
                };
                dbHelper.insert(jsonData, DatabaseHelper.phoneTable).then((value) {
                  addressState.getPhones();
                  Navigator.pop(context);
                });

              },
                child: Text("Add"),
              ),
              MaterialButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text("Cancel"),
              )
            ],
          )
        ],
      ),
    );
  }
}
