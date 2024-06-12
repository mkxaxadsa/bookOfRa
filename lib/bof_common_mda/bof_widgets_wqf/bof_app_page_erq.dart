import 'package:flutter/material.dart';

class BOFAppPageGTQ extends StatelessWidget {
  final Widget content;
  final String? backgroundImage;
  final Color backColor;

  const BOFAppPageGTQ({
    super.key,
    required this.content,
    this.backgroundImage,
    this.backColor = const Color(0xff242424),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Stack(
        children: [
          if (backgroundImage != null)
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    backgroundImage!,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          SafeArea(child: content),
        ],
      ),
    );
  }
}
