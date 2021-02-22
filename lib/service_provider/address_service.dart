import 'package:dubai_task/database/sqlite_database.dart';
import 'package:flutter/cupertino.dart';

class AddressService extends ChangeNotifier{

  List<Map<String,dynamic>> _addressList=[];
  List<Map<String,dynamic>> _phoneList=[];


  set addressList(v){
    _addressList=v;
    notifyListeners();
  }
  List<Map<String,dynamic>> get addressList=>_addressList;
 set phoneList(v){
   _phoneList=v;
    notifyListeners();
  }
  List<Map<String,dynamic>> get phoneList=>_phoneList;

  getAddress(){
    _addressList=[];
    dbHelper.queryAllRows(tableName: DatabaseHelper.addressTable).then((value) {
      value.forEach((element) {
        _addressList.add(element);
        notifyListeners();
      });

    });
  }
  getPhones(){
    _phoneList=[];
    dbHelper.queryAllRows(tableName: DatabaseHelper.phoneTable).then((value) {
      value.forEach((element) {
        _phoneList.add(element);
        notifyListeners();
      });

    });
  }
}

