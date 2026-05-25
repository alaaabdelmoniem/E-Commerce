import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/data/repos/items_repo/items_repo.dart';

class ItemsRepoImple extends ItemsRepo {
  String? token = CacheHelper.getValue(key: CacheKeys.accessToken) as String?;

  @override
  Future<Either<Failures, List<ProductModel>>> getProductsFromCategories({
    required int id,
  }) async {
    try {
      var data = await ApiService.get(
        endPoint: 'categories',
        headers: {'Authorization': 'Bearer $token'},
      );
      print('token: $token');
      List<ProductModel> products = [];

      for (var item in data['categories']) {
        if (id == item['id']) {
          for (var product in item['products']) {
            products.add(ProductModel.fromJson(product));
          }
          break;
        }
      }
      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }
}
