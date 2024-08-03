import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


class Util {

  static const _patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static isEmail(String email) => email.contains(RegExp(_patternEmail));

  static Future<Uint8List> compressWithBytes({
    required Uint8List bytes,
    int minWidth = 1920,
    int minHeight = 1080,
    int inSampleSize = 1,
    int quality = 95,
    int rotate = 0,
    bool autoCorrectionAngle = true,
    CompressFormat format = CompressFormat.jpeg,
    bool keepExif = false,
  }) async {
    return FlutterImageCompress.compressWithList(
      bytes,
      format: format,
      rotate: rotate,
      quality: quality,
      keepExif: keepExif,
      minWidth: minWidth,
      minHeight: minHeight,
      inSampleSize: inSampleSize,
      autoCorrectionAngle: autoCorrectionAngle,
    );
  }

  static int getYearDifference(DateTime from, DateTime to) {
    var diff = to.year - from.year;
    if (to.month < from.month || (to.month == from.month && to.day < from.day)) {
      diff--;
    }
    return diff;
  }

}