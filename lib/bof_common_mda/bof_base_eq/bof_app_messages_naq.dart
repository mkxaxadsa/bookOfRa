import 'package:flutter/material.dart';

class FOSAppMessagesUIQ {
  static fosshowCustomMessageUTQ(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: const Color(0xff055DBB),
      ),
    );
  }
}
