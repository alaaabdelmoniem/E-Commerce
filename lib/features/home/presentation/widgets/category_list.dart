import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/home/data/models/product_model/category.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_products_from_category/get_products_from_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
    this.enable = false,
  });
  final List<CategoryModel> categories;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: enable
                ? () {
                    BlocProvider.of<GetProductsFromCategoryCubit>(
                      context,
                    ).getProductsFromCategory(id: categories[index].id ?? 0);
                  }
                : () {},
            child: Column(
              children: [
                Container(
                  height: 56.h,
                  width: 56.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    categories[index].imagePath!,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  categories[index].title ?? 'Has not title',
                  style: AppTextStyles.allFeaturedTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
