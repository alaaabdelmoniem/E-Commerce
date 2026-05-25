import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/utils/widgets/cart_item.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/summary_row.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  TextEditingController? get addressController => null;

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
                    'Cart',
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

                      CartItemCard(
                        isPlaceorder: true,
                        productModel: widget.productModel,
                      ),

                      SizedBox(height: 40.h),

                      const SummaryRow(label: 'Subtotal', value: '\$ 0.00'),
                      SizedBox(height: 6.h),
                      const SummaryRow(label: 'Tax and Fees', value: '\$ 3.00'),
                      SizedBox(height: 6.h),
                      const SummaryRow(label: 'Delivery Fee', value: '\$ 2.00'),

                      Divider(height: 24.h, color: const Color(0xffCACACA)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Total',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.primaryFont,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\$ ${widget.productModel.price}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.primaryFont,
                              color: const Color(0xFFFF4D6D),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigation.push(context, ScreensId.checkout ,extra: widget.productModel);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4D6D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'checkout',
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
