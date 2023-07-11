#import "JoperateFlutterPlugin.h"
#import "JOPERATEService.h"

@implementation JoperateFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"joperate_flutter_plugin"
            binaryMessenger:[registrar messenger]];
  JoperateFlutterPlugin* instance = [[JoperateFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"init" isEqualToString:call.method]) {
      [self setupWithConfig:call];
  } else if ([@"eventRecord" isEqualToString:call.method]) {
      [self eventRecord:call];
  } else if ([@"identify" isEqualToString:call.method]) {
      [self identifyAccount:call result:result];
  } else if ([@"setUserChannel" isEqualToString:call.method]) {
      [self setUserChannel:call result:result];
  } else if ([@"CUID" isEqualToString:call.method]) {
      [self CUID:result];
  } else if ([@"setUtmProperties" isEqualToString:call.method]) {
      [self setUtmProperties:call];
  } else if ([@"setCommonProperties" isEqualToString:call.method]) {
      [self setCommonProperties:call];
  } else if ([@"setDynamicCommonProperties" isEqualToString:call.method]) {
      [self setDynamicCommonProperties:call];
  } else if ([@"unregisterCommonProperty" isEqualToString:call.method]) {
      [self unregisterCommonProperty:call];
  } else if ([@"clearCommonProperties" isEqualToString:call.method]) {
      [self clearCommonProperties];
  } else if ([@"currentCommonProperties" isEqualToString:call.method]) {
      [self currentCommonProperties:result];
  } else if ([@"set" isEqualToString:call.method]) {
      [self set:call result:result];
  } else if ([@"setOnce" isEqualToString:call.method]) {
      [self setOnce:call result:result];
  } else if ([@"increment" isEqualToString:call.method]) {
      [self increment:call result:result];
  } else if ([@"append" isEqualToString:call.method]) {
      [self append:call result:result];
  } else if ([@"unset" isEqualToString:call.method]) {
      [self unset:call result:result];
  } else if ([@"timeKeepingEventStart" isEqualToString:call.method]) {
      [self timeKeepingEventStart:call result:result];
  } else if ([@"timeKeepingEventEnd" isEqualToString:call.method]) {
      [self timeKeepingEventEnd:call result:result];
  } else if ([@"timeKeepingEventPause" isEqualToString:call.method]) {
      [self timeKeepingEventPause:call];
  } else if ([@"timeKeepingEventResume" isEqualToString:call.method]) {
      [self timeKeepingEventResume:call];
  } else if ([@"removeTimeKeepingEvent" isEqualToString:call.method]) {
      [self removeTimeKeepingEvent:call];
  } else if ([@"clearTimeKeepingEvent" isEqualToString:call.method]) {
      [self clearTimeKeepingEvent];
  } else {
    result(FlutterMethodNotImplemented);
  }
}


- (void)setupWithConfig:(FlutterMethodCall*)call {
    NSDictionary * arguments = call.arguments;
    NSNumber *debug = arguments[@"debug"];
    if ([debug boolValue]) {
        [JOPERATEService setDebug:YES];
    } else {
        [JOPERATEService setDebug:NO];
    }
    JOPERATEConfig * config = [[JOPERATEConfig alloc] init];
    config.appKey = [arguments objectForKey:@"appkey"];
    config.channel = [arguments objectForKey:@"channel"];
    [JOPERATEService setupWithConfig:config];
}

- (void)eventRecord:(FlutterMethodCall*)call {
    NSDictionary * arguments = call.arguments;
    JOPERATEEventObject * event = [[JOPERATEEventObject alloc] init];
    event.eventName = arguments[@"eventName"];
    event.property = arguments[@"property"];
    [JOPERATEService eventRecord:event];
}

- (void)identifyAccount:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    JOPERATEUserID * userID = [[JOPERATEUserID alloc] init];
    [userID setCompletion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
    userID.userIDs = arguments;
    [JOPERATEService identifyAccount:userID];
}

- (void)setUserChannel:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    JOPERATEUserChannel * channel = [[JOPERATEUserChannel alloc] init];
    [channel setCompletion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
    channel.channels = arguments;
    [JOPERATEService setUserChannel:channel];
}

- (void)CUID:(FlutterResult)result {
    NSLog(@"%@", ([JOPERATEService CUID]));
    result([JOPERATEService CUID]);
}

- (void)setUtmProperties:(FlutterMethodCall*)call {
    NSDictionary * arguments = call.arguments;
    [JOPERATEService setUtmProperties:arguments];
}

- (void)setCommonProperties:(FlutterMethodCall*)call {
    NSDictionary * arguments = call.arguments;
    [JOPERATEService setCommonProperties:arguments];
}
 
- (void)setDynamicCommonProperties:(FlutterMethodCall*)call {
    [JOPERATEService setDynamicCommonProperties:call.arguments];
}

- (void)unregisterCommonProperty:(FlutterMethodCall*)call {
    [JOPERATEService unregisterCommonProperty:call.arguments];
}
 
- (void)clearCommonProperties {
    [JOPERATEService clearCommonProperties];
}

- (void)currentCommonProperties:(FlutterResult)result {
    result([JOPERATEService currentCommonProperties]);
}

- (void)set:(FlutterMethodCall*)call result:(FlutterResult)result {
    [JOPERATEService set:call.arguments completion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
}

- (void)setOnce:(FlutterMethodCall*)call result:(FlutterResult)result {
    [JOPERATEService setOnce:call.arguments completion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
}
 
- (void)increment:(FlutterMethodCall*)call result:(FlutterResult)result {
    [JOPERATEService increment:call.arguments completion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
}
 
- (void)append:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    [JOPERATEService append:arguments[@"key"] by:arguments[@"content"] completion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
}
     
- (void)unset:(FlutterMethodCall*)call result:(FlutterResult)result {
    [JOPERATEService unset:call.arguments completion:^(NSInteger errcode, NSString * _Nonnull msg) {
        result(@{@"errcode": @(errcode), @"msg": msg ?: @""});
    }];
}
 
- (void)timeKeepingEventStart:(FlutterMethodCall*)call result:(FlutterResult)result {
    result([JOPERATEService timeKeepingEventStart:call.arguments]);
}
 
- (void)timeKeepingEventEnd:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSDictionary *arguments = call.arguments;
    [JOPERATEService timeKeepingEventEnd:arguments[@"eventId"] with:arguments[@"properties"]];
}

- (void)timeKeepingEventPause:(FlutterMethodCall*)call {
    [JOPERATEService timeKeepingEventPause:call.arguments];
}
 
- (void)timeKeepingEventResume:(FlutterMethodCall*)call {
    [JOPERATEService timeKeepingEventResume:call.arguments];
}
 
- (void)removeTimeKeepingEvent:(FlutterMethodCall*)call {
    [JOPERATEService removeTimeKeepingEvent:call.arguments];
}
 
- (void)clearTimeKeepingEvent {
    [JOPERATEService clearTimeKeepingEvent];
}

@end
