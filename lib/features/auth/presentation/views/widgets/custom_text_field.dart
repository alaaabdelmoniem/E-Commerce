import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.obscure = false,
    this.onPressedSuffixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final String prefixIcon;
  final bool isPassword;
  final bool obscure;
  final void Function()? onPressedSuffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: AppFonts.primaryFont,
          fontWeight: FontWeight.w500,
          color: const Color(0xff676767),
        ),

        prefixIcon: Image.asset(prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressedSuffixIcon,
                icon: Icon(
                  obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0XFF626262),
                  size: 20.r,
                ),
              )
            : null,

        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border: borderStyle(),
        focusedBorder: borderStyle(),
        enabledBorder: borderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Color(0xffA8A8A9)),
    );
  }
}
