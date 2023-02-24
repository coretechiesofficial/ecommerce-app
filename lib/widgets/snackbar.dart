
//MARK: - Packages
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

//MARK: - Class
class CustomSnackBar {
  static showCustomInfoSnack(BuildContext context, String msgStr) {
    showSimpleNotification(
        Container(
          height: 80.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.4, 0.8),
              colors: <Color>[
                // primaryBlue,
                // backgroundColor,
                // secondaryGreen
                Color(0xff009FFD),
                Color(0xff2A2A72),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: Text(
              msgStr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        background: Colors.transparent,
        slideDismiss: true,
        duration: const Duration(seconds: 3));
  }
}
//MARK: - Variables & Constants
//MARK: - Arrays & Dictionaries
//MARK: -View LifeCycle Color(0xffAEB9CD)
//MARK: - Class Methods
//MARK: - Action Methods
//MARK: - Widgets