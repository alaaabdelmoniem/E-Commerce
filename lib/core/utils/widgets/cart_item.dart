import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    this.isPlaceorder = false,
    required this.productModel,
  });
  final bool isPlaceorder;
  final ProductModel productModel;
  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 1;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 14,
            spreadRadius: -8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 125.h,
                width: 130.5.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.network(
                  widget.productModel.imagePath ?? '',
                  height: 125.h,
                  width: 130.w,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    height: 125.h,
                    width: 130.w,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),

              SizedBox(width: 8.5.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.productModel.name}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.primaryFont,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Text(
                          '${widget.productModel.rating}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.star,
                          color: const Color(0xffF7B305),
                          size: 14.r,
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      mainAxisAlignment: !widget.isPlaceorder
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$ ${widget.productModel.price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${widget.productModel.price! + widget.productModel.price! * .1}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontFamily: AppFonts.primaryFont,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    widget.isPlaceorder
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 24.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE0E6),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 16.r,
                                    color: const Color(0xFFFF4D6D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFonts.primaryFont,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  width: 24.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF4D6D),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 16.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Order ($quantity) :',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.primaryFont,
                ),
              ),
              Text(
                '\$ ${quantity * widget.productModel.price!}',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.primaryFont,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
