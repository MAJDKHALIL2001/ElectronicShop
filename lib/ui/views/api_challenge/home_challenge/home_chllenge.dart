// import 'package:api_challenge/core/data/moduls/post_model.dart';
// import 'package:api_challenge/core/data/repository/post_repository.dart';

// import 'package:api_challenge/ui/shared/colors.dart';
// import 'package:api_challenge/ui/views/create_update_post_view/create_update_post_view.dart';
// import 'package:api_challenge/ui/views/get_post/get_post.dart';
// import 'package:bot_toast/bot_toast.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class HomeChallenge extends StatefulWidget {
//   const HomeChallenge({
//     super.key,
//   });

//   @override
//   State<HomeChallenge> createState() => _HomeChallengeState();
// }

// class _HomeChallengeState extends State<HomeChallenge> {
//   List<PostModel> listpost = [];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Colors.white,
//           Color.fromRGBO(140, 220, 205, 1),
//           Color.fromRGBO(12, 181, 149, 1),
//         ], begin: Alignment.topLeft, end: Alignment.bottomCenter)),
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Padding(
//             padding:
//                 const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
//             child: Column(children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddPost(),
//                         ));
//                   },
//                   child: Icon(Icons.edit, size: 50),
//                 ),
//               ),
//               Container(
//                 width: 240,
//                 child: Image.asset(
//                   'assets/images/pngs/challenge.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               FutureBuilder(
//                 future: PostRepository().getAllPost(),
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if (snapshot.data != null) {
//                     snapshot.data!.fold((l) {
//                       BotToast.showText(text: l);
//                     }, (r) {
//                       listpost.clear();
//                       listpost.addAll(r);
//                     });
//                   }
//                   return snapshot.connectionState == ConnectionState.waiting
//                       ? SpinKitCircle(
//                           color: AppColors.black,
//                         )
//                       : ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: listpost.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           GetPost(infoPost: listpost[index]),
//                                     ));
//                               },
//                               child: Column(
//                                 children: [
//                                   // Text(listpost[index].name!.firstname??"")
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.symmetric(
//                                             vertical: 10),
//                                     child: Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                             width: 1,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(25)),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional
//                                                 .symmetric(
//                                             horizontal: 20, vertical: 20),
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 listpost[index]
//                                                     .title
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     color: AppColors.blue400),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .only(top: 10),
//                                                 child: Text(
//                                                   listpost[index]
//                                                       .body
//                                                       .toString(),
//                                                   // maxLines: 3,
//                                                   // overflow: TextOverflow.visible,
//                                                 ),
//                                               )
//                                             ]),
//                                       ),
//                                     ),
//                                   )
//                                   // Text(snapshot.connectionState.toString())
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                 },
//               ),
//             ]),
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:api_challenge/ui/views/api_challenge/home_challenge/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:api_challenge/ui/views/api_challenge/create_update_post_view/create_update_post_view.dart';
import 'package:api_challenge/ui/views/api_challenge/get_post/get_post.dart';

import '../../../shared/colors.dart';

class HomeChallenge extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(140, 220, 205, 1),
            Color.fromRGBO(12, 181, 149, 1),
          ], begin: Alignment.topLeft, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
              child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddPost());
                    },
                    child: Icon(Icons.edit, size: 50),
                  ),
                ),
                Container(
                  width: 240,
                  child: Image.asset(
                    'assets/images/pngs/challenge.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return homeController.listpost.isEmpty
                      // loading indicator
                      ? SpinKitCircle(
                          color: AppColors.black,
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeController.listpost.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => GetPost(
                                    infoPost: homeController.listpost[index]));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.symmetric(
                                            vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                                .symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                homeController
                                                    .listpost[index].title
                                                    .toString(),
                                                style: TextStyle(
                                                    color: AppColors.blue400),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .only(top: 10),
                                                child: Text(
                                                  homeController
                                                      .listpost[index].body
                                                      .toString(),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
