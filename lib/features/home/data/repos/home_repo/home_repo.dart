import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/home/data/models/product_model/category.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductModel>>> getRecommendedProducts();
  Future<Either<Failures, List<CategoryModel>>> getCategories();
}
