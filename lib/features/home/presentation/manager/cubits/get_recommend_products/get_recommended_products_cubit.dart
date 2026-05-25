import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_recommended_products_state.dart';

class GetRecommendedProductsCubit extends Cubit<GetRecommendedProductsState> {
  GetRecommendedProductsCubit({required this.homeRepo})
    : super(GetRecommendedProductsInitial());
  final HomeRepo homeRepo;

  Future<void> getRecommendedProducts() async {
    emit(GetRecommendedProductsLoading());

    var result = await homeRepo.getRecommendedProducts()
      ..fold(
        (failure) {
          emit(
            GetRecommendedProductsFailure(errorMessage: failure.errorMessage),
          );
        },
        (recommendProducts) {
          if (!isClosed) {
            emit(GetRecommendedProductsSuccess(products: recommendProducts));
          }
        },
      );
  }
}
