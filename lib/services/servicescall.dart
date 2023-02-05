import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';
import 'package:petadoption/model/usersmodel.dart';
import 'package:petadoption/services/services.dart';

class Servicecall {
  static Future<Response> signup({dynamic data}) async {
    final result = await MethodHandler.handler(
        urlpath: Api.signup, type: DioType.post, data: data, haveBearer: false);
    if (result.statusCode == 200) {
      await SharedPrefs.write(tokenuser, result.data["bearer"].toString());
      log(result.data["bearer"]);
      return result;
    } else {
      return result;
    }
  }

  static Future<Users> signin({String? email, String? password}) async {
    final result = await MethodHandler.handler(
        urlpath: Api.signin,
        type: DioType.post,
        data: {"email": "$email", "password": "$password"},
        haveBearer: false);
    if (result.statusCode == 200) {
      await SharedPrefs.write(tokenuser, result.data["bearer"].toString());
      log(result.data["bearer"]);
      return Users.fromJson(result.data["user"]);
    } else {
      return Users();
    }
  }

  static Future<Users> userprofile() async {
    var user = Users();
    try {
      final result = await MethodHandler.handler(
          urlpath: Api.userprofile, type: DioType.get, haveBearer: true);
      if (result.statusCode == 200) {
        user = Users.fromJson(result.data["user"]);
      } else {
        user = Users();
      }
    } on DioError catch (e) {
      log(e.response!.data.toString(), name: "FROM SIGN IN");
    }
    return user;
  }

  static Future<void> usersignout() async {
    try {
      await MethodHandler.handler(
        urlpath: Api.signout,
        type: DioType.post,
        haveBearer: true,
      );
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  static Future<Users> updateprofile({Users? users}) async {
    final result = await MethodHandler.handler(
        urlpath: Api.updateuserprofile,
        type: DioType.post,
        haveBearer: true,
        data: {
          "id": users!.id,
          "firstname": users.firstname,
          "lastname": users.lastname,
          "address": users.address,
          "mobilenumber": users.mobilenumber
        });
    if (result.statusCode == 200) {
      return Users.fromJson(result.data["user"]);
    } else {
      return Users();
    }
  }
}
