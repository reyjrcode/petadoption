import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoption/routes/routegenerator.dart';
import 'package:petadoption/services/services.dart';

final signinclass = ChangeNotifierProvider((ref) => SigninClass());

class SigninClass extends ChangeNotifier {
  TextEditingController email = TextEditingController(),
      password = TextEditingController(),
      firstname = TextEditingController(),
      lastname = TextEditingController(),
      address = TextEditingController(),
      mobilenumber = TextEditingController();

}
