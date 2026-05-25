import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/data/repos/items_repo/items_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_from_category_state.dart';

class GetProductsFromCategoryCubit extends Cubit<GetProductsFromCategoryState> {
  GetProductsFromCategoryCubit({required this.itemsRepo})
    : super(GetProductsFromCategoryInitial());

  final ItemsRepo itemsRepo;
  Future<void> getProductsFromCategory({required int id}) async {
    emit(GetProductsFromCategoryLoading());
    var result = await itemsRepo.getProductsFromCategories(id: id)
      ..fold(
        (failure) {
          emit(
            GetProductsFromCategoryFailure(errorMessage: failure.errorMessage),
          );
        },
        (sucess) {
          emit(GetProductsFromCategorySuccess(products: sucess));
        },
      );
  }
}
