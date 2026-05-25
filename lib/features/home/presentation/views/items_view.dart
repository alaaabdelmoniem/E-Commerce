import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/theme/app_fonts.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/utils/show_snackbar_message.dart';
import 'package:e_commerce/core/utils/widgets/product_loading.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo_imple.dart';
import 'package:e_commerce/features/home/data/repos/items_repo/items_repo_imple.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_category/get_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_products_from_category/get_products_from_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_recommend_products/get_recommended_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_list.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_loading.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoryCubit(homeRepo: HomeRepoImple())..getCategory(),
        ),
        BlocProvider(
          create: (context) =>
              GetRecommendedProductsCubit(homeRepo: HomeRepoImple())
                ..getRecommendedProducts(),
        ),
        BlocProvider(
          create: (context) =>
              GetProductsFromCategoryCubit(itemsRepo: ItemsRepoImple()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
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
                          Image.asset(
                            kSplashImage,
                            width: 38.7.w,
                            height: 31.h,
                          ),
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
                            return CategoryList(
                              categories: state.categories,
                              enable: true,
                            );
                          } else if (state is GetCategoryLoading) {
                            return const CategoryLoading();
                          }
                          return const CategoryList(categories: []);
                        },
                      ),

                      SizedBox(height: 32.h),
                      Text('Products', style: AppTextStyles.titleTextStyle),
                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
                BlocConsumer<GetProductsFromCategoryCubit,GetProductsFromCategoryState>(
                  builder: (context, state) {
                    if (state is GetProductsFromCategoryLoading) {
                      return const ProductLoading();
                    } else if (state is GetProductsFromCategorySuccess) {
                      return ProductsGridView(
                        recommendProducts: state.products,
                      );
                    } else {
                      return intialStatebeforeDisplay();
                    }
                  },
                  listener: (context, state) {
                    if (state is GetProductsFromCategoryFailure) {
                      showSnackbarMessage(
                        context,
                        content: Text(state.errorMessage),
                        color: Colors.red,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<GetRecommendedProductsCubit, GetRecommendedProductsState>
  intialStatebeforeDisplay() {
    return BlocBuilder<
      GetRecommendedProductsCubit,
      GetRecommendedProductsState
    >(
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
    );
  }
}
