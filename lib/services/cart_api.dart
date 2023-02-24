import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/dio_results.dart';
import '../utils/commons.dart';

class CartApi {
  //VIEW CART API
  static Future<DioResult?> cartView({
    required String apiToken,
    required BuildContext context,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            // "api_token": apiToken,
          });
          response =
              await dio.post('${baseUrl}cart/products&api_token=${apiToken}',
                  data: formData,
                  options: Options(
                    sendTimeout: 5000,
                    receiveTimeout: 3000,
                    // headers: {"Authorization": "Bearer $token"}
                  ));
          dynamic responseData;
          if (response.statusCode == 200
              // &&
              // !response.data['error']['warning'].contains('Warning')
              ) {
            responseData = response.data;
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }

//ADD TO CART API
  static Future<DioResult?> addCart({
    required String apiToken,
    required String route,
    required BuildContext context,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            "route": route,
            "api_token": apiToken,
          });
          response = await dio.post('${baseUrl}cart/add',
              data: formData,
              options: Options(
                sendTimeout: 5000,
                receiveTimeout: 3000,
                // headers: {"Authorization": "Bearer $token"}
              ));
          dynamic responseData;
          if (response.statusCode == 200 &&
              response.data['success'].contains('Success')) {
            responseData = response.data['success'];
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }
}
