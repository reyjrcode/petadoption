import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoption/components/function/authintication.dart';
import 'package:petadoption/components/function/loginfunction.dart';
import 'package:petadoption/constant/colors.dart';
import 'package:petadoption/constant/images.dart';
import 'package:petadoption/pages/signup.dart';
import 'package:petadoption/routes/routegenerator.dart';

import '../constant/validator.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signinclass);
    final auth = ref.watch(authenticationglobal);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        child: Form(
          key: form1,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 245,
                  width: 409.79,
                  child: Image.asset(loginpicture),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Log in to your account"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    labelText: 'Enter Email',
                    fillColor: Color(0xffF0F69F),
                    border: OutlineInputBorder(),
                  ),
                  // validator: (value) => Validator.emptyfield(value),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    filled: true,
                    labelText: 'Enter Password',
                    fillColor: Color(0xffF0F69F),
                    border: OutlineInputBorder(),
                  ),
                  // validator: (value) => Validator.emptyfield(value),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 224,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (form1.currentState!.validate()) {
                      // controller.signin(context);
                      auth.signin(context, {
                        "email": controller.email.text,
                        "password": controller.password.text,
                      });
                    }

                    context.goNamed(mainpage);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xffD8EFF0),
                      side: const BorderSide(width: 1.0)),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Or Sign-in with"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffD8EFF0),
                          side: const BorderSide(width: 1.0)),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset(
                          google,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffD8EFF0),
                          side: const BorderSide(width: 1.0)),
                      child: SizedBox(
                        child: Image.asset(
                          facebook,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffD8EFF0),
                          side: const BorderSide(width: 1.0)),
                      child: SizedBox(
                        child: Image.asset(
                          twiter,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an acount yet?",
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign up here!",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
