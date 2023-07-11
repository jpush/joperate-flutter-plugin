// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;
import 'dart:js_util';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:joperate_flutter_plugin/joperate_web.dart';

import 'joperate_flutter_plugin_platform_interface.dart';

/// A web implementation of the JoperateFlutterPluginPlatform of the JoperateFlutterPlugin plugin.
class JoperateFlutterPluginWeb extends JoperateFlutterPluginPlatform {
  /// Constructs a JoperateFlutterPluginWeb
  JoperateFlutterPluginWeb();

  static void registerWith(Registrar registrar) {
    JoperateFlutterPluginPlatform.instance = JoperateFlutterPluginWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }


  Future<Map<dynamic, dynamic>?> commonFuture(){
    return Future(() {
      return {"errcode":"99", "msg":"plugin request is success,but web plugin doesn't support callback, "
          "You can check the browser logs to confirm the actual callback content."};
    });
  }

  @override
  void init(Map<dynamic, dynamic> args) {
    final config = {'appKey': args['appkey'], 'debugMode': args['debug'], 'channel': args['channel'] };
    joperate.init(jsify(config));
  }

  @override
  Future<Map<dynamic, dynamic>?> identify(Map<dynamic, dynamic> args) async {
    final user = {'userIDs': args, 'completion': allowInterop((errcode, msg){})};
    joperate.identify(jsify(user));
    return commonFuture();
  }

  @override
  void eventRecord(Map args) {
    final event = {'name': args['eventName'], 'attributes': args['property'] };
    joperate.eventRecord(jsify(event));
  }

  @override
  Future<Map<dynamic, dynamic>?> setUserChannel(Map<dynamic, dynamic> args) async {
    final user = {'channels': args, 'completion': allowInterop((errcode, msg){})};
    joperate.setUserChannel(jsify(user));
    return commonFuture();
  }

  @override
  Future<String?> CUID() async {
    joperate.cuid(allowInterop((errcode, msg){
      print(errcode.toString() + " " + msg);
    }));
    Future<String> future = Future(() {
      return "plugin request is success,but web plugin doesn't support callback, "
          "You can check the browser logs to confirm the actual callback content";
    });
    return future;
  }

  @override
  void setUtmProperties(Map<dynamic, dynamic> args) {
    joperate.setUtmProperties(jsify(args));
  }

  @override
  void setCommonProperties(Map<dynamic, dynamic> args) {
    joperate.setCommonProperties(jsify(args));
  }

  @override
  void setDynamicCommonProperties(dynamic args) {
    var callback = allowInterop((){
      return args();
    });
    joperate.setDynamicCommonProperties(callback);
  }

  @override
  void clearCommonProperties() {
    joperate.clearCommonProperties();
  }

  // @override
  // Future<Map<dynamic, dynamic>?> currentCommonProperties() async {
  //   Future<Map<dynamic, dynamic>> future = Future(() {
  //     return joperate.currentCommonProperties();
  //   });
  //   return future;
  // }

  @override
  Future<Map<dynamic, dynamic>?> set(Map<dynamic, dynamic> args) async {
    joperate.set(jsify(args), allowInterop((errcode, msg){}));
    return commonFuture();
  }

  @override
  Future<Map<dynamic, dynamic>?> setOnce(Map<dynamic, dynamic> args) async {
    joperate.setOnce(jsify(args), allowInterop((errcode, msg){}));
    return commonFuture();  }

  @override
  Future<Map<dynamic, dynamic>?> increment(Map<dynamic, dynamic> args) async {
    joperate.increment(jsify(args), allowInterop((errcode, msg){}));
    return commonFuture();
  }

  @override
  Future<Map<dynamic, dynamic>?> append(Map<dynamic, dynamic> args) async {
    joperate.append(args["key"], args["content"], allowInterop((errcode, msg){}));
    return commonFuture();
  }

  @override
  Future<Map<dynamic, dynamic>?> unset(String args) async {
    joperate.unset(args, allowInterop((errcode, msg){}));
    return commonFuture();
  }

  @override
  Future<String?> timeKeepingEventStart(String args) async {
    Future<String> future = Future(() {
      return joperate.timeKeepingEventStart(args);
    });
    return future;
  }

  @override
  void timeKeepingEventEnd(Map<dynamic, dynamic> args) {
    joperate.timeKeepingEventEnd(args["eventId"], jsify(args["properties"]));
  }

  @override
  void timeKeepingEventPause(String args) {
    joperate.timeKeepingEventPause(args);
  }
  @override
  void timeKeepingEventResume(String args) {
    joperate.timeKeepingEventResume(args);
  }

  @override
  void removeTimeKeepingEvent(String args) {
    joperate.removeTimeKeepingEvent(args);
  }

  @override
  void clearTimeKeepingEvent() {
    joperate.clearTimeKeepingEvent();
  }

}
