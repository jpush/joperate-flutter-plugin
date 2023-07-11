import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'joperate_flutter_plugin_method_channel.dart';

abstract class JoperateFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a JoperateFlutterPluginPlatform.
  JoperateFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static JoperateFlutterPluginPlatform _instance = MethodChannelJoperateFlutterPlugin();

  /// The default instance of [JoperateFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelJoperateFlutterPlugin].
  static JoperateFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JoperateFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(JoperateFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void init(Map<dynamic, dynamic> config) {}

  void eventRecord(Map<dynamic, dynamic> args) {
    throw UnimplementedError('eventRecord() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> identify(Map<dynamic, dynamic> args) {
    throw UnimplementedError('identify() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> setUserChannel(Map<dynamic, dynamic> args) {
    throw UnimplementedError('setUserChannel() has not been implemented.');
  }

  Future<String?> CUID() {
    throw UnimplementedError('CUID() has not been implemented.');
  }

  void setUtmProperties(Map<dynamic, dynamic> args) {
    throw UnimplementedError('setUtmProperties() has not been implemented.');
  }

  void setCommonProperties(Map<dynamic, dynamic> args) {
    throw UnimplementedError('setCommonProperties() has not been implemented.');
  }

  // void setDynamicCommonProperties(dynamic args) {
  //   throw UnimplementedError('setDynamicCommonProperties() has not been implemented.');
  // }

  void unregisterCommonProperty(String args) {
    throw UnimplementedError('unregisterCommonProperty() has not been implemented.');
  }

  void clearCommonProperties() {
    throw UnimplementedError('clearCommonProperties() has not been implemented.');
  }

  // Future<Map<dynamic, dynamic>?> currentCommonProperties() {
  //   throw UnimplementedError('currentCommonProperties() has not been implemented.');
  // }

  Future<Map<dynamic, dynamic>?> set(Map<dynamic, dynamic> args) {
    throw UnimplementedError('set() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> setOnce(Map<dynamic, dynamic> args) {
    throw UnimplementedError('setOnce() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> increment(Map<dynamic, dynamic> args) {
    throw UnimplementedError('increment() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> append(Map<dynamic, dynamic> args) {
    throw UnimplementedError('append() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>?> unset(String args) {
    throw UnimplementedError('unset() has not been implemented.');
  }

  Future<String?> timeKeepingEventStart(String args) {
    throw UnimplementedError('timeKeepingEventStart() has not been implemented.');
  }

  void timeKeepingEventEnd(Map<dynamic, dynamic> args) {
    throw UnimplementedError('timeKeepingEventEnd() has not been implemented.');
  }

  void timeKeepingEventPause(String args) {
    throw UnimplementedError('timeKeepingEventPause() has not been implemented.');
  }

  void timeKeepingEventResume(String args) {
    throw UnimplementedError('timeKeepingEventResume() has not been implemented.');
  }

  void removeTimeKeepingEvent(String args) {
    throw UnimplementedError('removeTimeKeepingEvent() has not been implemented.');
  }

  void clearTimeKeepingEvent() {
    throw UnimplementedError('clearTimeKeepingEvent() has not been implemented.');
  }
}
