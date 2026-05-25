import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/show_snackbar_message.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_botton.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscurePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey formkey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: AuthRepoImple()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Form(
              key: formkey,
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

                  SizedBox(height: 42.h),
                  Text(
                    'Welcome\nBack!',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.19,
                    ),
                  ),

                  SizedBox(height: 45.h),

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

                  SizedBox(height: 16.h),

                  CustomTextField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    controller: passwordController,
                    hint: 'Password',
                    prefixIcon: kClose,
                    isPassword: true,
                    obscure: obscurePassword,
                    onPressedSuffixIcon: () =>
                        setState(() => obscurePassword = !obscurePassword),
                  ),

                  SizedBox(height: 56.h),

                  Builder(
                    builder: (context) => CustomBttton(
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                          username: emailController.text,
                          password: passwordController.text,
                        );
                      },

                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            showSnackbarMessage(
                              context,
                              content: const Text('Login successful'),
                              color: Colors.green,
                            );
                            Navigation.pushReplacement(
                              context,
                              ScreensId.appView,
                            );
                          } else if (state is LoginFailure) {
                            print('Faliure message :${state.errorMessage}');
                            showSnackbarMessage(
                              context,
                              content: Text(state.errorMessage),
                              color: Colors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                          return Text(
                            'Login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
