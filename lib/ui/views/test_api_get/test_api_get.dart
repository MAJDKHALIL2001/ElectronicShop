import 'package:api_challenge/core/data/moduls/user_info.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Testapi extends StatefulWidget {
  const Testapi({super.key});

  @override
  State<Testapi> createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {
  List<UserInfo> listinfodata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder(
          //   future: UserRepository().getAllUsers(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.data != null) {
          //       snapshot.data!.fold((l) {
          //         BotToast.showText(text: l);
          //       }, (r) {
          //         listinfodata.clear();
          //         listinfodata.addAll(r);
          //       });
          //     }
          //     return snapshot.connectionState == ConnectionState.waiting
          //         ? SpinKitCircle(
          //             color: AppColors.black,
          //           )
          //         : ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: listinfodata.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Column(
          //                 children: [
          //                   // Text(listinfodata[index].name!.firstname??"")
          //                   Text(listinfodata[index].id.toString())
          //                   // Text(snapshot.connectionState.toString())
          //                 ],
          //               );
          //             },
          //           );
          //   },
          // ),

          // ElevatedButton(
          //     onPressed: () {
          //       UserRepository().getAllUsers().then((value) {
          //         value.fold((l) => BotToast.showText(text: l), (r) {
          //           setState(() {
          //             listinfodata.addAll(r);
          //           });
          //         });
          //       });
          //     },
          //     child: Text("Get All Info Usres")),
        ],
      ),
    );
  }
}
