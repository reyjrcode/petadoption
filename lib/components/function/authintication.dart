import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';
import 'package:petadoption/routes/routegenerator.dart';
import 'package:petadoption/services/servicescall.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

final isduplacatepage = StateProvider((ref) => false);
final authenticationglobal = ChangeNotifierProvider((ref) => AuthGlobal());

class AuthGlobal extends ChangeNotifier {
  AuthStatus status = AuthStatus.unknown;
  AuthStatus get statusauth => status;

  signin(context, dynamic data) async {
    final result = await Servicecall.signin(
        email: data["email"], password: data["password"]);
    if (result.id != null) {
      status = AuthStatus.authenticated;
      notifyListeners();
    }
  }

  signup(context, dynamic data) async {
    try {
      await Servicecall.signup(data: data);
      status = AuthStatus.authenticated;
      notifyListeners();
    } on DioError catch (e) {
      log(e.response!.data["message"].toString());
    }
  }

  signoutuser(context) async {
    await Servicecall.usersignout()
        .then((value) async => await SharedPrefs.remove(tokenuser));
    status = AuthStatus.unauthenticated;
    // notifyListeners();
    log(status.toString());
    GoRouter.of(context).goNamed(login);
  }
}
