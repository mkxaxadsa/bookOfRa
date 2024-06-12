import 'package:flutter/material.dart';

class BOFAnimDialogGTQ extends StatefulWidget {
  final Widget content;
  const BOFAnimDialogGTQ({
    super.key,
    required this.content,
  });

  @override
  State<StatefulWidget> createState() => BOFAnimDialogGTQStateState();
}

class BOFAnimDialogGTQStateState extends State<BOFAnimDialogGTQ>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: widget.content,
        ),
      ),
    );
  }
}
