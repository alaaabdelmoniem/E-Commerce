import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/show_snackbar_message.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_botton.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: AuthRepoImple()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                IconButton(
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigation.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20.r,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 39.h),

                Text(
                  'Create an\naccount',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.19,
                  ),
                ),

                SizedBox(height: 33.h),

                CustomTextField(
                  controller: nameController,
                  hint: 'Full Name',
                  prefixIcon: kUser,
                ),

                SizedBox(height: 10.h),

                CustomTextField(
                  controller: phoneController,
                  hint: 'Phone',
                  prefixIcon: kPhone,
                ),

                SizedBox(height: 10.h),

                CustomTextField(
                  validator: (String? value) {
                    var emailRegex = RegExp(
                      r"^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
                    );
                    if (!emailRegex.hasMatch(value ?? '')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  controller: emailController,
                  hint: 'Email',
                  prefixIcon: kEmail,
                ),

                SizedBox(height: 10.h),

                CustomTextField(
                  controller: passwordController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field is Required';
                    }
                    return null;
                  },
                  hint: 'Password',
                  prefixIcon: kClose,
                  isPassword: true,
                  obscure: _obscurePassword,
                  onPressedSuffixIcon: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),

                SizedBox(height: 10.h),

                CustomTextField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'this field is required';
                    } else if (value != passwordController.text) {
                      return 'passwords do not match';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hint: 'Confirm Password',
                  prefixIcon: kClose,
                  isPassword: true,
                  obscure: _obscureConfirmPassword,
                  onPressedSuffixIcon: () => setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword,
                  ),
                ),

                SizedBox(height: 21.h),

                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: AppFonts.primaryFont,
                      color: const Color(0xff676767),
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: 'By clicking the '),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                      const TextSpan(
                        text: ' button, you agree\nto the public offer',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 28.h),

                Builder(
                  builder: (context) => CustomBttton(
                    onPressed: () {
                      BlocProvider.of<RegisterCubit>(context).registerUser(
                        username: nameController.text,
                        password: passwordController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                    },

                    child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          showSnackbarMessage(
                            context,
                            content: Text(state.message),
                            color: Colors.green,
                          );
                          Navigation.pushReplacement(
                            context,
                            ScreensId.appView,
                          );
                        } else if (state is RegisterFailure) {
                          showSnackbarMessage(
                            context,
                            content: Text(state.errorMessage),
                            color: Colors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: AppFonts.primaryFont,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
