import 'dart:io'; //플랫폼 체크

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//showDialog, showCupertionDialog 위젯에 필요

import '../models/custom_error.dart'; //에러 내용을 담음

void errorDialog(BuildContext context, CustomError e) {
  if (Platform.isIOS) {
    //ios면 쿠퍼티노 다이얼로그 띄움
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(e.code),
          content: Text(e.plugin + '\n' + e.message),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      //안드로이드면 showDialog 호출
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(e.code),
          content: Text(e.plugin + '\n' + e.message),
          actions: [
            TextButton(
              //ios면 CupertinoAlertDialog 부른다는 점만 다름
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
