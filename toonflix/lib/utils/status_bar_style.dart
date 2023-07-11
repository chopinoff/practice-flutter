import 'package:flutter/services.dart';

class StatusBarStyle {
  static final statusBarStyle = SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(0, 0, 0, 0),
    ),
  );
}
