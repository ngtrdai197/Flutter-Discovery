import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/api_constants.dart';
import 'package:myapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio _dio = new Dio();
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
Future<Dio> getApiClient() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token');
  _dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
    // Do something before request is sent
    options.headers["x-access-token"] = token;
    return options;
  }, onResponse: (Response response) {
    // Do something with response data
    return response; // continue
  }, onError: (DioError error) async {
    // Do something with response error
    if (error.response?.statusCode == 403 ||
        error.response?.statusCode == 401) {
      print('vo day roi');
      showDialog(
        context: navigatorKey.currentState.overlay.context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      navigatorKey.currentState.pushReplacementNamed(Routes.login);
      return error;
    } else {
      return error;
    }
  }));
  _dio.options.baseUrl = ApiConstants.baseUrl;
  return _dio;
}
