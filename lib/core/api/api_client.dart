// import 'dart:io';

// import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
// import 'package:birdworld/core/service/local_storage_services/secure_storage_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';

// import 'package:logger/logger.dart';
// import 'package:stacked_services/stacked_services.dart';

// class ApiClient {
//   final String appapiBaseurl = "";

//   ApiClient() {
//     _dio.options = BaseOptions(
//       baseUrl: appapiBaseurl,
//       responseType: ResponseType.json,
//       connectTimeout: const Duration(milliseconds: 1000 * 40),
//       receiveTimeout: const Duration(milliseconds: 1000 * 90),
//       sendTimeout: const Duration(milliseconds: 1000 * 90),
//     );
//     _tokenDio.options = BaseOptions(
//       baseUrl: appapiBaseurl,
//       responseType: ResponseType.json,
//       connectTimeout: const Duration(milliseconds: 1000 * 40),
//       receiveTimeout: const Duration(milliseconds: 1000 * 90),
//       sendTimeout: const Duration(milliseconds: 1000 * 90),
//     );
//     _errorInterceptorHandler = InterceptorsWrapper(onError: (e, handler) {
//       _handleError(e, handler);
//     });
//     _dio.interceptors.add(_errorInterceptorHandler);
//     // _setupAuthInterceptor();
//     _setupLoggingInterceptor();
//     _secureStoreService = SecureStorageService();

//     //errorInterceptorHandler = ErrorInterceptorHandler();
//   }

//   static const String TAG = 'ApiClient';

//   late Interceptor loginInterceptor;

//   final AppDialogServices _customDialogService = AppDialogServices();
//   final NavigationService _navigationService = GetIt.I.get();
//   final Dio _dio = Dio();
//   late InterceptorsWrapper _errorInterceptorHandler;
//   late SecureStorageService _secureStoreService;
//   final Dio _tokenDio = Dio();

//   //late ErrorInterceptorHandler errorInterceptorHandler;

//   Options getOptions(RequestOptions requestOptions, String? token) {
//     return Options(
//       method: requestOptions.method,
//       sendTimeout: requestOptions.sendTimeout,
//       receiveTimeout: requestOptions.receiveTimeout,
//       extra: requestOptions.extra,
//       headers: requestOptions.headers..addAll(_setToken(token)),
//       responseType: requestOptions.responseType,
//       contentType: requestOptions.contentType,
//       validateStatus: requestOptions.validateStatus,
//       receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
//       followRedirects: requestOptions.followRedirects,
//       maxRedirects: requestOptions.maxRedirects,
//       requestEncoder: requestOptions.requestEncoder,
//       responseDecoder: requestOptions.responseDecoder,
//       listFormat: requestOptions.listFormat,
//     );
//   }

//   String getToken(token) {
//     return (token ?? '').toString().replaceFirst('Bearer ', '');
//   }

//   String getAuthToken(token) {
//     return 'Bearer $token';
//   }

//   Future<T> get<T>(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     bool? isTokenNeeded,
//     bool? isCustomHeaders,
//   }) async {
//     try {
//       var response = await _dio.get(path,
//           queryParameters: queryParameters,
//           options: await _defaultOptions(
//               options: options, isTokenNeeded!, isCustomHeaders!),
//           cancelToken: cancelToken,
//           onReceiveProgress: onReceiveProgress);
//       return _validateResponse(response);
//     } on DioError catch (e) {
//       if (e.response!.statusCode == 400) {
//         e.response;
//       }
//       //_errorInterceptorHandler.onError(e, errorInterceptorHandler);
//       throw e.response!.data['errorMessages']
//           [0] /* _handleError<T>(e, _errorInterceptorHandler) */;
//     }
//   }

//   Future<T> post<T>(
//     String path, {
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     bool? isTokenNeeded,
//     bool? isCustomHeaders,
//   }) async {
//     try {
//       var response = await _dio.post(path,
//           data: data,
//           queryParameters: queryParameters,
//           options: await _defaultOptions(
//               options: options, isTokenNeeded!, isCustomHeaders!),
//           cancelToken: cancelToken,
//           onReceiveProgress: onReceiveProgress);
//       return _validateResponse(response);
//     } on DioError catch (e) {
//       //_errorInterceptorHandler.onError(e, errorInterceptorHandler);
//       if (e.response!.statusCode == 400) {
//         throw e.response!.data['message'];
//       } else {
//         throw e.response!.data['errorMessages'][0];
//       }
//     }
//   }

