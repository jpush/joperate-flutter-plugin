package com.jiguang.joperate_flutter_plugin

import android.content.Context
import androidx.annotation.NonNull
import cn.jiguang.api.utils.JCollectionAuth
import cn.jiguang.joperate.api.JOperateInterface

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject

/** JoperateFlutterPlugin */
class JoperateFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var context: Context? = null


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "joperate_flutter_plugin")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }else if (call.method == "init") {
      init(call)
    }else if (call.method == "eventRecord") {
      eventRecord(call)
    }else if (call.method == "identify") {
      identifyAccount(call, result)
    }else if (call.method == "setUserChannel") {
      setUserChannel(call, result)
    }else if (call.method == "CUID") {
      CUID(call, result)
    }else if (call.method == "setUtmProperties") {
      setUtmProperties(call, result)
    }else if (call.method == "setCommonProperties") {
      setCommonProperties(call, result)
    }else if (call.method == "setDynamicCommonProperties") {
      setDynamicCommonProperties(call, result)
    }else if (call.method == "unregisterCommonProperty") {
      unregisterCommonProperty(call, result)
    }else if (call.method == "clearCommonProperties") {
      clearCommonProperties(call, result)
    }else if (call.method == "set") {
      set(call, result)
    }else if (call.method == "setOnce") {
      setOnce(call, result)
    }else if (call.method == "increment") {
      increment(call, result)
    }else if (call.method == "append") {
      append(call, result)
    }else if (call.method == "unset") {
      unset(call, result)
    }else if (call.method == "timeKeepingEventStart") {
      timeKeepingEventStart(call, result)
    }else if (call.method == "timeKeepingEventEnd") {
      timeKeepingEventEnd(call, result)
    }else if (call.method == "timeKeepingEventPause") {
      timeKeepingEventPause(call, result)
    }else if (call.method == "timeKeepingEventResume") {
      timeKeepingEventResume(call, result)
    }else if (call.method == "removeTimeKeepingEvent") {
      removeTimeKeepingEvent(call, result)
    }else if (call.method == "clearTimeKeepingEvent") {
      clearTimeKeepingEvent(call, result)
    }else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  fun init(call: MethodCall){
    val arguments = call.arguments as HashMap<*, *>
    if (arguments["debug"] == true) {
      JOperateInterface.setDebug(true)
    }
    JCollectionAuth.setAuth(context, true)
    JOperateInterface.getInstance(context).init()
  }

  fun eventRecord(call: MethodCall){
    val arguments = call.arguments as HashMap<*, *>
    var json: JSONObject? = null
    if (arguments["property"] != null) {
      json = JSONObject(arguments["property"] as HashMap<*, *>)
    }
    JOperateInterface.getInstance(context).onEvent(arguments["eventName"] as String?, json)
  }

  fun identifyAccount(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    if (json.length() > 0) {
      JOperateInterface.getInstance(context).login(json) { i, s ->
        val map = HashMap<Any, Any?>()
        map["errcode"] = i;
        map["msg"] = s;
        result.success(map)
      }
    }
  }

  fun setUserChannel(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    if (json.length() > 0) {
      JOperateInterface.getInstance(context).setChannel(json) { i, s ->
        val map = HashMap<Any, Any?>()
        map["errcode"] = i;
        map["msg"] = s;
        result.success(map)
      }
    }
  }

  fun CUID(call: MethodCall, result: Result) {
    result.success(JOperateInterface.getInstance(context).cuid)
  }

  fun setUtmProperties(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    if (json.length() > 0) {
      JOperateInterface.getInstance(context).setUtmProperties(json)
    }
  }

  fun setCommonProperties(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    if (json.length() > 0) {
      JOperateInterface.getInstance(context).registerSuperProperties(json)
    }
  }

  fun setDynamicCommonProperties(call: MethodCall, result: Result) {
    val f = call.arguments as () -> JSONObject
    JOperateInterface.getInstance(context).registerDynamicSuperProperties {
      return@registerDynamicSuperProperties f()
    }
  }

  fun unregisterCommonProperty(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).unregisterSuperProperty(call.arguments as String?)
  }

  fun clearCommonProperties(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).clearSuperProperties()
  }

  fun set(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    JOperateInterface.getInstance(context).profileSet(json){ i, s ->
      val map = HashMap<Any, Any>()
      map["errcode"] = i;
      map["msg"] = s;
      result.success(map)
    }
  }

  fun setOnce(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val json = JSONObject(arguments)
    JOperateInterface.getInstance(context).profileSetOnce(json){ i, s ->
      val map = HashMap<Any, Any>()
      map["errcode"] = i;
      map["msg"] = s;
      result.success(map)
    }
  }

  fun increment(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<String, Number>
    JOperateInterface.getInstance(context).profileIncrement(arguments){ i, s ->
      val map = HashMap<Any, Any>()
      map["errcode"] = i;
      map["msg"] = s;
      result.success(map)
    }
  }

  fun append(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    val list = arguments["content"] as List<String>

    JOperateInterface.getInstance(context).profileAppend(arguments["key"] as String, list.toSet()){ i, s ->
      val map = HashMap<Any, Any>()
      map["errcode"] = i;
      map["msg"] = s;
      result.success(map)
    }
  }

  fun unset(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).profileUnset(call.arguments as String){ i, s ->
      val map = HashMap<Any, Any>()
      map["errcode"] = i;
      map["msg"] = s;
      result.success(map)
    }
  }

  fun timeKeepingEventStart(call: MethodCall, result: Result) {
    val key = JOperateInterface.getInstance(context).onEventTimerStart(call.arguments as String)
    result.success(key)
  }

  fun timeKeepingEventEnd(call: MethodCall, result: Result) {
    val arguments = call.arguments as HashMap<*, *>
    var json: JSONObject? = null
    if (arguments["properties"] != null) {
      json = JSONObject(arguments["properties"] as HashMap<*, *>)
    }
    JOperateInterface.getInstance(context).onEventTimerEnd(arguments["eventId"] as String, json)
  }

  fun timeKeepingEventPause(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).onEventTimerPause(call.arguments as String)
  }

  fun timeKeepingEventResume(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).onEventTimerResume(call.arguments as String)
  }

  fun removeTimeKeepingEvent(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).removeTimer(call.arguments as String)
  }

  fun clearTimeKeepingEvent(call: MethodCall, result: Result) {
    JOperateInterface.getInstance(context).clearTrackTimer()
  }
}
