import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/show_snackbar_message.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/presentation/manager/cubits/log_out/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(authRepo: AuthRepoImple()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12.h),

              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.primaryFont,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              CircleAvatar(
                radius: 50.r,
                backgroundColor: const Color(0xFFFFE0E6),
                child: Icon(Icons.person, size: 50.r, color: AppColors.primary),
              ),

              SizedBox(height: 12.h),

              Text(
                'User full Name',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.primaryFont,
                  color: const Color(0xFFFF4D6D),
                ),
              ),

              SizedBox(height: 32.h),

              ProfileMenuItem(
                icon: Icons.person_outline,
                label: 'My Profile',
                onTap: () {
                  Navigation.push(context, ScreensId.updateProfile);
                },
              ),
              ProfileMenuItem(
                icon: Icons.shopping_bag_outlined,
                label: 'My Orders',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.favorite_outline,
                label: 'My Favorites',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {},
              ),

              SizedBox(height: 50.h),

              Divider(
                color: AppColors.primary,
                thickness: 1,
                indent: 24.w,
                endIndent: 24.w,
              ),
              SizedBox(height: 44.h),

              BlocListener<LogOutCubit, LogOutState>(
                listener: (context, state) {
                  if (state is LogOutSuccess) {
                    showSnackbarMessage(
                      context,
                      content: Text(state.message),
                      color: Colors.green,
                    );
                    Navigation.pushandRemoveUntil(context, ScreensId.loginView);
                  }
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.black, size: 22.r),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.primaryFont,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<LogOutCubit>(context).logOut();
                  },
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 22.r),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.primaryFont,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.black),
      onTap: onTap,
    );
  }
}
