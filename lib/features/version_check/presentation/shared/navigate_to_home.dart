import 'package:ainaa/features/app_meta_data/presentation/pages/init_page.dart';
import 'package:flutter/material.dart'
    show Navigator, BuildContext, PageRouteBuilder, FadeTransition;

void navigateToHome(BuildContext context) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => InitPage(),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: Duration(milliseconds: 500), // Adjust timing
    ),
  );
}
