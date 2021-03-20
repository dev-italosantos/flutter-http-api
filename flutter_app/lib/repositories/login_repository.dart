import 'package:flutter/material.dart';
import 'package:flutter_app/utils/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginRepository {
  login(email, password) async {
    var dio = CustomDio().instance;

    await dio.post('http://127.0.0.1:4000/auth/authetication',
        data: {'email': email, 'password': password}).then((res) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', res.data['token']);
    }).catchError((err) {
      Fluttertoast.showToast(
        msg: err.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception('Login Erro!');
    });
  }
}
