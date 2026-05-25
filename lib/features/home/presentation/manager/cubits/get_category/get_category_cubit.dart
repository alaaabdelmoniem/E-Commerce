import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/product_model/category.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit({required this.homeRepo}) : super(GetCategoryInitial());
  final HomeRepo homeRepo;
  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    var categories = await homeRepo.getCategories();
    categories.fold(
      (failure) {
        emit(GetCategoryFailure(errorMessage: failure.errorMessage));
      },
      (categores) {
        if (!isClosed) {
          emit(GetCategorySuccess(categories: categores));
        }
      },
    );
  }
}
