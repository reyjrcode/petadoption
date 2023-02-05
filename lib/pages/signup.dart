import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petadoption/components/function/authintication.dart';
import 'package:petadoption/components/function/loginfunction.dart';
import 'package:petadoption/constant/colors.dart';
import 'package:petadoption/constant/images.dart';
import 'package:petadoption/pages/login.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
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
            // key: form2,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        height: 50,
                        width: 50,
                        backarrow,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 245,
                    width: 409.79,
                    child: Image.asset(signups),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.firstname,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter First Name',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.lastname,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter Last Name',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.address,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter Address',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.mobilenumber,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter Mobile number',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter email address',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // controller: controller.password,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_off_outlined),
                      filled: true,
                      labelText: 'Enter password',
                      fillColor: Color(0xffF0F69F),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) => Validator.emptyfield(value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 224,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      final user = {
                        "firstname": controller.firstname.text,
                        "lastname": controller.lastname.text,
                        "email": controller.email.text,
                        "mobilenumber": controller.mobilenumber.text,
                        "address": controller.address.text,
                        "password": controller.password.text
                      };
                      auth.signup(context, user);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xffD8EFF0),
                        side: const BorderSide(width: 1.0)),
                    child: const Center(
                      child: Text(
                        "Sign UP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Or Sign-up with"),
                const SizedBox(
                  height: 15,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