//   Future<T> put<T>(
//     String path, {
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     bool? isTokenNeeded,
//     bool? isCustomHeaders,
//   }) async {
//     try {
//       var response = await _dio.put(path,
//           data: data,
//           queryParameters: queryParameters,
//           options: await _defaultOptions(
//               options: options, isTokenNeeded!, isCustomHeaders!),
//           cancelToken: cancelToken,
//           onReceiveProgress: onReceiveProgress);

//       return _validateResponse(response);
//     } on DioError catch (e) {
//       /* _handleError<T>(e, _errorInterceptorHandler) ;*/

//       if (e.response!.statusCode == 400) {
//         throw e.response!.data['message'];
//       } else {
//         throw e.response!.data['errorMessages'][0];
//       }
//     }
//   }

//   Future<T> delete<T>(String path,
//       {Map<String, dynamic>? data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       CancelToken? cancelToken,
//       bool? isTokenNeeded,
//       bool? isCustomHeaders}) async {
//     try {
//       var response = await _dio.delete(path,
//           data: data,
//           queryParameters: queryParameters,
//           options: await _defaultOptions(
//               options: options, isTokenNeeded!, isCustomHeaders!),
//           cancelToken: cancelToken);

//       return _validateResponse(response);
//     } on DioError catch (e) {
//       _handleError<T>(e, _errorInterceptorHandler as ErrorInterceptorHandler);
//     }
//   }

//   /// To get entity for json arrays you need to give the entity type as a String.
//   ///
//   /// ex: T.toString() == 'List<Product>?'
//   // T getEntity<T>(_json) {
//   //   var res;

//   //   if (_json is List) {
//   //   } else {
//   //     switch (T) {
//   //       case LoginResponse:
//   //         /*  SecureStoreService(const FlutterSecureStorage())
//   //             .setLoginDetails(LoginResponse.fromJson(_json)); */
//   //         res = LoginResponse.fromJson(_json);
//   //         break;

//   //       case AccountInfo:
//   //         res = AccountInfo.fromMap(_json);
//   //         break;

//   //       case ProfileImage:
//   //         res = ProfileImage.fromJson(_json);
//   //         break;
//   //       case FacilityResponseModel:
//   //         res = FacilityResponseModel.fromMap(_json);
//   //         break;
//   //       case PaymentInstruments:
//   //         res = PaymentInstruments.fromJson(_json);
//   //         break;
//   //       case bool:
//   //         res = true;
//   //         break;

//   //       case BankList:
//   //         res = BankList.fromMap(_json);
//   //         break;

//   //       case SavedPayeeModel:
//   //         res = SavedPayeeModel.fromMap(_json);
//   //         break;

//   //       case SavingsAccountList:
//   //         res = SavingsAccountList.fromJson(_json);
//   //         break;

//   //       case ChargeAmountModel:
//   //         res = ChargeAmountModel.fromMap(_json);
//   //         break;

//   //       case ValidateAccount:
//   //         res = ValidateAccount.fromMap(_json);
//   //         break;

//   //       case MostPayees:
//   //         res = MostPayees.fromMap(_json);
//   //         break;

//   //       case TransactionResponse:
//   //         res = TransactionResponse.fromMap(_json);
//   //         break;

//   //       case BranchesResponse:
//   //         res = BranchesResponse.fromMap(_json);
//   //         break;
//   //     }
//   //   }
//   //   return res;
//   // }

//   retryRequest(
//       DioError error, ErrorInterceptorHandler errorInterceptorHandler) async {
//     try {
//       final refreshToken =
//           await _secureStoreService.getToken(accessToken: false);

