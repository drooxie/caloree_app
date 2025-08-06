import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 4),
          child: Text(
            'Hello again!',
            style: textTheme.displaySmall,
          ),
        ),
        Text(
          "Eatin' something tasty, innit? :)",
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
