import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());
  final AuthRepo authRepo;
  Future<void> registerUser({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    emit(RegisterLoading());
    var result = await authRepo.register(
      username: username,
      password: password,
      email: email,
      phone: phone,
    );

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(RegisterSuccess(message: success));
      },
    );
  }
}
