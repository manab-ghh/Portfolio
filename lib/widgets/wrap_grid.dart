import 'package:flutter/material.dart';

/// Lays [children] in a responsive grid with [cols] columns.
/// On 1 column it stacks vertically; on 2+ it uses Rows.
class WrapGrid extends StatelessWidget {
  const WrapGrid({
    super.key,
    required this.cols,
    required this.spacing,
    required this.children,
  });

  final int cols;
  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (cols <= 1) {
      return Column(
        children: children
            .map(
              (c) => Padding(
                padding: EdgeInsets.only(bottom: spacing),
                child: c,
              ),
            )
            .toList(),
      );
    }

    final rows = <Widget>[];
    for (int i = 0; i < children.length; i += cols) {
      final rowChildren = <Widget>[];
      for (int j = 0; j < cols; j++) {
        final idx = i + j;
        if (idx < children.length) {
          rowChildren.add(Expanded(child: children[idx]));
        } else {
          rowChildren.add(const Expanded(child: SizedBox()));
        }
        if (j < cols - 1) rowChildren.add(SizedBox(width: spacing));
      }
      rows.add(
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: rowChildren),
      );
      if (i + cols < children.length) rows.add(SizedBox(height: spacing));
    }
    return Column(children: rows);
  }
}
