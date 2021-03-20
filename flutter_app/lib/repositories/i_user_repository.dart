import 'package:flutter_app/models/UserModel.dart';

abstract  class  IUserRepositry {
  Future<List<UserModel>> findAllUsers();
}