import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/features/home/data/models/product_model/category.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImple extends HomeRepo {
  String? token = CacheHelper.getValue(key: CacheKeys.accessToken) as String?;
  @override
  Future<Either<Failures, List<CategoryModel>>> getCategories() async {
    try {
      var data = await ApiService.get(
        endPoint: 'categories',
        headers: {'Authorization': 'Bearer $token'},
      );
      print('token: $token');
      List<CategoryModel> catgories = [];
      for (var category in data['categories']) {
        catgories.add(CategoryModel.fromJson(category));
      }
      return Right(catgories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<ProductModel>>> getRecommendedProducts() async {
    try {
      var data = await ApiService.get(
        endPoint: 'best_seller_products',
        headers: {'Authorization': 'Bearer $token'},
      );
      List<ProductModel> recommendedProducts = [];
      for (var item in data['best_seller_products']) {
        recommendedProducts.add(ProductModel.fromJson(item));
      }
      return Right(recommendedProducts);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }
}
