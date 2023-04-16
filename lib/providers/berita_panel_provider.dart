import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeritaPanelProvider with ChangeNotifier{
  List data = [];

  Future<List> muatdata()async{
      final url = "http://api.mediastack.com/v1/news?access_key=7ef271e80a3e949708a3c4e591e04c84";
      final response = await http.get(Uri.parse(url));
      if(response.statusCode !=200){
        data = [];
      }else{
        final js = jsonDecode(response.body);
        data = js['data'];
      }
      return data;
  }

}