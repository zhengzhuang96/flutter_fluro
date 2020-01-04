/*
 * @Author: zhengzhuang
 * @since: 2020-01-04 16:03:01
 * @lastTime     : 2020-01-04 16:33:05
 * @LastAuthor   : zhengzhuang
 * @文件相对于项目的路径: /flutter_fluro/lib/pages/home_page.dart
 * @message: 首页 IndexPage
 */
import 'package:flutter/material.dart';
import 'package:flutter_fluro/routers/navigator_util.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fluro'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              MaterialButton(
                child: Text(
                  '正常路由跳转',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                minWidth: 300.0,
                height: 50.0,
                color: Colors.blueAccent,
                onPressed: () => NavigatorUtil.jump(context, '/normalPage'),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                child: Text(
                  '路由穿参：200',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                minWidth: 300.0,
                height: 50.0,
                color: Colors.blueAccent,
                onPressed: () => NavigatorUtil.jump(context, '/routingReference?id=200'),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                child: Text(
                  '跳转登陆页并删除当前路由',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                minWidth: 300.0,
                height: 50.0,
                color: Colors.blueAccent,
                onPressed: () => NavigatorUtil.goToLoginRemovePage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
