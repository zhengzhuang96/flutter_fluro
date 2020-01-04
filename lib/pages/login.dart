/*
 * @Author: zhengzhuang
 * @since: 2020-01-04 16:28:20
 * @lastTime     : 2020-01-04 16:30:01
 * @LastAuthor   : zhengzhuang
 * @文件相对于项目的路径: /flutter_fluro/lib/pages/login.dart
 * @message: 登陆页面   Login
 */
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆页'),
      ),
      body: Container(
        child: Text('到这个页面基本上，再次返回推出APP'),
      ),
    );
  }
}