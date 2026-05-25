import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/widgets/nav.dart';
import 'package:e_commerce/core/utils/widgets/screens_id.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(
          context,
          ScreensId.productDetailsView,
          extra: productModel,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 305.h,
        width: 163.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 2,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                productModel.imagePath ?? '',
                height: 196.h,
                width: 163.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  height: 196.h,
                  width: 163.w,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name ?? 'Not Found',
                  style: AppTextStyles.productItemTitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4.h),

                Text(
                  productModel.description ?? 'No description available.',
                  style: AppTextStyles.productItemDescStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4.h),

                Text(
                  '₹${productModel.price?.toString() ?? '0'}',
                  style: AppTextStyles.productItemPriceStyle,
                ),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 16.r,
                      ignoreGestures: true,
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (_) {},
                    ),
                    SizedBox(width: 4.w),
                    Text('120', style: AppTextStyles.productItemRatingStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
