import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:joperate_flutter_plugin/joperate_flutter_plugin.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _joperateFlutterPlugin = JoperateFlutterPlugin();
  String? timeKeepingEventID;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      //     await _joperateFlutterPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = "platformVersion";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: [
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.init({"debug":true, "appkey":"请填写您的APPKEY", "channel":"test"});
              }, child: Text("web init")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.init({"debug":true, "appkey":"请填写您的APPKEY", "channel":"test"});
              }, child: Text("ios/android init")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.eventRecord({"eventName":"test_ios", "property":{"test11":"fff"}});
              }, child: Text("event")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.identify({"test":"11222"});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("identify")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.setUserChannel({"223":{"默认联系":"13355544234"}});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("setChannel")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.CUID();
                promise.then((value) {
                  print(value);
                });
              }, child: Text("CUID")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.setUtmProperties({"utm_source":"source"});
              }, child: Text("setUtmProperties")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.setCommonProperties({"property":"ppppp"});
              }, child: Text("setCommonProperties")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.unregisterCommonProperty("property");
              }, child: Text("unregisterCommonProperty")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.clearCommonProperties();
              }, child: Text("clearCommonProperties")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.set({"age":"18"});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("set")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.setOnce({"age":"18"});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("setOnce")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.increment({"age":1});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("increment")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.append({"key":"key", "content":["1","2"]});
                promise.then((value) {
                  print(value);
                });
              }, child: Text("append")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.unset("age");
                promise.then((value) {
                  print(value);
                });
              }, child: Text("unset")),
              ElevatedButton(onPressed: () {
                var promise = _joperateFlutterPlugin.timeKeepingEventStart("test_ios");
                promise.then((value) {
                  print(value);
                  timeKeepingEventID = value;
                });
              }, child: Text("timeKeepingEventStart")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.timeKeepingEventEnd({"eventId":timeKeepingEventID, "properties":{"age":"11"}});
              }, child: Text("timeKeepingEventEnd")),
              ElevatedButton(onPressed: () {
                var id = timeKeepingEventID;
                if (id != null) {
                  _joperateFlutterPlugin.timeKeepingEventPause(id);
                }
              }, child: Text("timeKeepingEventPause")),
              ElevatedButton(onPressed: () {
                var id = timeKeepingEventID;
                if (id != null) {
                  _joperateFlutterPlugin.timeKeepingEventResume(id);
                }
              }, child: Text("timeKeepingEventResume")),
              ElevatedButton(onPressed: () {
                var id = timeKeepingEventID;
                if (id != null) {
                  _joperateFlutterPlugin.removeTimeKeepingEvent(id);
                }
              }, child: Text("removeTimeKeepingEvent")),
              ElevatedButton(onPressed: () {
                _joperateFlutterPlugin.clearTimeKeepingEvent();
              }, child: Text("clearTimeKeepingEvent")),
            ],
          ),
        ),
      ),
    );
  }
}


