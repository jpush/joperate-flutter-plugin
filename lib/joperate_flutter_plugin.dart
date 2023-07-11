
import 'joperate_flutter_plugin_platform_interface.dart';

class JoperateFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return JoperateFlutterPluginPlatform.instance.getPlatformVersion();
  }
  /*
  * 初始化SDK
  * @param config
  * {"debug":true, "appkey":"", "channel":""}
  * debug:是否开debug日志 true/false
  * appkey:您的appkey
  * channel:渠道
  *
  * iOS和Web在init接口配置appkey，Android需要在gradle中配置appkey，参考集成文档
  *
  * */
  void init(Map<dynamic, dynamic> config) {
    return JoperateFlutterPluginPlatform.instance.init(config);
  }

  /*
  * 自定义事件统计
  * @param args
  * {"eventName":"test_ios", "property":{"key":"value"}}
  * eventNmae:事件ID，必填，非空，不能使用jg前缀
  * property:自定义属性（<=500个）key为String，只能包含数字小写字母下划线，以及以字母开头
  *
  * */
  void eventRecord(Map<dynamic, dynamic> args) {
    JoperateFlutterPluginPlatform.instance.eventRecord(args);
  }

   /*
   * 设置用户标识
   * @param args 例：{"key":"value"}
   *
   * @return:{"errcode":0, msg:""} errcode为0为成功，该回调信息仅供用来参考
   **/
  Future<Map<dynamic, dynamic>?> identify(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.identify(args);
  }

  /*
   * 设置用户通道
   * @param args 例：{"通道ID":{"工作手机":"13*********"}}
   *
   * @return:{"errcode":0, msg:""} errcode为0为成功，该回调信息仅供用来参考
   **/
  Future<Map<dynamic, dynamic>?> setUserChannel(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.setUserChannel(args);
  }

  /*
   * 获取cuid
   *
   * @return:"cuid"
   **/
  Future<String?> CUID() {
    return JoperateFlutterPluginPlatform.instance.CUID();
  }

  /*
   * 设置 UTM 属性
   * {"utm_source":"source"}
   *
   * UTM 属性为预置属性，目前能够设置 UTM 属性为：
         - utm_source 广告系列来源
         - utm_medium 广告系列媒介
         - utm_term 广告系列字词
         - utm_content 广告系列内容
         - utm_campaign 广告系列名称
   **/
  void setUtmProperties(Map<dynamic, dynamic> args) {
    JoperateFlutterPluginPlatform.instance.setUtmProperties(args);
  }

  /*
   * 设置静态公共属性
   * {"key":"value"}
   *
   *  - 设置静态公有属性，后面所有上报事件数据都会包含该属性，该属性保存在本地，设置长期有效。
      - 当事件属性和公共属性重复时，事件属性会覆盖公共属性。
      - key 为 String，只能包含数字小写字母下划线，以及以字母开头。
      - value 可以是 String/数字、数组。
      - 数组 中的所有元素必须为 String。
   **/
  void setCommonProperties(Map<dynamic, dynamic> args) {
    JoperateFlutterPluginPlatform.instance.setCommonProperties(args);
  }

  /*
   * 删除某个静态公共属性
   * key:属性的key
   **/
  void unregisterCommonProperty(String key) {
    JoperateFlutterPluginPlatform.instance.unregisterCommonProperty(key);
  }

  /*
   * 删除所有的静态公共属性
   *
   **/
  void clearCommonProperties() {
    JoperateFlutterPluginPlatform.instance.clearCommonProperties();
  }

  /*
   * 设置覆盖方式的用户属性
   * {"key":"value"}
   * - 这些用户属性的内容用一个 Map 来存储，其中的 key 是用户属性的名称，必须是 String，Value 则是用户属性的内容，只支持 String、数字，数组 这些类型。
     - 数组 类型的 value 中目前只支持其中的元素是 String。
     - 如果某个用户属性之前已经存在了，则这次会被覆盖掉；不存在，则会创建。如：用户会员等级。
   *
   **/
  Future<Map<dynamic, dynamic>?> set(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.set(args);
  }

  /*
   * 设置仅首次生效的用户属性
   * {"key":"value"}
   *
     - 与 set 接口不同的是，如果该用户的某个用户属性之前已经存在了，会被忽略；不存在，则会创建。如：首次付费时间。
   *
   **/
  Future<Map<dynamic, dynamic>?> setOnce(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.setOnce(args);
  }

  /*
   * 设置累加方式的用户属性
   * {"key":1}
   *
     - 给多个数值类型的用户属性增加数值，累加所有上报的数据，如累计消费金额。
     - 只能对 数字 类型的用户属性调用这个接口，否则会被忽略, 如果这个用户属性之前不存在，则初始值当做 0 来处理。
   **/
  Future<Map<dynamic, dynamic>?> increment(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.increment(args);
  }

  /*
   * 设置追加方式的用户属性
   * {"key":"key", "content":["1","2"]}
   *
   **/
  Future<Map<dynamic, dynamic>?> append(Map<dynamic, dynamic> args) {
    return JoperateFlutterPluginPlatform.instance.append(args);
  }

  /*
   * 删除用户属性
   * key:要删除的属性key
   *
   **/
  Future<Map<dynamic, dynamic>?> unset(String key) {
    return JoperateFlutterPluginPlatform.instance.unset(key);
  }

  /*
   * 开始事件计时
   * key:事件名
   *
   * @return 事件ID，用户其他定时事件操作
   **/
  Future<String?> timeKeepingEventStart(String key) {
    return JoperateFlutterPluginPlatform.instance.timeKeepingEventStart(key);
  }

  /*
   * 结束事件计时
   * {"eventId":eventID, "properties":{"key":"value"}}
   * eventId:为eventStart返回的ID
   * properties: {"key":"value"} 为要上报的事件属性
   *
   **/
  void timeKeepingEventEnd(Map<dynamic, dynamic> args) {
    JoperateFlutterPluginPlatform.instance.timeKeepingEventEnd(args);
  }

  /*
   * 暂停事件计时
   * eventId: 事件ID
   **/
  void timeKeepingEventPause(String eventId) {
    JoperateFlutterPluginPlatform.instance.timeKeepingEventPause(eventId);
  }

  /*
   * 恢复事件计时
   * eventId: 事件ID
   **/
  void timeKeepingEventResume(String eventId) {
    JoperateFlutterPluginPlatform.instance.timeKeepingEventResume(eventId);
  }

  /*
   * 删除事件计时
   * eventId: 事件ID
   **/
  void removeTimeKeepingEvent(String eventId) {
    JoperateFlutterPluginPlatform.instance.removeTimeKeepingEvent(eventId);
  }

  /*
   * 清除所有计时事件
   **/
  void clearTimeKeepingEvent() {
    JoperateFlutterPluginPlatform.instance.clearTimeKeepingEvent();
  }

}
