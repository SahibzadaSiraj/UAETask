import 'package:dubai_task/database/sqlite_database.dart';
import 'package:dubai_task/service_provider/address_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddAddressDialog extends StatelessWidget {
  String addressData;
  @override
  Widget build(BuildContext context) {
    final addressState=Provider.of<AddressService>(context);
    return Center(
      child: Wrap(
        children: [
          AlertDialog(
            title: Text("Add new Address"),
            content: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    onChanged: (v){
                      addressData=v;
                    },
                    decoration: InputDecoration(
                        hintText: 'Add address',
                        contentPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 0)
                    ),
                  )
                ],
              ),
            ),
            actions: [
              MaterialButton(onPressed: (){
                Map<String,dynamic>jsonData={
                  DatabaseHelper.addressData:addressData.toString().trim()
                };
                dbHelper.insert(jsonData, DatabaseHelper.addressTable).then((value) {
                  addressState.getAddress();
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
