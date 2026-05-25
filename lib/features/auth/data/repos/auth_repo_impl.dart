import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/services/end_points.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';

class AuthRepoImple implements AuthRepo {
  @override
  Future<Either<Failures, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await ApiService.post(
        endPoint: EndPoints.login,
        data: {'email': email, 'password': password},
      );
      var token = data['access_token'];
      var refrshToken = data['refresh_token'];
      await CacheHelper.setValue(key: CacheKeys.accessToken, value: token);
      await CacheHelper.setValue(key: CacheKeys.refreashToken, value: refrshToken);


      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, String>> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      var data = await ApiService.post(
        endPoint: EndPoints.register,
        data: {
          'name': username,
          'password': password,
          'email': email,
          'phone': phone,
        },
      );
      var successResponse = data['message'];
      return Right(successResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failures, String>> logOut()async {
      try {
      var data = await ApiService.delete(
        endPoint: EndPoints.deleteUser,
      );
      var successResponse = data['message'];
      return Right(successResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      } else {
        return Left(ServerFailures(errorMessage: e.toString()));
      }
    }
  }
}