//       debugPrint("refreshToken == ${refreshToken.toString()}");
//       String? userAgent = await ApiProvider.setUserAgent();
//       /* final refreshTokenResponse = */ await _dio
//           .post("/jwt/auth/refresh",
//               options: await _defaultOptions(
//                   options: Options(headers: {
//                     "User-Agent": userAgent,
//                     "Authorization": "Bearer $refreshToken"
//                   }),
//                   false,
//                   false))
//           .then((refreshTokenResponse) async {
//         //TODO:HERE NEEDS TO CHECK REFRESh TOKEN SUCESS STATUS CODE
//         if (refreshTokenResponse.statusCode == 200) {
//           if (refreshTokenResponse.data['status'] == -1) {
//             debugPrint("error in refresh token");
//             errorInterceptorHandler.reject(error);

//             _navigationService.replaceWith(Routes.pinView);
//             throw error.response!.data['errorMessages'][0];
//           }
//           _secureStoreService.setToken(
//             refreshTokenResponse.headers.value('authorization').toString(),
//           );
//           //TODO: in here ask them should we needs to save the token in the internal storage as an object

//           final previousResponse = await _dio.request(error.requestOptions.path,
//               data: error.requestOptions.data,
//               options: await _defaultOptions(
//                   options:
//                       Options(method: error.requestOptions.method, headers: {
//                     "Content-Type": "application/json",
//                     "User-Agent": error.requestOptions.headers['User-Agent'],
//                     "Authorization":
//                         "Bearer ${refreshTokenResponse.headers.value('authorization')}"
//                   }),
//                   false,
//                   false));

//           return errorInterceptorHandler.resolve(previousResponse);
//         }
//       }, onError: (v) {
//         errorInterceptorHandler.reject(error);
//         throw _customDialogService
//             .showSnackBar(error.response!.data['errorMessages'][0]);
//       });
//     } on DioError catch (e) {
//       debugPrint(e.toString());
//       throw _customDialogService
//           .showSnackBar(error.response!.data['errorMessages'][0]);
//       //TODO:IN HERE NEEDS TO EXIT USER FROM APPLICATION & ASK TO LOGIN WITH CREDENTIALS
//     }
//   }

//   unsupportedDevice(
//       DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
//     return errorInterceptorHandler.resolve(Response(
//         statusCode: 200,
//         requestOptions: RequestOptions(path: 'sdd'),
//         data: {
//           'status': 1,
//           'errorMessages': [],
//           'body': null,
//           'token': 'token',
//           'refreshToken': '',
//           'xVersionStatus': 'unsupported',
//         }));
//   }

//   void _setupLoggingInterceptor() {
//     var loginInterceptor = LogInterceptor(
//       responseBody: true,
//       requestBody: true,
//       logPrint: (val) => print(TAG),
//     );

//     _dio.interceptors.add(loginInterceptor);
//     _tokenDio.interceptors.add(loginInterceptor);
//   }

//   Future<T> _handleError<T>(
//       DioError error, ErrorInterceptorHandler errorInterceptorHandler) async {
//     String errorDescription = "";
//     //if (error.) {
//     switch (error.type) {
//       case DioErrorType.cancel:
//         throw _customDialogService.showSnackBar("Request Cancel");

//         //errorDescription = ErrorMessages.REQUEST_TO_SERVER_WAS_CANCELLED;
//         break;
//       case DioErrorType.connectionTimeout:
//         throw _customDialogService.showSnackBar("Connection Timeout");

//         //errorDescription = ErrorMessages.CONNECTION_TIMEOUT_SERVER;
//         break;
//       case DioErrorType.connectionError:
//         if (error.error is SocketException) {
//           errorInterceptorHandler.reject(error);
//           throw _customDialogService
//               .showSnackBar("Please check your network connection");
//         }
//         errorInterceptorHandler.reject(error);

//         throw _customDialogService.showSnackBar(error.message.toString());
//         //errorDescription = ErrorMessages.CONNECTIVITY_ISSUE_TRY_AGAIN;
//         break;
//       case DioErrorType.sendTimeout:
//         errorInterceptorHandler.reject(error);
//         throw _customDialogService.showSnackBar("Send Timeout");
//         // errorDescription = ErrorMessages.SEND_TIMEOUT_SERVER;
//         break;
//       case DioErrorType.receiveTimeout:
//         errorInterceptorHandler.reject(error);
//         throw _customDialogService.showSnackBar("Receive Timeout");

