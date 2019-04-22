import 'dart:async';

import 'package:flutter/services.dart';

class UMeng {
  static const MethodChannel _channel = const MethodChannel('flutter_umeng');

  /// 初始化
  static Future<bool> init(String key, {String channel}) {
    Map<String, String> args = {"key": key};

    if (channel != null) {
      args["channel"] = channel;
    }

    _channel.invokeMethod("init", args);
    return new Future.value(true);
  }

  /// 打开页面时进行统计
  /// [pageName]
  static Future<Null> beginPageView(String pageName) async {
    _channel.invokeMethod("beginPageView", {"pageName": pageName});
  }

  /// 关闭页面时结束统计
  /// [pageName]
  static Future<Null> endPageView(String pageName) async {
    _channel.invokeMethod("endPageView", {"pageName": pageName});
  }

  /// 计数事件统计
  /// [eventId] 当前统计的事件ID
  static Future<Null> event(String eventId) async {
    _channel.invokeMethod("event", {"eventId": eventId});
  }
}
