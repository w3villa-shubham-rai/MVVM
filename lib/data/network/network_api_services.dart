import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:model_viewmodel_view_practice/data/app_exception.dart';
import 'package:model_viewmodel_view_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  // get method api here
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responsceJson;
    try {
      final response =
          await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsceJson = returnResponsce(response);
    } on SocketException {
      throw InternetException("connect to internet");
    } on RequestTimeout {
      throw RequestTimeout("Session expire");
    }

    return responsceJson;
  }

  // post api Here

  // @override
  // Future<dynamic> postApi(var data, String url) async {
  //   if (kDebugMode) {
  //     print(url);
  //     print(data);
  //   }

  //   dynamic responsceJson;
  //   try {
  //     final response = await http
  //         .post(Uri.parse(url), body: data
  //         // jsonEncode(data)
  //         )
  //         .timeout(const Duration(seconds: 10));
  //     responsceJson = returnResponsce(response);
  //   } on SocketException {
  //     throw InternetException("connect to internet");
  //   }
  //   if (kDebugMode) {
  //     print(responsceJson);
  //   }
  //   return responsceJson;
  // }


  @override
  Future<dynamic> postApi(var data , String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {

      final response = await post(Uri.parse(url),
        body: data,
      ).timeout( const Duration(seconds: 10));
      responseJson  = returnResponsce(response) ;
    }on SocketException {
      throw InternetException('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;

  }

  dynamic returnResponsce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsceJson = jsonDecode(response.body);
        return responsceJson;
      case 400:
        dynamic responsceJson = jsonDecode(response.body);
        return responsceJson;
      default:
        throw FetchedDataException(
            "Error occured when communication with server${response.statusCode}");
    }
  }
}





