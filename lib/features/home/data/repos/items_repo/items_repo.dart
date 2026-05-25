import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';

abstract class ItemsRepo {
  Future<Either<Failures, List<ProductModel>>> getProductsFromCategories({

    required int id,

  });
}
