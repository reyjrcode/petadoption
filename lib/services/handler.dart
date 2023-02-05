import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';

enum DioType { post, get }

class MethodHandler {
  static final dio = Dio();
  static String token = SharedPrefs.read(tokenuser);
  static Future<Response> handler(
      {DioType? type, dynamic data, String? urlpath, bool? haveBearer}) async {
    if (type == DioType.post) {
      log("Current Token $token", name: "CURRENT TOKEN");

      final response = await dio.post(urlpath!,
          data: data,
          options: haveBearer == true || haveBearer != null
              ? Options(headers: {"Authorization": "Bearer $token"})
              : Options());
      return response;
    } else {
      log("Current Token $token", name: "CURRENT TOKEN");
      final response = await dio.get(urlpath!,
          options: haveBearer == true || haveBearer != null
              ? Options(headers: {"Authorization": "Bearer $token"})
              : Options());
      return response;
    }
  }
}
