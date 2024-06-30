
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioUtils {
  final Dio _dio;
  static DioUtils? _instance;
  get options =>   CacheOptions(
    store: MemCacheStore(),
    maxStale: const Duration(days: 2),
    priority: CachePriority.normal,
    allowPostMethod: false,
  );

  DioUtils._(this._dio);

  static DioUtils getInstance() {
    if (_instance == null) {
      CacheOptions options =   CacheOptions(
        store: MemCacheStore(),
        maxStale: const Duration(days: 2),
        priority: CachePriority.normal,
        allowPostMethod: false,
      );
      Dio dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));
      _instance = DioUtils._(dio);
    }
    return _instance!;
  }



  makePostRequest(
    String endPoint,
    dynamic postValues,
      {
    Map<String, dynamic>? headers,
    bool withToken = true,
    // Map? query,
  }) async {
    FormData ?formData;
    if(postValues.runtimeType != String && postValues.entries.isNotEmpty) {
       formData = FormData.fromMap(postValues);
    }

    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      _dio.options.headers["Content-Type"] = "application/json";
      _dio.options.headers["X-Requested-With"] = "XMLHttpRequest";
   //   _dio.options.headers["Content-Language"] = getLanguage();
      if (withToken == true) {
       // _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      }
      if (headers != null) _dio.options.headers.addAll(headers);
      debugPrint('MakePostRequest url is #$endPoint');
      debugPrint('MakePostRequest body are #${postValues.toString()}');
      debugPrint('MakeGetRequest query is #${_dio.options.headers}');
      response =
          await _dio.post(endPoint, data: formData ,);
      debugPrint('MakePostRequest done');
      debugPrint('MakePostRequest ${response.statusCode}');
      return response;
    } on DioError catch (e) {
      return e.response??'ttt';
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  makeGetRequest(
    String endPoint, {
    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? query,
  }) async {
    Response response;
    try {
     _dio.options.headers["Accept"] = "application/json";
     // _dio.options.headers["Content-Language"] = getLanguage();
      if (headers != null) {
        headers.forEach((key, value) {
          _dio.options.headers[key] = value.toString();
        });
      }
      if (withToken == true) {
      //  _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";

      }
      debugPrint('MakeGetRequest url is #$endPoint');
      debugPrint('MakeGetRequest query is #$query');
      // debugPrint('MakeGetRequest token is #${getUserToken()}');
      response = await _dio.get(
        endPoint,
        queryParameters: query,
      );
      debugPrint('MakeGetRequest done');
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return e.response!;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  makeDeleteRequest(
    String endPoint, {
    Map<String, dynamic>? headers,
    bool withToken = true,
    Map<String, dynamic>? query,
  }) async {
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      if (withToken == true) {
      //  _dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      }
      debugPrint('MakeDeleteRequest url is #$endPoint');
      debugPrint('MakeDeleteRequest headers are #${_dio.options.headers}');
      response = await _dio.delete(endPoint, queryParameters: query);
      debugPrint('MakeDeleteRequest done');
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return e.response!;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  downloadRequest({required String url, required String savePath}) async {
    Response response;
    try {
      _dio.options.headers["Accept"] = "application/json";
      //_dio.options.headers["Authorization"] = "Bearer ${getUserToken()}";
      debugPrint('MakeDownloadRequest url is #$url');
      response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            debugPrint("${(count / total * 100).toStringAsFixed(0)}%");
          }
        },
      );
      debugPrint('MakeDownloadRequest done');
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return e.response!;
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }


  //
  //  makeMultipartRequest(  Map<String, dynamic>? query, {File? imageFile}) async{
  //   try {
  //     var multipartFile;
  //     var stream;
  //     var length;
  //
  //     var request = http.MultipartRequest(
  //         "POST", Constants.REGISTER);
  //     request.fields['name'] = name;
  //     request.fields['phone'] = phone;
  //     request.fields['password'] = password;
  //     request.fields['country_id'] = country.toString();
  //     request.fields['city_id'] = city.toString();
  //     request.fields['parent_id'] = parentId??"";
  //     request.headers['php-auth-user'] = 'a7san1';
  //     request.headers['php-auth-pw'] = 'a7san1JvjoE20BestOne#b9y2*4WjDINg!x!OGb';
  //     if (imageFile != null) {
  //       stream =
  //       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //       length = await imageFile.length();
  //       multipartFile = new http.MultipartFile('image', stream, length,
  //           filename: basename(imageFile.path));
  //       request.files.add(multipartFile);
  //     }
  //
  //     var response = await request.send();
  //     final res = await http.Response.fromStream(response);
  //     var data = json.decode(res.body);
  //     // debugPrint(res.body);
  //     // debugPrint(res.statusCode.toString());
  //     // debugPrint("kkkkkkkkkkkkkkk");
  //     if (res.statusCode == 200)
  //       return res.body;
  //     else if(res.statusCode == 422) {
  //       return 'validation error';
  //     }
  //   }
  //   catch (e){
  //     debugPrint(e.toString());
  //     return throw false;
  //   }
  // }
}
