import 'package:api_challenge/core/data/moduls/post_model.dart';

import 'package:api_challenge/core/data/repository/post_repository.dart';
import 'package:api_challenge/ui/shared/colors.dart';
import 'package:api_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:api_challenge/ui/views/api_challenge/home_challenge/home_chllenge.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../shared/custom_widgets/custom_botton.dart';

class AddPost extends StatefulWidget {
  final PostModel? PostInfo;

  const AddPost({super.key, this.PostInfo});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isUpdate = false;
  bool isLoading = false;

  @override
  void initState() {
    //isUpdate = widget.post != null ? true : false;
    isUpdate = widget.PostInfo != null;

    if (isUpdate) {
      titleController.text = widget.PostInfo!.title ?? "";
      bodyController.text = widget.PostInfo!.body ?? "";
    }
    super.initState();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Container(
                width: 300,
                child: Image.asset(
                  'assets/images/pngs/challenge.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
              child: Text(
                isUpdate ? 'Edit post' : 'Add new post',
                style: TextStyle(fontSize: 35),
              ),
            ),
            TextFormField(
              maxLines: 3,
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                  contentPadding: EdgeInsets.only(left: 20, top: 40),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 10,
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: 'Body',
                  hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                  contentPadding: EdgeInsets.only(left: 20, top: 40),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Spacer(),
            isLoading
                ? SpinKitCircle(
                    color: AppColors.blue100,
                  )
                : InkWell(
                    onTap: () {
                      if (titleController.text.isEmpty ||
                          bodyController.text.isEmpty) {
                        BotToast.showText(text: 'Please fill in all fields');
                      } else {
                        setState(() {
                          isLoading = true;
                        });

                        if (!isUpdate) {
                          PostRepository()
                              .AddNewPost(
                            title: titleController.text,
                            body: bodyController.text,
                          )
                              .then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            value.fold((l) {
                              BotToast.showText(text: l);
                            }, (r) {
                              BotToast.showText(text: 'create done');
                            });
                          });
                        } else {
                          PostRepository()
                              .EditPost(
                            title: titleController.text,
                            body: bodyController.text,
                            postNum: widget.PostInfo!.id!.toString(),
                          )
                              .then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            value.fold((l) {
                              BotToast.showText(text: l);
                            }, (r) {
                              BotToast.showText(text: 'update done');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeChallenge(),
                                  ));
                            });
                          });
                        }
                      }
                    },
                    child: Center(
                      child: customButton(
                          customText: CustomText(
                            text: isUpdate ? 'Edit' : 'SAVE',
                            textColor: Colors.white,
                            fontSize: 20,
                          ),
                          showGradient: true,
                          linearGradient: LinearGradient(
                            colors: [
                              // AppColors.blue100,
                              // AppColors.blue100,

                              // AppColors.black,
                              // AppColors.black,
                              AppColors.blue200,
                              AppColors.blue200,
                              AppColors.blue200,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )),
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
