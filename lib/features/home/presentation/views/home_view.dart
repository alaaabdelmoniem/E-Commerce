import 'package:e_commerce/features/home/data/repos/home_repo/home_repo_imple.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_category/get_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cubits/get_recommend_products/get_recommended_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      ],
      child:const Scaffold(
        body:  SafeArea(child: HomeViewBody()),


      ),
    );
  }
}
