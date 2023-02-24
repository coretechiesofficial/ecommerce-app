import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class CustomDialog {
  static circularProcessDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        // barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
                child: SizedBox(
                    // height: 50,
                    // width: 50,
                    child: SpinKitWave(
              color: whiteColor,
              size: 30,
            ))),
          );
        });
  }

  static Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        title: Text('Exit App'),
        content: Text('Do you want to exit this app?'),
        actionsPadding: EdgeInsets.all(15.w),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          const SizedBox(),
          /*// CustomButtons.lightTextButton16(
          //     text: "No",
          //     onTap: () {
          //      Navigator.pop(context);
          //     }),
          CustomButtons.darkTextButton(
              // height: 50.h,
              width: 100.w,
              text: "Yes",
              onTap: () {
                exit(0);
              })*/
        ],
      ),
    );
  }
}