//         //errorDescription = ErrorMessages.RECEIVE_TIMEOUT_SERVER;
//         break;
//       case DioErrorType.badResponse:
//         switch (error.response?.statusCode) {
//           case 400:
//             errorInterceptorHandler.reject(error);

//             //errorInterceptorHandler.next(error);
//             // throw error.response!.data['message'];
//             throw _customDialogService
//                 .showSnackBar(error.response!.data['message']);

//           case 401:
//             await retryRequest(error, errorInterceptorHandler);
//             break;
//           case 470:
//             await unsupportedDevice(error, errorInterceptorHandler);
//             break;

//           case 403:
//             try {
//               errorInterceptorHandler.reject(error);
//               throw _customDialogService
//                   .showSnackBar("403:Something went Wrong");
//             } catch (e) {
//               //errorDescription = ErrorMessages.SOMETHING_WENT_WRONG;
//             }
//             break;

//           case 500:
//             try {
//               errorInterceptorHandler.reject(error);
//               throw _customDialogService.message("500: Internal Server Error");
//             } catch (e) {
//               e.toString();
//             }

//             break;
//           default:
//             errorInterceptorHandler.reject(error);
//             throw _customDialogService.showSnackBar("Something went Wrong",
//                 style: const TextStyle(color: Colors.white));
//         }
//         break;
//       case DioErrorType.badCertificate:
//         // TODO: Handle this case.
//         break;
//       case DioErrorType.badResponse:
//         // TODO: Handle this case.
//         break;
//       case DioErrorType.unknown:
//         // TODO: Handle this case.
//         break;
//     }
//     /* }  else {
//       //errorDescription = ErrorMessages.UNEXPECTED_ERROR_OCCURRED;
//     } */

//     return getEntity<T>({
//       "status": false,
//       "error": [errorDescription],
//     });
//   }

//   Map<String, dynamic> _setToken(token, [Map<String, dynamic>? headers]) {
//     if (headers != null) {
//       headers.putIfAbsent('authorization', () => getAuthToken(token));
//       return headers;
//     } else {
//       return {'authorization': getAuthToken(token)};
//     }
//   }

//   Future<Options> _defaultOptions(bool isTokenNeeded, bool isCustomHeaders,
//       {Options? options}) async {
//     // TODO implement when login api provided

//     //FIXME : HERE GETIING THE SAVED VALUE
//     if (isTokenNeeded && isCustomHeaders) {
//       String? token = await _secureStoreService.getToken;
//       Map<String, dynamic> newHeaders = {
//         ...options!.headers!,
//         "Authorization": "Bearer $token",
//       };
//       return Options(
//         headers: newHeaders,
//       );
//     } else if (isTokenNeeded) {
//       String? token = await _secureStoreService.getToken;
//       return Options(
//         headers: {
//           ...options!.headers!,
//           "Authorization": "Bearer $token",
//         },
//       );
//     } else if (isCustomHeaders) {
//       return Options(
//         headers: options?.headers,
//       );
//     } else {
//       return Options(headers: options?.headers);
//     }
//   }

//   Future<T> _validateResponse<T>(Response<dynamic> response) async {
//     try {
//       /* if (response.data["status"] == -1) {
//         //return DialogMessage(message: message);
//         throw DioError(
//             requestOptions: response.requestOptions,
//             response: response,
//             type: DioErrorType.other,
//             error: true);
//       } else { */
//       if (T == LoginResponse) {
//         // re-build the response with both response header and response body
//         Map<String, dynamic> newResponse = {
//           ...response.data,
//           'token':
//               response.data['token'] ?? response.headers.value('Authorization'),
//           'refreshToken': response.data['refreshToken'] ??
//               response.headers.value('Auth-Refresh'),
//           'xVersionStatus': response.data['xVersionStatus'] ??
//               response.headers.value('X-Version-Status'),
//         };

//         return getEntity<T>(newResponse);
//       }
//       return getEntity<T>(response.data);
//       /* } */
//     } on Exception catch (e) {
//       Logger().e(e);
//       return response
//           .data; /* _handleError<T>(e as DioError /* , _errorInterceptorHandler */); */
//     }
//   }
// }
