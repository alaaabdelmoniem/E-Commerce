import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/core/utils/widgets/cart_item.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 23.h),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.primaryFont,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(height: 36.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                            size: 18.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Delivery Address',
                            style: AppTextStyles.titleTextStyle,
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFonts.primaryFont,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Type address here\nor pick from map',
                                    hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontFamily: AppFonts.primaryFont,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,

                                    contentPadding: EdgeInsets.zero,
                                    hintMaxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 78.w,
                            height: 78.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 14,
                                  spreadRadius: -8,
                                  offset: const Offset(0, 6),
                                  color: Colors.black.withValues(alpha: .25),
                                ),
                                BoxShadow(
                                  blurRadius: 9,
                                  spreadRadius: -7,
                                  offset: const Offset(0, -4),
                                  color: Colors.black.withValues(alpha: .25),
                                ),
                              ],
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Image.asset(
                              'assets/images/localtionIcon.png',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      Text(
                        'Shopping List',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.primaryFont,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      CartItemCard(productModel: widget.productModel),

                      SizedBox(height: 40.h),
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigation.push(context, ScreensId.appView);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4D6D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Place Order',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.primaryFont,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // CustomBttton(
                      //   child: Text(
                      //     'Place Order',
                      //     style: TextStyle(
                      //       fontSize: 16.sp,
                      //       fontWeight: FontWeight.w600,
                      //       fontFamily: AppFonts.primaryFont,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
