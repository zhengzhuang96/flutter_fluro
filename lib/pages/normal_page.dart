/*
 * @Author: zhengzhuang
 * @since: 2020-01-04 16:13:49
 * @lastTime     : 2020-01-04 16:15:36
 * @LastAuthor   : zhengzhuang
 * @文件相对于项目的路径: /flutter_fluro/lib/pages/normal.dart
 * @message: 正常路由跳转 NormalPage
 */
import 'package:flutter/material.dart';

class NormalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('正常路由跳转'),
      ),
      body: Text('成功'),
    );
  }
}