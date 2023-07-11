@JS()
library joperate_web;

import 'package:js/js.dart';

@JS('joperate')
external JOperate joperate;

@JS()
@anonymous
class JOperate {
  external dynamic init(obj);
  external dynamic eventRecord(obj);
  external dynamic identify(obj);
  external dynamic setUserChannel(obj);
  external dynamic cuid(obj);
  external dynamic setUtmProperties(obj);
  external dynamic setCommonProperties(obj);
  external dynamic setDynamicCommonProperties(obj);
  external dynamic clearCommonProperties();
  // external dynamic currentCommonProperties();
  external dynamic set(obj, completion);
  external dynamic setOnce(obj, completion);
  external dynamic increment(obj, completion);
  external dynamic append(key, content, completion);
  external dynamic unset(obj, completion);
  external dynamic timeKeepingEventStart(obj);
  external dynamic timeKeepingEventEnd(eventId, obj);
  external dynamic timeKeepingEventPause(obj);
  external dynamic timeKeepingEventResume(obj);
  external dynamic removeTimeKeepingEvent(obj);
  external dynamic clearTimeKeepingEvent();
}
