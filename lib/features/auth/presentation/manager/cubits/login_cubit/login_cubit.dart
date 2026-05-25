import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> loginUser({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.login(email: username, password: password);

    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(LoginSuccess());
      },
    );
  }
}
