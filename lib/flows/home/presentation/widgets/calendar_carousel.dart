import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCarousel extends StatefulWidget {
  const CalendarCarousel({
    required this.initialDate,
    required this.pageController,
    super.key,
  });

  final DateTime initialDate;
  final PageController pageController;

  @override
  State<CalendarCarousel> createState() => _CalendarCarouselState();
}

class _CalendarCarouselState extends State<CalendarCarousel> {
  static const _initialIndex = 10;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return PageView.builder(
      controller: widget.pageController,
      itemBuilder: (_, int index) {
        final date = widget.initialDate.add(
          Duration(days: index - _initialIndex),
        );

        final day = DateFormat(DateFormat.DAY).format(date);
        final dayTitle = DateFormat(DateFormat.WEEKDAY).format(date);

        return Column(
          children: [
            Text(day, style: textTheme.headlineLarge),
            Text(dayTitle, style: textTheme.titleLarge),
          ],
        );
      },
    );
  }
}
