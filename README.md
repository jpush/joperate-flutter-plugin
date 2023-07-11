[![QQ Group](https://img.shields.io/badge/QQ%20Group-862401307-red.svg)]()
### 安装

在工程 pubspec.yaml 中加入 dependencies

```
  
//github  集成
dependencies:
  joperate_flutter_plugin:
    git:
      url: git://github.com/jpush/joperate-flutter-plugin.git
      ref: master
      
```

### 配置

##### Android:

在 `/android/app/build.gradle` 中添加下列代码：

```groovy
android: {
  ....
  defaultConfig {
    applicationId "替换成自己应用 ID"
    ...
    ndk {
	//选择要添加的对应 cpu 类型的 .so 库。
	abiFilters 'armeabi', 'armeabi-v7a', 'x86', 'x86_64', 'mips', 'mips64', 'arm64-v8a',        
    }

    manifestPlaceholders = [
        JPUSH_PKGNAME : applicationId,
        JPUSH_APPKEY : "appkey", // NOTE: JPush 上注册的包名对应的 Appkey.
        JPUSH_CHANNEL : "developer-default", //暂时填写默认值即可.
    ]
  }    
}
```
##### Web:
将目录下的joperate-web.min.js和joperate_bridge.js文件复制到您的web目录下。
然后在您的index.html中引入上述两个js库。
```html
<script src="joperate-web.min.js"></script>
<script src="joperate_bridge.js" defer></script>
```
说明：
joperate-web.min.js：极光分析web sdk
joperate_bridge.js：js桥接文件，该文件需要在joperate-web.min.js后面引用
### 使用

```dart
import 'package:joperate_flutter_plugin/joperate_flutter_plugin.dart';
```
建议在使用时参考demo中的调用以及集成方法以便于理解
### APIs

**注意** : 需要先调用 joperateFlutterPlugin.init 来初始化插件，才能保证其他功能正常工作。

 [参考API](./lib/joperate_flutter_plugin.dart)

