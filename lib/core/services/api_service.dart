import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/cache_keys.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/end_points.dart';

abstract class ApiService {
  static final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request [${options.method}] => ${options.path}');
          print('Headers: ${options.headers}');
          print('Data : ${options.data}');
          if (options.data is FormData) {
            FormData formData = options.data as FormData;
            print('Form Data : ${formData.fields}');
            print('Fiels : ${formData.files}');
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          print(
            'Error [${error.response?.statusCode}] => Path ${error.requestOptions.path}',
          );
          print('Data : ${error.response?.data}');

          String? errMessage;
          if (error.response?.data is Map<String, dynamic>) {
            errMessage =
                (error.response?.data as Map<String, dynamic>)['message'];
          }
          if (errMessage?.contains('Token has expired') == true) {
            try {
              var response = await dio.post(
                EndPoints.refreshToken,
                options: Options(
                  headers: {
                    'Authorization':
                        'Bearer ${CacheHelper.getValue(key: CacheKeys.refreashToken)}',
                  },
                ),
              );

              await CacheHelper.setValue(
                key: CacheKeys.accessToken,
                value: response.data['access_token'],
              );
              final oldOptions = error.requestOptions;
              oldOptions.headers['Authorization'] =
                  'Bearer ${response.data['access_token']}';

              if (oldOptions.data is FormData) {
                final oldFormData = oldOptions.data as FormData;
                Map<String, dynamic> formMap = {};
                for (var entry in oldFormData.fields) {
                  formMap[entry.key] = entry.value;
                }
                for (var file in oldFormData.files) {
                  formMap[file.key] = file.value;
                }

                oldOptions.data = FormData.fromMap(formMap);
              }
              final newResponse = await dio.fetch(oldOptions);
              return handler.resolve(newResponse);
            } catch (e) {
              print('E is ${e.toString()}');
          
            }
          }
          return handler.next(error);
        },
      ),
    );
  static Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = true,
  }) async {
    var response = await dio.get(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isProtected = false,
    bool isFormData = true,
  }) async {
    String? accessToken;
    var response = await dio.post(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer $accessToken',
          ...?headers, // = headers != null ? addAll(headers) : do nothing
        },
      ),
      queryParameters: queryParameters,
    );
    return response.data as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isProtected = false,
    bool isFormData = true,
  }) async {
    var response = await dio.put(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isProtected = false,
    bool isFormData = true,
  }) async {
    var response = await dio.delete(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response .data;
  }
}
