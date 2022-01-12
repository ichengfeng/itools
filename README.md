
Collect common components just for personal use

## Features
* 1.log.dart is a commonly used log printing assistant;
* 2.screen_size.dart is used to help adapt different screens

## Usage

```dart
import 'package:itools/screen_size.dart';

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///1、初始化：(可以传入以哪个屏幕尺寸为基础适配)
    ///--> Screen.initialize(standardSize: 750);
    ///--> 不传默认750
    ///只需要先在此处初始化就可以放心使用
    Screen.initialize();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Test"),
      ),
      body: SizedBox(
        ///2、无论int或者double都可以在后面加.px或者.rpx,
        ///--> 其中rpx默认以750屏幕为基准
        height: 80.px,
        child: const Text('Hello World'),
      ),
    );
  }
}
```
