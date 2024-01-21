import 'package:api_challenge/core/data/moduls/photo_info.dart';

import 'package:api_challenge/core/data/moduls/post_model.dart';

import 'package:api_challenge/core/data/repository/post_repository.dart';

import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/views/api_challenge/create_update_post_view/create_update_post_view.dart';
import 'package:api_challenge/ui/views/api_challenge/home_challenge/home_chllenge.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetPost extends StatefulWidget {
  const GetPost({super.key, required this.infoPost});
  final PostModel infoPost;

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  PostModel postInfoid = PostModel();
  List<PhotoInfo> listimage = [];
  final bool edit = true;
  late String title;
  late String body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
        child: ListView(physics: BouncingScrollPhysics(), children: [
          // Center(child: Text(widget.infoPost.toString())),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddPost(PostInfo: widget.infoPost),
                                ));
                          },
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            PostRepository()
                                .DeletePost(
                                    postNum: widget.infoPost.id.toString())
                                .then((value) {
                              value.fold((l) {
                                BotToast.showText(text: l);
                              }, (r) {
                                BotToast.showText(text: 'delete sucess');
                                Navigator.pop(context);
                              });
                            });
                            ;
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.infoPost.title.toString(),
                        style: TextStyle(color: AppColors.blue400)),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: Text(
                        widget.infoPost.body.toString(),
                        // maxLines: 3,
                        // overflow: TextOverflow.visible,
                      ),
                    )
                  ]),
            ),
          ),

          Text(
            'Album:',
            style: TextStyle(color: AppColors.blue400, fontSize: 30),
          ),
          FutureBuilder(
            future: PostRepository()
                .getAllPhoto(photoNum: widget.infoPost.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                snapshot.data!.fold((l) {
                  BotToast.showText(text: l);
                }, (r) {
                  listimage.clear();
                  listimage.addAll(r);
                });
              }
              return snapshot.connectionState == ConnectionState.waiting
                  ? SpinKitCircle(
                      color: AppColors.black,
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listimage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            // Text(listinfodata[index].name!.firstname??"")
                            Padding(
                              padding: const EdgeInsetsDirectional.all(20),
                              child: Image.network(
                                listimage[index].url.toString(),
                                width: 600,
                                // height: 600,
                              ),
                            )
                            // Text(snapshot.connectionState.toString())
                          ],
                        );
                      },
                    );
            },
          ),
        ]),
      ),
    ));
  }
}
