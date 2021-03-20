import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
  }
  CustomDio.withAuthetication() {
    _dio = Dio();
    _dio.interceptor.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token');
    options.headers['Authetication'] = token;
  }

  _onResponse(Response err) {
    print('Response Log');
    print(err.data);
    print('Response Log');
  }

  _onError(DioError err) {
    return err;
  }
}
