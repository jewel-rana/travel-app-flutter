import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/Models/data_model.dart';

class ApiServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  getInfo() async {
    var apiUrl = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl+apiUrl));

    try{
      if(response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((item) => DataModel.fromJson(item)).toList();
      } else {
        return <DataModel>[];
      }
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
      return <DataModel>[];
    }
  }
}