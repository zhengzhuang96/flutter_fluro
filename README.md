github: https://github.com/zhengzhuang95/flutter_fluro

关于flutter路由，在小项目中，就按照原生写法，但是在大型项目中，这样的我就不会进行推荐，我这里使用的fluro路由管理方案，大型项目中非常nice，现在开始啥也不说了，看我操作就行了

#### fluro: ^1.5.1

注：自认为是Flutter最亮，最时髦，最酷的路由器。

在大型项目中，你要问我什么叫大型，我感觉超过20就算了吧，具体什么叫大型，我也不知道，哈哈哈

首先呢，在项目中新建一个routers文件夹，与main.dart同级，这个文件夹就是我们的路由文件夹，建好之后，我们开始进行创建路由

#### 1:新建application.dart

```
import 'package:fluro/fluro.dart';
class Application {
    static Router router;
}
```

#### 2:新建routes.dart

这个页面就配置我们的路由调转链接模块

```
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
    static String root = '/';
    static String indexPage = '/indexPage';
    static String normalPage = '/normalPage';
    static String routingReference = '/routingReference';
    static String login = '/login';
    static void configureRoutes(Router router) {
        router.notFoundHandler = new Handler(
            handlerFunc: (BuildContext context, Map<String, List<String>> params) {
                print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
                print('找不到路由，404');
            },
        );

        // 路由页面配置
        router.define(indexPage, handler: indexPageHanderl);
        router.define(normalPage, handler: normalPageHanderl);
        router.define(routingReference, handler: routingReferenceHanderl);
        router.define(login, handler: loginHanderl);
    }
}
```
#### 3:新建router\_handler.dart

handler就是每个路由的规则，编写handler就是配置路由规则，比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。

```
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_fluro/pages/index_page.dart';
import 'package:flutter_fluro/pages/login.dart';
import 'package:flutter_fluro/pages/normal_page.dart';
import 'package:flutter_fluro/pages/routing_reference.dart';
// 首页
Handler indexPageHanderl = Handler(  
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {    
        return IndexPage();  
    },
);

// 正常路由跳转
Handler normalPageHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NormalPage();
    }
);

// 路由传参
Handler routingReferenceHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        String id = params['id'].first;
        return RoutingReference(id: id);
    }
);

// 登陆页面
Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Login();
    }
);
```

#### 4:新建navigator\_util.dart

这个里面主要是进行路由跳转方法的公共书写

```
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:maitianshanglv_driver/pages/app_common_module/login.dart';
import 'package:maitianshanglv_driver/pages/index_page.dart';
import './application.dart';
import './routes.dart';

class NavigatorUtil {  
    // 返回  
    static void goBack(BuildContext context) {    
        /// 其实这边调用的是 
        Navigator.pop(context);    
        Application.router.pop(context);  
    }
    
    // 带参数的返回
    static void goBackWithParams(BuildContext context, result) {
        Navigator.pop(context, result);
    }

    // 路由返回指定页面
    static void goBackUrl(BuildContext context, String title) {
        Navigator.popAndPushNamed(context, title);
    }

    // 跳转到主页面
    static void goHomePage(BuildContext context) {
        Application.router.navigateTo(context, Routes.homePage, replace: true);
    }
    
    /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
    /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
    static Future jump(BuildContext context, String title) {
        return Application.router.navigateTo(context, title, transition: TransitionType.inFromRight);
        /// 指定了 转场动画
    }

    /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
    static Future jumpLeft(BuildContext context, String title) {        return Application.router.navigateTo(context, title, transition: TransitionType.inFromLeft);        /// 指定了 转场动画    }    
    static Future jumpRemove(BuildContext context) {        return Navigator.of(context).pushAndRemoveUntil(            MaterialPageRoute(                builder: (context) => IndexPage(),            ),
            (route) => route == null);    }
    
    /// 自定义 转场动画
    static Future gotransitionCustomDemoPage(BuildContext context, String title) {
        var transition = (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
            return new ScaleTransition(
                scale: animation,
                child: new RotationTransition(
                    turns: animation,
                    child: child,
                ),
        };
        return Application.router.navigateTo(context, title, 
                transition: TransitionType.custom,
        /// 指定是自定义动画
        transitionBuilder: transition,

        /// 自定义的动画
        transitionDuration: const Duration(milliseconds: 600));
        /// 时间
    }

    /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
    /// Fluro本身不带，但是 Flutter自带
    static Future gotransitionCupertinoDemoPage(
        BuildContext context, String title) {
        return Application.router.navigateTo(context, title, transition: TransitionType.cupertino);
    }

    // 跳转到主页面IndexPage并删除当前路由
    static void goToHomeRemovePage(BuildContext context) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => IndexPage(),
        ), (route) => route == null);
    }

    // 跳转到登录页并删除当前路由
    static void goToLoginRemovePage(BuildContext context) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Login(),
            ), (route) => route == null);
    }
}
```

#### 5:接下来基本上路由模块建立完成

需要到main.dart文件夹进行注册一下

```
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluro/pages/index_page.dart';
import 'package:flutter_fluro/routers/application.dart';
import 'package:flutter_fluro/routers/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //-----------------路由主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    //-----------------路由主要代码end

    return Container(
      child: MaterialApp(
        title: 'fluro',
        //-----------------路由主要代码start
        onGenerateRoute: Application.router.generator,
        //-----------------路由主要代码end
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromARGB(255, 78, 79, 95),
        ),
        home: IndexPage(),
      ),
    );
  }
}
```

大功告成，到这里关于flutter采用fluro方式进行的大型项目路由管理就算成功，

#### 使用方法：

```
NavigatorUtil.jump(context, '/normalPage');
NavigatorUtil.jump(context, '/routingReference?id=200');
NavigatorUtil.goToLoginRemovePage(context);
```

### 注意：中文传参问题

```
NavigatorUtil.jump(context, '/routingReference?id=${Uri.encodeComponent("中文参数")}');
```