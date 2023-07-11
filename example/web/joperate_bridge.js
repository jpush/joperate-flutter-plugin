
window.joperate = {
    init: function(obj){
        window.JOperateInterface.init(obj)
    },
    eventRecord: function(obj){
        window.JOperateInterface.onEvent(obj)
    },
    identify: function(obj){
        window.JOperateInterface.identifyAccount(obj)
    },
    setUserChannel: function(obj){
        window.JOperateInterface.setUserChannel(obj)
    },
    cuid: function(obj){
        window.JOperateInterface.CUID(obj)
    },
    setUtmProperties: function(obj){
        window.JOperateInterface.setUtmProperties(obj)
    },
    setCommonProperties:function (obj) {
        window.JOperateInterface.setEventCommonAttr(obj)
    },
    setDynamicCommonProperties:function (obj) {
        window.JOperateInterface.setEventDynamicAttr(obj)
    },
    clearCommonProperties: function(){
        window.JOperateInterface.clearEventCommonAttr()
    },
    currentCommonProperties: function(){
        return window.JOperateInterface.currentEventCommonAttr()
    },
    set: function(obj, completion){
        window.JOperateInterface.set(obj, completion)
    },
    setOnce: function(obj, completion){
        window.JOperateInterface.setOnce(obj, completion)
    },
    increment: function(obj, completion){
        window.JOperateInterface.increment(obj, completion)
    },
    append: function(key, content, completion){
        window.JOperateInterface.append(key, content, completion)
    },
    unset: function(obj,  completion){
        window.JOperateInterface.unset(obj, completion)
    },
    timeKeepingEventStart: function(obj){
        return window.JOperateInterface.timeKeepingEventStart(obj)
    },
    timeKeepingEventEnd: function(eventId, obj){
        window.JOperateInterface.timeKeepingEventEnd(eventId, obj)
    },
    timeKeepingEventPause: function(obj){
        window.JOperateInterface.timeKeepingEventPause(obj)
    },
    timeKeepingEventResume: function(obj){
        window.JOperateInterface.timeKeepingEventResume(obj)
    },
    removeTimeKeepingEvent: function(obj){
        window.JOperateInterface.removeTimeKeepingEvent(obj)
    },
    clearTimeKeepingEvent: function(){
        window.JOperateInterface.clearTimeKeepingEvent()
    },
}