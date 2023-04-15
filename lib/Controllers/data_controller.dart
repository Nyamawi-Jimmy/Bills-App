import 'dart:math';

import 'package:elerarning/services/data_services.dart';
import 'package:get/get.dart';

import '../model/data_model.dart';

class DataController extends GetxController{
  RxList<DataModel>list=<DataModel>[].obs;
  final service = new DataServices();
  var _isLoading=false.obs;

  get isLoading => _isLoading.value;

  get newList=>list.where((e) => e.status==0?false:true).map((e) => e).toList();

  @override
  void onInit(){
    _loadData();
    super.onInit();
  }

  _loadData() async {
 try{
   _isLoading.value=false;
   var info=service.getUsers();
   list.addAll(await info);
 }catch(e){
print("Encountered an error");
 }finally{
   _isLoading.value=true;
 }
  }
}