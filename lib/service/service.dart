import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_app_for_care_monitor/model/menumodel.dart';

class WebService {
  var dio = Dio();
  String apiurl ='';
  Future<List<Menu>> getFoodMenu() async{
    final response= await dio.get('https://foodapp-api-test.herokuapp.com/menu');
    if(response.statusCode == 200){
      final result = response.data;
      Iterable list = result['data'];
      return list.map((menu) => Menu.fromJson(menu)).toList();
    }
    else{
      throw Exception('no menu from api');
    }
  }
}