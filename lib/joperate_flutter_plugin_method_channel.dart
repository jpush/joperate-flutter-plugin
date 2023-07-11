import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'joperate_flutter_plugin_platform_interface.dart';

/// An implementation of [JoperateFlutterPluginPlatform] that uses method channels.
class MethodChannelJoperateFlutterPlugin extends JoperateFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('joperate_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void init(Map<dynamic, dynamic> config) {
    methodChannel.invokeMethod('init', config);
  }

  @override
  Future<Map<dynamic, dynamic>?> identify(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('identify', args);
    return resp;
  }

  @override
  void eventRecord(Map args) {
    methodChannel.invokeMethod('eventRecord', args);
  }

  @override
  Future<Map<dynamic, dynamic>?> setUserChannel(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('setUserChannel', args);
    return resp;
  }

  @override
  Future<String?> CUID() async {
    final resp = await methodChannel.invokeMethod<String>('CUID');
    return resp;
  }

  @override
  void setUtmProperties(Map<dynamic, dynamic> args) {
    methodChannel.invokeMethod('setUtmProperties', args);
  }

  @override
  void setCommonProperties(Map<dynamic, dynamic> args) {
    methodChannel.invokeMethod('setCommonProperties', args);
  }

  // @override
  // void setDynamicCommonProperties(dynamic args) {
  //   methodChannel.invokeMethod('setDynamicCommonProperties', args);
  // }

  @override
  void unregisterCommonProperty(String args) {
    methodChannel.invokeMethod('unregisterCommonProperty', args);
  }

  @override
  void clearCommonProperties() {
    methodChannel.invokeMethod('clearCommonProperties');
  }

  // @override
  // Future<Map<dynamic, dynamic>?> currentCommonProperties() async {
  //   final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>>('currentCommonProperties');
  //   return resp;
  // }

  @override
  Future<Map<dynamic, dynamic>?> set(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('set', args);
    return resp;
  }

  @override
  Future<Map<dynamic, dynamic>?> setOnce(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('setOnce', args);
    return resp;
  }

  @override
  Future<Map<dynamic, dynamic>?> increment(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('increment', args);
    return resp;
  }

  @override
  Future<Map<dynamic, dynamic>?> append(Map<dynamic, dynamic> args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('append', args);
    return resp;
  }

  @override
  Future<Map<dynamic, dynamic>?> unset(String args) async {
    final resp = await methodChannel.invokeMethod<Map<dynamic, dynamic>?>('unset', args);
    return resp;
  }

  @override
  Future<String?> timeKeepingEventStart(String args) async {
    final resp = await methodChannel.invokeMethod<String>('timeKeepingEventStart', args);
    return resp;
  }

  @override
  void timeKeepingEventEnd(Map<dynamic, dynamic> args) {
    methodChannel.invokeMethod('timeKeepingEventEnd', args);
  }

  @override
  void timeKeepingEventPause(String args) {
    methodChannel.invokeMethod('timeKeepingEventPause', args);

  }
  @override
  void timeKeepingEventResume(String args) {
    methodChannel.invokeMethod('timeKeepingEventResume', args);

  }

  @override
  void removeTimeKeepingEvent(String args) {
    methodChannel.invokeMethod('removeTimeKeepingEvent', args);
  }

  @override
  void clearTimeKeepingEvent() {
    methodChannel.invokeMethod('clearTimeKeepingEvent');
  }

}
