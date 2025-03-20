import 'package:cocoon/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimelineCard extends StatefulWidget {
  final Widget indicator;
  final Color lineColor;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;

  const TimelineCard({
    super.key,
    required this.indicator,
    this.lineColor = AppColors.p1,
    required this.content,
    this.contentPadding = const EdgeInsets.all(16.0),
  });

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  final GlobalKey _contentKey = GlobalKey();
  double _contentHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _contentKey.currentContext?.findRenderObject() as RenderBox?;
      setState(() {
        _contentHeight = renderBox?.size.height ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            widget.indicator,
            Container(
              width: 4,
              height: _contentHeight,
              color: widget.lineColor,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            key: _contentKey,
            child: widget.content,
          ),
        ),
      ],
    );
  }
}