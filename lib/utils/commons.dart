import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../models/dio_results.dart';
import '../models/user_model.dart';
import '../widgets/dialogue.dart';
import '../widgets/snackbar.dart';

class Commons {
  static FlutterSecureStorage get storage => const FlutterSecureStorage();

  static Future getDeviceOsVersion(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion.toString();
    } else {
      return '';
    }
  }

  static Future getDeviceName(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.brand;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name;
    } else {
      return '';
    }
  }

  static Future getDeviceModel(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model.toString();
    } else {
      return '';
    }
  }

  static Future getDeviceTokenFirebase(BuildContext context) async {
    // Firebase.initializeApp();
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint(token);
    return token;
  }

  static Future getDeviceOs(BuildContext context) async {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
    } else {
      return '';
    }
  }

  static Future getDeviceId(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      return '';
    }
  }

  /* static Future getDeviceTokenFirebase(BuildContext context) async {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint(token);
    return token;
  }*/

  static Future<bool> checkConnectivity() async {
    try {
      bool isConnected;
      var _connectivity = await (Connectivity().checkConnectivity());
      if (_connectivity == ConnectivityResult.mobile) {
        isConnected = true;
      } else if (_connectivity == ConnectivityResult.wifi) {
        isConnected = true;
      } else {
        isConnected = false;
      }

      return isConnected;
    } catch (e) {
      print('Exception - commons.dart - checkConnectivity(): ' + e.toString());
    }
    return false;
  }

  static showNetworkError(BuildContext context) {
    CustomSnackBar.showCustomInfoSnack(context, "No internet available");
  }

  static Future<bool> get isGothroughVisible async {
    String? value = await storage.read(key: "isGothroughVisible");

    if (value == null) {
      await storage.write(key: "isGothroughVisible", value: "1");
      return true;
    } else {
      return false;
    }
  }

  // handelApi will handel internet connectivity, api exception, dio exception.
  // callApi method which will return instance of DioResult.
  // in every conditon it will show snackbar with message.

  static Future<DioResult?> handelApi(
      {required BuildContext context,
      required Function callApi,
      bool? automatic = false}) async {
    if (await Commons.checkConnectivity()) {
      try {
        automatic! ? null : CustomDialog.circularProcessDialog(context);
        DioResult? data = await callApi();
        if (data == null) {
          automatic
              ? null
              : CustomSnackBar.showCustomInfoSnack(
                  context, "ghghgh");
        } else {
          // if (data.status == 404) {
            // CustomSnackBar.showCustomInfoSnack(context, data.message!);
          // } else {
            /*if (!data.status!) {
              automatic
                  ? null
                  : CustomSnackBar.showCustomInfoSnack(context, data.message!);
            } else {
              print("Exception(DioError) - handelApi(): ELSE");
            }*/
          // }
        }
        automatic ? null : Get.back();
        return data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.connectTimeout) {
          automatic!
              ? null
              : CustomSnackBar.showCustomInfoSnack(
                  context, "Connection Timeout Exception.Please Try again!");

          automatic ? null : Get.back();
        }
        if (e.type == DioErrorType.receiveTimeout) {
          automatic!
              ? null
              : CustomSnackBar.showCustomInfoSnack(
                  context, "Connection Timeout Exception.Please Try again!");

          automatic ? null : Get.back();
        } else {
          automatic!
              ? null
              : CustomSnackBar.showCustomInfoSnack(
                  context, "hg went wrong");
        }
        automatic ? null : Get.back();
        // Navigator.pop(context);
        print("Exception(DioError) - handelApi(): " + e.toString());
      } catch (e) {
        automatic!
            ? null
            : CustomSnackBar.showCustomInfoSnack(
                context, "fhggh went wrong");
        // Navigator.pop(context);

        automatic ? null : Get.back();

        print("Exception - handelApi(): " + e.toString());
      }
      // Navigator.pop(context);
    } else {
      automatic! ? null : Commons.showNetworkError(context);
      return null;
    }
    return null;
  }

  static Future<String?> getUserId(BuildContext context) async {
    try {
      final userId = await storage.read(key: "user_id");
      if (kDebugMode) {
        // print(userId);
      }
      if (userId != null) {
        return userId;
      } else {
        return null;
      }
    } catch (e) {
      CustomSnackBar.showCustomInfoSnack(context, "Error While storing data");
      return null;
    }
  }

  static Future<bool> setUserData(
      UserModel userModel, BuildContext context) async {
    try {
      // await storage.write(key: "driver_id", value: userModel.driverid);
      // await storage.write(key: "user_id", value: userModel.userid);
      // await storage.write(key: "mobile_number", value: userModel.mobilenumber);
      // await storage.write(key: "profile_image", value: userModel.profileimage);
      // await storage.write(key: "email", value: userModel.email);
      // await storage.write(key: "first_name", value: userModel.firstname);
      // await storage.write(key: "last_name", value: userModel.lastname);
      // await storage.write(key: "base_currency", value: userModel.basecurrency);
      // await storage.write(key: "role_id", value: userModel.roleid);
      await storage.write(key: "token", value: userModel.token);
      // await storage.write(key: "token_type", value: userModel.tokenType);

      return true;
    } catch (e) {
      CustomSnackBar.showCustomInfoSnack(context, "Error While storing data");
      return false;
    }
  }

  static Future<UserModel?> getUserData(BuildContext context) async {
    try {
      final driverId = await storage.read(key: "driver_id");
      // print(driverId);
      final userId = await storage.read(key: "user_id");
      // print(userId);
      final mobileNumber = await storage.read(
        key: "mobile_number",
      );
      final profileImage = await storage.read(
        key: "profile_image",
      );
      final email = await storage.read(
        key: "email",
      );
      final firstName = await storage.read(key: "first_name");
      final lastName = await storage.read(key: "last_name");
      final baseCurrency = await storage.read(key: "base_currency");
      final roleId = await storage.read(key: "role_id");
      // print(name);
      final token = await storage.read(
        key: "token",
      );
      final tokenType = await storage.read(key: "token_type");

      return userId != null
          ? UserModel(
              driverid: driverId!,
              userid: userId,
              mobilenumber: mobileNumber!,
              profileimage: profileImage,
              email: email,
              firstname: firstName,
              lastname: lastName,
              basecurrency: baseCurrency,
              roleid: roleId!,
              token: token,
              tokenType: tokenType)
          : null;
    } catch (e) {
      print("Exception Commons() - getUserData " + e.toString());
      // CustomSnackBar.showCustomInfoSnack(context, "Error While fetching data");
      return null;
    }
  }

//Delete All The Data
  static Future<dynamic> removeUserData(BuildContext context) async {
    //exception will handel by handelExceptionApi funciton
    await storage.delete(key: "user_id");
    await storage.delete(
      key: "driver_id",
    );
    await storage.delete(
      key: "user_id",
    );
    await storage.delete(
      key: "mobile_number",
    );
    await storage.delete(
      key: "profile_image",
    );
    await storage.delete(
      key: "email",
    );
    await storage.delete(
      key: "first_name",
    );
    await storage.delete(
      key: "last_name",
    );
    await storage.delete(
      key: "base_currency",
    );
    await storage.delete(
      key: "role_id",
    );
    await storage.delete(
      key: "token",
    );
    await storage.delete(
      key: "token_type",
    );
  }

  /// Will handel logout and navigation

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
