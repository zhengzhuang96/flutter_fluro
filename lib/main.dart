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
