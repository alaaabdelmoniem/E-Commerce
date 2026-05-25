import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  final AuthRepo authRepo;
  LogOutCubit({required this.authRepo}) : super(LogOutInitial());
  Future<void> logOut() async {
    emit(LogOutLoading());
    var result = await authRepo.logOut()
      ..fold(
        (failure) {
          emit(LogOutFailure(errorMessage: failure.errorMessage));
        },
        (success) {
          emit(LogOutSuccess(message: success));
        },
      );
  }
}
