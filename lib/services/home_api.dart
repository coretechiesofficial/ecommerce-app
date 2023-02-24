//MARK: Package
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/dio_results.dart';
import '../models/user_model.dart';
import '../utils/commons.dart';

//Home API
class HomeApi {
  static Future<DioResult?> product({
    
    // required String apiToken,
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
          response = await dio.post('${baseUrl}product',
              data: formData,
              options: Options(
                  sendTimeout: 5000,
                  receiveTimeout: 3000,
                  // headers: {"Authorization": "Bearer $token"}
                  ));
          dynamic responseData;
          if (response.statusCode == 200 ) {
            responseData = response.data['products'];
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }
}
