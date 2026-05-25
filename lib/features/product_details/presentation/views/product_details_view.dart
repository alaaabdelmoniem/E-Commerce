import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 27.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text('Product', style: AppTextStyles.titleTextStyle),
                  const SizedBox(),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 308.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.network(
                              widget.product.imagePath ?? '',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 60.sp,
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 12.h,
                          right: 12.w,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 36.r,
                              height: 36.r,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                                shape: BoxShape.circle,
                              ),
                              child: (widget.product.isFavorite ?? false)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Color(0xFFFF4D6D),
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 36.h),

                    Text(
                      widget.product.name ?? 'No Title',
                      style: AppTextStyles.titleTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Text(
                      widget.product.description ?? 'No description available',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.primaryFont,
                        color: Colors.black,
                        height: 1.14,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                            color: const Color(0xFFF83758),
                          ),
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) {
                                  setState(() => quantity--);
                                }
                              },
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFCCD5),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Text(
                                '$quantity',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFonts.primaryFont,
                                  color: const Color(0xff391713),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                                print("Quantity : $quantity");
                              },
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF83758),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 49.h),

                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigation.push(
                            context,
                            ScreensId.cartView,
                            extra: widget.product,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D6D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20.r,
                        ),
                        label: Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
