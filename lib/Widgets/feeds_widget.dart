import 'package:flutter/material.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
