part of 'get_products_from_category_cubit.dart';

@immutable
sealed class GetProductsFromCategoryState {}

final class GetProductsFromCategoryInitial extends GetProductsFromCategoryState {}
final class GetProductsFromCategoryLoading extends GetProductsFromCategoryState {}
final class GetProductsFromCategorySuccess extends GetProductsFromCategoryState {
  final List<ProductModel> products;
  GetProductsFromCategorySuccess({required this.products});
}
final class GetProductsFromCategoryFailure extends GetProductsFromCategoryState {
  final String errorMessage;
  GetProductsFromCategoryFailure({required this.errorMessage});
}