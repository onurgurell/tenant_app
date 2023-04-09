import 'package:flutter/material.dart';
import 'package:tenant_app/core/constants/app_strings.dart';
import 'package:tenant_app/core/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.expressYourSelfPage);
          },
          child: const Text(AppStrings.explainYourSelfUs),
        ),
      ),
    );
  }
}
