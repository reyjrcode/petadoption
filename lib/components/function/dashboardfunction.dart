import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';
import 'package:petadoption/model/usersmodel.dart';
import 'package:petadoption/services/servicescall.dart';

final dashboardcontroller = ChangeNotifierProvider((ref) => DashBoard());

class DashBoard extends ChangeNotifier {
  Users users = Users();
  getuserprofile() async {
    log(SharedPrefs.read(tokenuser).toString(), name: "USER TOKEN IN DASH");
    final result = await Servicecall.userprofile();
    users = result;
    notifyListeners();
    log(users.toJson().toString());
  }
}
