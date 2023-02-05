import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petadoption/components/function/dashboardfunction.dart';
import 'package:petadoption/constant/images.dart';
import 'package:petadoption/pages/edituser.dart';
import 'package:petadoption/pages/login.dart';

class MyHeaderDrawer extends ConsumerStatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends ConsumerState<MyHeaderDrawer> {
  @override
  void initState() {
    

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dashcontrol = ref.watch(dashboardcontroller);

    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(avatar),
              ),
            ),
          ),
            Text(
          dashcontrol.users.firstname??"",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
          ),
          Text(
          dashcontrol.users.lastname??"",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          Column(
            children: [
              GestureDetector(
                child: Image.asset(
                  height: 50,
                  width: 50,
                  editprofile,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
