/*
 * @Author: zhengzhuang
 * @since: 2020-01-04 16:22:54
 * @lastTime     : 2020-01-04 16:26:23
 * @LastAuthor   : zhengzhuang
 * @文件相对于项目的路径: /flutter_fluro/lib/pages/routing_reference.dart
 * @message: 路由穿参数 RoutingReference
 */
import 'package:flutter/material.dart';

class RoutingReference extends StatelessWidget {
  final String id;
  RoutingReference({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由传参数$id'),
      ),
      body: Text('传来'),
    );
  }
}