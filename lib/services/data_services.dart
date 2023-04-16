import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../model/data_model.dart';

class DataServices{
  String _baseUrl="http://gambo.rickieyngambo.xyz/bills/api";
  Future<List<DataModel>>getUsers() async {
    var apiUrl="/billinfo";
    http.Response response =await http.get(
      Uri.parse(_baseUrl+apiUrl)
    );
   try{
     if(response.statusCode==200){
       List<dynamic>list=await json.decode(response.body);
       print(list);
       print("worked");
      return list.map((e) => new DataModel.fromJson(e)).toList();
     }else{
       print(response.statusCode);
       print("something went wrong");
       return <DataModel>[];
     }
   }catch(e){
      print(e);
      print("error passing data");
      return  <DataModel>[];
   }
/*    var info =rootBundle.loadString("json/data.json");
    List<dynamic> list = json.decode(await info);
    return Future.delayed(Duration(seconds: 1),
      ()=> list.map((e) => e).toList(),
    );*/
  }

}