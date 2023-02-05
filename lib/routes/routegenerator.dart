import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoption/components/function/authintication.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';
import 'package:petadoption/pages/edituser.dart';
import 'package:petadoption/pages/mainpage.dart';
import 'package:petadoption/pages/signup.dart';

import '../pages/src.dart';

const String login = "/",
    signup = "signup",
    mainpage = "mainpage",
    editprofile = "editprofile";

final router = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) {
          return LoginPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: "/$signup",
        name: signup,
        builder: (context, state) {
          return SignUp(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: "/$mainpage",
        name: mainpage,
        builder: (context, state) {
          return MainPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: "/$editprofile",
        name: editprofile,
        builder: (context, state) {
          return EditProfile(
            key: state.pageKey,
          );
        },
      )
    ],
    refreshListenable: ref.read(authenticationglobal.notifier),
    redirect: (context, state) {
      final pageduplicate = ref.read(isduplacatepage.notifier);
      final auth = ref.read(authenticationglobal.notifier);
      final userislogin = auth.statusauth == AuthStatus.authenticated;
      final firstpage = state.subloc == login;
      final signinpage = state.subloc == "/$signup";
      final homepage = state.subloc == "/$mainpage";
      final usertoken = SharedPrefs.read(tokenuser) != "";

      if (!userislogin &&
          firstpage &&
          !usertoken &&
          SharedPrefs.read(tokenuser) == "") {
        return login;
      }
      if (SharedPrefs.read(tokenuser) != "") {
        // log("Am not empty", name: "FROM REDIRECT");
        // if (!userislogin && !firstpage && !signinpage
        //     // &&
        //     //(homepage || !homepage)
        //     ) {
        return "/$mainpage";
        //  }
      }
      return null;
    },
  ),
);
