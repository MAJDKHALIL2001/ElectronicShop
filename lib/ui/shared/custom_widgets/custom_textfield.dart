import 'package:api_challenge/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.text,
      this.color = AppColors.dgreygolor,
      this.controller,
      this.validator,
      this.obscure,
      this.sufixicon});
  final String text;
  final bool? obscure;
  final Color? color;
  final InkWell? sufixicon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
          suffixIcon: sufixicon,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.width / 16, horizontal: size.width / 21),
          border: InputBorder.none,
          fillColor: color,
          filled: true,
          errorStyle: TextStyle(color: AppColors.blue300),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue100),
              borderRadius: BorderRadius.circular(50)),
          hintText: text,
          hintStyle:
              TextStyle(color: AppColors.white, fontSize: size.width / 30)),
    );
  }
}
