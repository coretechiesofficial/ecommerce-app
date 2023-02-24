//MARK: Package
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/dio_results.dart';
import '../utils/commons.dart';

//Login API
class OnBoardingApi {
  static Future<DioResult?> login({
    required String username,
    required String key,
    required BuildContext context,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            "username": username,
            "key": key,
          });
          response = await dio.post('${baseUrl}login',
              data: formData,
              options: Options(
                sendTimeout: 5000,
                receiveTimeout: 3000,
              ));
          dynamic responseData;
          if (response.statusCode == 200 &&
              response.data['success'].contains('Success')) {
            responseData = response.data;
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }

  //Forgot Password API
  static Future<DioResult?> forgotPassword({
    required String username,
    required String countrycode,
    required BuildContext context,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            "mobile_number": username,
            "country_code": countrycode,
          });
          response = await dio.post('${baseUrl}forgotPassword',
              data: formData,
              options: Options(
                sendTimeout: 5000,
                receiveTimeout: 3000,
              ));
          dynamic responseData;
          if (response.statusCode == 200 && response.data['status'] == true) {
            responseData = response.data;
            // print(responseData);
            //Save userdata locally
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }

  //Logout API
  static Future<DioResult?> logOut({
    required String userId,
    required String token,
    required BuildContext context,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            "user_id": userId,
          });
          response =
              await dio.post('https://fluffnfold.co.nz/fnf-api/api/logout',
                  data: formData,
                  options: Options(
                    sendTimeout: 5000,
                    receiveTimeout: 3000,
                  ));
          dynamic responseData;
          if (response.statusCode == 200 && response.data['status'] == true) {
            responseData = response.data;
            // print(responseData);
            //Save userdata locally
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }

  //SignUp Api
  static Future<DioResult?> signUp({
    required BuildContext context,
    required String name,
    required String mobileNumber,
    required String email,
    required String drivinglicenceNumber,
    required String driverAddress,
  }) async {
    return await Commons.handelApi(
        context: context,
        callApi: () async {
          Response response;
          var dio = Dio();
          var formData = FormData.fromMap({
            "driver_name": name,
            "driver_phone": mobileNumber,
            "driver_email": email,
            "driving_license_no": drivinglicenceNumber,
            "driver_address": driverAddress,
          });
          response = await dio.post(
            'https://fluffnfold.co.nz/fnf-api/api/website/submitPartnerEnquiry',
            data: formData,
            options: Options(
              sendTimeout: 5000,
              receiveTimeout: 3000,
              // headers: {"Authorization": "Bearer$token"}
            ),
          );
          dynamic responseData;
          if (response.statusCode == 200 && response.data['status'] == true) {
            responseData = response.data['data'];
          } else {
            responseData = null;
          }

          return DioResult.fromJson(response, responseData);
        });
  }
}
