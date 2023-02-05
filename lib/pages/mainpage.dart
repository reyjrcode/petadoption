import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petadoption/components/function/authintication.dart';
import 'package:petadoption/components/function/dashboardfunction.dart';
import 'package:petadoption/components/mydrawerheader.dart';
import 'package:petadoption/constant/colors.dart';
import 'package:petadoption/constant/images.dart';
import 'package:petadoption/constant/key.dart';
import 'package:petadoption/constant/sharedpreferences.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    if (SharedPrefs.read(tokenuser) != "") {
      ref.read(dashboardcontroller.notifier).getuserprofile();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authcontrol = ref.watch(authenticationglobal);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image.asset(
                  //   notification,
                  //   width: 24,
                  //   height: 24,
                  // )
                  SizedBox(
                    width: 50,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        authcontrol.signoutuser(context);
                      },
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
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            labelText: 'Search item',
                            fillColor: Color(0xffF0F69F),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Container(
                    height: 133,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -80,
                          left: -40,
                          child: Image.asset(
                            model,
                            width: 297,
                            height: 212,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10, top: 10),
                              child: Text(
                                " Big Sale\n Get the ready\n fashion at a\n discount of up\n to 50%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Expanded(
              //   child: GridView.builder(
              //       gridDelegate:
              //           const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //       ),
              //       itemBuilder: (context, index) {
              //         return Container(
              //           color: Colors.blue,
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("Jego shit"),
      ),
      // body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: const MyHeaderDrawer(),
          ),
        ),
      ),
    );
  }
}
