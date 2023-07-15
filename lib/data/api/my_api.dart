import 'dart:developer';
// import 'dart:io';
// import 'dart:math' hide log;
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../presentation/components/alerts.dart';
import '../../presentation/components/my_loading.dart';

String baseUrl = "http://www.tawjihiquiz.com/api/";

class DioHelper {
  static Dio mydio = Dio();
  DioHelper() {
    mydio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        baseUrl: '',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String? base,
    bool loading = false,
    bool isForm = false,
    bool isFile = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': isFile ? "multipart/form-data" : 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      // 'Accept-Language': Utils.lang,
    };
    if (token == null) {
      mydio.options.headers = {
        'Content-Type': isFile ? "multipart/form-data" : 'application/json',
        'Accept': 'application/json',
        // 'Accept-Language': Utils.lang,
      };
    }
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await mydio.post(
        (base ?? baseUrl) + url,
        queryParameters: query,
        data: isForm ? FormData.fromMap(body ?? {}) : body,
      );

      if (loading) {
        MyLoading.dismis();
      }
      // OverLays.snack(text: response.data["message"], state: SnakState.success);
      return response;
    } on DioError catch (e) {
      getDioError(
        e: e,
      );
      return e.response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String? base,
    bool loading = false,
    bool isForm = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (token == null) {
      mydio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await mydio.put((base ?? baseUrl) + url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis();
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e);
      return e.response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? base,
    bool loading = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      if (loading) {
        MyLoading.show();
      }
      final response =
          await mydio.delete((base ?? baseUrl) + url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e);
      return e.response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? base,
    // required BuildContext? context,
    bool loading = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      //'Accept-Language': Utiles.lang,
    };
    if (token == null) {
      mydio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Accept-Language': Utiles.lang,
      };
    }

    try {
      if (loading) {
        MyLoading.show();
      }
      final response =
          await mydio.get(((base ?? baseUrl)) + url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e);
      return e.response;
    } catch (e) {
      return null;
    }
  }

  // Future<Response?> downloadData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   String? token,
  //   String? base,
  //   String? savePath,
  //   // required BuildContext? context,
  //   bool loading = false,
  // }) async {
  //   mydio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //     //'Accept-Language': context?.locale == Locale('en', 'US') ? 'en' : 'ar',
  //   };
  //   if (token == null) {
  //     mydio.options.headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       // 'Accept-Language': context?.locale == Locale('en', 'US') ? 'en' : 'ar',
  //     };
  //   }
  //   try {
  //     if (loading) {
  //       MyLoading.show();
  //     }
  //     String progress = '0';

  //     var x = Random().nextInt(50);

  //     var tempDir = await getTemporaryDirectory();

  //     String fullPath = tempDir.path + "/${x}.pdf";

  //     final response = await mydio.get(
  //       url,
  //       onReceiveProgress: (rcv, total) async {
  //         progress = ((rcv / total) * 100).toStringAsFixed(0);

  //         if (progress == '100') {
  //           MyLoading.dismis();
  //           File file = File(fullPath);
  //           var raf = file.openSync(mode: FileMode.write);

  //           await raf.close();
  //         } else if (double.parse(progress) < 100) {}
  //       },
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }),
  //     );
  //     var file = File(fullPath).openSync(mode: FileMode.write);
  //     file.writeFromSync(response.data);
  //     await file.close();
  //     return response;
  //   } on DioError catch (e) {
  //     getDioError(
  //       e: e,
  //     );
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // void showDownloadProgress(received, total) {
  //   if (total != -1) {}
  // }

  static getDioError({
    required DioError e,
  }) {
    log("---------------autherrr");
    MyLoading.dismis();

    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectionTimeout == e.type) {
      OverLays.toast(
        text: 'Connetion timeout'.tr(),
      );
      log('case 1');
      log('Server is not reachable. Please verify your internet connection and try again');
    } else if (DioErrorType.badResponse == e.type) {
      log('case 2');
      log('Server reachable. Error in resposne');
      OverLays.toast(
        text: e.response?.data.toString() ?? "لا يمكن الوصول للسيرفير".tr(),
      );
    } else if (DioErrorType.connectionError == e.type) {
      log('Network error');
      log('case 3');
      OverLays.toast(
        text: 'No Network'.tr(),
      );
    } else if (DioErrorType.unknown == e.type) {
      if (e.error.toString().contains("SocketException")) {
        log('Network error');
        log('case 4');
        OverLays.toast(
            text: 'حدث مشكلة تأكد انك متصل بالانترنت ثم أعد المحاولة');
      }
      if (e.message.toString().contains('SocketException')) {
        log('Network error');
        log('case 5');
        OverLays.toast(
          text: 'حدث مشكلة تأكد انك متصل بالانترنت ثم أعد المحاولة',
        );
      }
    } else {
      // show snak server error
      log('case 6');
      log('Problem connecting to the server. Please try again.');
      OverLays.toast(
        text: 'Problem connecting to the server. Please try again.'.tr(),
      );
    }
    return null;
  }
}
