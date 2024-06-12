import 'package:flutter/material.dart';

class FOSAppNavVQE {
  static fospushPageBGA(Widget page, BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  static fospushReplacementPageLKJA(
    Widget page,
    BuildContext context,
  ) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
}
