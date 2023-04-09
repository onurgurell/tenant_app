import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenant_app/core/di/locator.dart';
import 'package:tenant_app/core/router/routes.dart';
import 'package:tenant_app/presentation/education_status/education_status_page.dart';
import 'package:tenant_app/presentation/express_yourself/express_yourself_page.dart';
import 'package:tenant_app/view_model/express_yourself_view_model.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.expressYourSelfPage:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider<ExpressYourselfViewModel>.value(
                  value: locator.get<ExpressYourselfViewModel>())
            ],
            child: const ExpressYourSelfPage(),
          ),
        );
      case Routes.educationStatusPage:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider<ExpressYourselfViewModel>.value(
                  value: locator.get<ExpressYourselfViewModel>()),
            ],
            child: const EducationStatusPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ups !'),
            ),
          ),
        );
    }
  }
}
