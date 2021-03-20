import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authenticate {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post('http://127.0.0.1:4000/auth/authetication',
          data: { "email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (err) {
      Fluttertoast.showToast(
        msg: err.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}