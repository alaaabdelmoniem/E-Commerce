import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/show_snackbar_message.dart';
import 'package:e_commerce/core/utils/widgets/product_loading.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_category/get_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_recommend_products/get_recommended_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_list.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_loading.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_page_view_home.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(kSplashImage, width: 38.7.w, height: 31.h),
                    const Text(
                      'Stylish',
                      style: TextStyle(
                        color: Color(0xff4392F9),
                        fontFamily: AppFonts.logoTextFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search any Product..',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBBBBBB),
                      ),
                      prefixIcon: Image.asset(kSearchImageIcom),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 17.h),
                Text('All Featured', style: AppTextStyles.titleTextStyle),
                SizedBox(height: 25.h),
                BlocConsumer<GetCategoryCubit, GetCategoryState>(
                  listener: (context, state) {
                    if (state is GetCategoryFailure) {
                      print('Error Message ${state.errorMessage}');
                      showSnackbarMessage(
                        context,
                        content: Text(state.errorMessage),
                        color: Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetCategorySuccess) {
                      return CategoryList(categories: state.categories);
                    } else if (state is GetCategoryLoading) {
                      return CategoryLoading();
                    }
                    return const CategoryList(categories: []);
                  },
                ),
                SizedBox(height: 23.h),
                const CustomPageViewHome(),
                SizedBox(height: 32.h),
                Text('Recommended', style: AppTextStyles.titleTextStyle),
                SizedBox(height: 18.h),
              ],
            ),
          ),

          BlocBuilder<GetRecommendedProductsCubit, GetRecommendedProductsState>(
            builder: (context, state) {
              if (state is GetRecommendedProductsSuccess) {
                return ProductsGridView(recommendProducts: state.products);
              } else if (state is GetRecommendedProductsLoading) {
                return const ProductLoading();
              } else if (state is GetRecommendedProductsFailure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.errorMessage)),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(child: Text('No Products Found')),
              );
            },
          ),
        ],
      ),
    );
  }
}
