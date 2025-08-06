import 'package:caloree_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class NoEntriesMessage extends StatelessWidget {
  const NoEntriesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.simonsCatVector.svg(
          width: 240,
          colorFilter: ColorFilter.mode(
            TextTheme.of(context).bodyLarge!.color!,
            BlendMode.srcIn,
          ),
        ),
        Text(
          'No entries yet...',
          style: TextTheme.of(context).bodyLarge,
        ),
      ],
    );
  }
}
