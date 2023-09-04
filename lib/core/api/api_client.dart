import 'dart:io';

import 'package:birdworld/core/config/app/app_config.dart';
import 'package:birdworld/core/models/login_response.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/storage_services/secure_storage_service.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:stacked_services/stacked_services.dart';

class ApiClient {
  late Interceptor loginInterceptor;

  final AppDialogServices _customDialogService = AppDialogServices();
  final NavigationService _navigationService = GetIt.I.get();
  final Dio _dio = Dio();
  final SecureStorageService _secureStoreService = SecureStorageService();
  late InterceptorsWrapper _errorInterceptorHandler;
  final Dio _tokenDio = Dio();

  late ErrorInterceptorHandler errorInterceptorHandler;

  ApiClient() {
    _dio.options = BaseOptions(
      baseUrl: AppConfig.apibaseurl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 1000 * 40),
      receiveTimeout: const Duration(milliseconds: 1000 * 90),
      sendTimeout: const Duration(milliseconds: 1000 * 90),
    );
    _tokenDio.options = BaseOptions(
      baseUrl: AppConfig.apibaseurl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 1000 * 40),
      receiveTimeout: const Duration(milliseconds: 1000 * 90),
      sendTimeout: const Duration(milliseconds: 1000 * 90),
    );
    _errorInterceptorHandler = InterceptorsWrapper(onError: (e, handler) {
      _handleError(e, handler);
    });
    _dio.interceptors.add(_errorInterceptorHandler);
  }

  Options getOptions(RequestOptions requestOptions, String? token) {
    return Options(
      method: requestOptions.method,
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      extra: requestOptions.extra,
      headers: requestOptions.headers..addAll(_setToken(token)),
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      followRedirects: requestOptions.followRedirects,
      maxRedirects: requestOptions.maxRedirects,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
      listFormat: requestOptions.listFormat,
    );
  }

  T getEntity<T>(_json) {
    var res;

    if (_json is List) {
    } else {
      switch (T) {
        case LoginResponse:
          res = LoginResponse.fromMap(_json);
          break;

        // case :
        //   res = AccountInfo.fromMap(_json);
        //   break;
      }
    }
    return res;
  }

  String getToken(token) {
    return (token ?? '').toString().replaceFirst('Bearer ', '');
  }

  String getAuthToken(token) {
    return 'Bearer $token';
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isTokenNeeded = false,
    bool isCustomHeaders = false,
  }) async {
    try {
      var response = await _dio.get(path,
          queryParameters: queryParameters,
          options: await _defaultOptions(
              options: options, isTokenNeeded, isCustomHeaders),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return _validateResponse(response);
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        e.response;
      }
      //_errorInterceptorHandler.onError(e, errorInterceptorHandler);
      throw e.response!.data['errorMessages']
          [0] /* _handleError<T>(e, _errorInterceptorHandler) */;
    }
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isTokenNeeded = false,
    bool isCustomHeaders = false,
  }) async {
    try {
      var response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(
              options: options, isTokenNeeded, isCustomHeaders),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      print(response);
      return _validateResponse(response);
    } on DioError catch (e) {
      //_errorInterceptorHandler.onError(e, errorInterceptorHandler);
      if (e.response!.statusCode == 400) {
        throw e.response!.data['message'];
      } else {
        throw e.response!.data['errorMessages'][0];
      }
    }
  }

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isTokenNeeded = false,
    bool isCustomHeaders = false,
  }) async {
    try {
      var response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(
              options: options, isTokenNeeded, isCustomHeaders),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return _validateResponse(response);
    } on DioError catch (e) {
      /* _handleError<T>(e, _errorInterceptorHandler) ;*/

      if (e.response!.statusCode == 400) {
        throw e.response!.data['message'];
      } else {
        throw e.response!.data['errorMessages'][0];
      }
    }
  }

  Future<T?> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isTokenNeeded = false,
    bool isCustomHeaders = false,
  }) async {
    try {
      var response = await _dio.delete(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(
              options: options, isTokenNeeded, isCustomHeaders),
          cancelToken: cancelToken);

      return _validateResponse(response);
    } on DioError catch (e) {
      _handleError<T>(e, _errorInterceptorHandler as ErrorInterceptorHandler);
    }
    return null;
  }

  Future<T?> _handleError<T>(
      DioError error, ErrorInterceptorHandler errorInterceptorHandler) async {
    String errorDescription = "";
    //if (error.) {
    switch (error.type) {
      case DioErrorType.cancel:
        throw _customDialogService.showSnackBar("Request Cancel");

        //errorDescription = ErrorMessages.REQUEST_TO_SERVER_WAS_CANCELLED;
        break;
      case DioErrorType.connectionTimeout:
        throw _customDialogService.showSnackBar("Connection Timeout");

        //errorDescription = ErrorMessages.CONNECTION_TIMEOUT_SERVER;
        break;
      case DioErrorType.connectionError:
        if (error.error is SocketException) {
          errorInterceptorHandler.reject(error);
          throw _customDialogService
              .showSnackBar("Please check your network connection");
        }
        errorInterceptorHandler.reject(error);

        throw _customDialogService.showSnackBar(error.message.toString());
        //errorDescription = ErrorMessages.CONNECTIVITY_ISSUE_TRY_AGAIN;
        break;
      case DioErrorType.sendTimeout:
        errorInterceptorHandler.reject(error);
        throw _customDialogService.showSnackBar("Send Timeout");
        // errorDescription = ErrorMessages.SEND_TIMEOUT_SERVER;
        break;
      case DioErrorType.receiveTimeout:
        errorInterceptorHandler.reject(error);
        throw _customDialogService.showSnackBar("Receive Timeout");

        //errorDescription = ErrorMessages.RECEIVE_TIMEOUT_SERVER;
        break;
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            errorInterceptorHandler.reject(error);

            //errorInterceptorHandler.next(error);
            // throw error.response!.data['message'];
            throw _customDialogService
                .showSnackBar(error.response!.data['message']);

          case 401:
            // await retryRequest(error, errorInterceptorHandler);
            break;
          case 470:
            // await unsupportedDevice(error, errorInterceptorHandler);
            break;

          case 403:
            try {
              errorInterceptorHandler.reject(error);
              throw _customDialogService
                  .showSnackBar("403:Something went Wrong");
            } catch (e) {
              //errorDescription = ErrorMessages.SOMETHING_WENT_WRONG;
            }
            break;

          case 500:
            try {
              errorInterceptorHandler.reject(error);
              throw _customDialogService.message("500: Internal Server Error");
            } catch (e) {
              e.toString();
            }

            break;
          default:
            errorInterceptorHandler.reject(error);
            throw _customDialogService.showSnackBar("Something went Wrong",
                style: const TextStyle(color: Colors.white));
        }
        break;
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.badResponse:
        // TODO: Handle this case.
        break;
      case DioErrorType.unknown:
        // TODO: Handle this case.
        break;
    }
    /* }  else {
      //errorDescription = ErrorMessages.UNEXPECTED_ERROR_OCCURRED;
    } */

    // return (Map<String,dynamic>={
    //   "status": false,
    //   "error": [errorDescription],
    // });
    return null;
  }

  Map<String, dynamic> _setToken(token, [Map<String, dynamic>? headers]) {
    if (headers != null) {
      headers.putIfAbsent('authorization', () => getAuthToken(token));
      return headers;
    } else {
      return {'authorization': getAuthToken(token)};
    }
  }

  Future<Options> _defaultOptions(bool isTokenNeeded, bool isCustomHeaders,
      {Options? options}) async {
    if (isTokenNeeded && isCustomHeaders) {
      String? token = await _secureStoreService.getToken;
      Map<String, dynamic> newHeaders = {
        ...options!.headers!,
        "Authorization": "Bearer $token",
      };
      return Options(
        headers: newHeaders,
      );
    } else if (isTokenNeeded) {
      String? token = await _secureStoreService.getToken;
      return Options(
        headers: {
          // ...options.headers!,
          "Authorization": "Bearer $token",
        },
      );
    } else if (isCustomHeaders) {
      return Options(
        headers: options?.headers,
      );
    } else {
      return Options(headers: options?.headers);
    }
  }

  Future<T> _validateResponse<T>(Response<dynamic> response) async {
    try {
      /* if (response.data["status"] == -1) {
        //return DialogMessage(message: message);
        throw DioError(
            requestOptions: response.requestOptions,
            response: response,
            type: DioErrorType.other,
            error: true);
      } else { */
      // if (T == LoginResponse) {
      //   Map<String, dynamic> newResponse = {
      //     ...response.data,
      //     'token':
      //         response.data['token'] ?? response.headers.value('Authorization'),
      //     'refreshToken': response.data['refreshToken'] ??
      //         response.headers.value('Auth-Refresh'),
      //     'xVersionStatus': response.data['xVersionStatus'] ??
      //         response.headers.value('X-Version-Status'),
      //   };

      //   return getEntity<T>(newResponse);
      // }
      return getEntity<T>(response.data);
      /* } */
    } on Exception catch (e) {
      print(e);
      return response.data;
    }
  }
}
