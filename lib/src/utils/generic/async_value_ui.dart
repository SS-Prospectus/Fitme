import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../CustohttpClient/application/custom_exception.dart';
import '../logger.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context, {bool popScreen = false}) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      if (error == const CustomException.authNeededForAccessError()) {
        //context.pushNamed(AppRoute.popLoginPage.name);
      }
      debugLog(DebugTags.apiResult, message);
      userLog(message);
      if (popScreen) {
        context.pop();
      }
    }
  }

  String _errorMessage(Object? error) {
    if (error is CustomException) {
      //in case of known errors
      // print('object');
      return error.details.message;
    } else {
      // print('object 1');
      //in case of some app error
      return error.toString();
    }
  }
}