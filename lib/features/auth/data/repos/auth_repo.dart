import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failures, String>> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  });
    Future<Either<Failures, String>> logOut();
}
