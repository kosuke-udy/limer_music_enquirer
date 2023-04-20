import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class Grid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const Grid({
    Key? key,
    required this.children,
    required this.crossAxisCount,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dividedChildren =
        List<List<Widget>>.filled(children.length ~/ crossAxisCount + 1, []);

    children.mapWithIndex((t, index) {
      dividedChildren[index ~/ crossAxisCount].add(t);
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: dividedChildren.mapWithIndex(
        (t, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index != dividedChildren.length - 1 ? mainAxisSpacing : 0,
            ),
            child: Row(
              children: t
                  .mapWithIndex(
                    (u, index) => Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                          right: index != t.length - 1 ? crossAxisSpacing : 0,
                        ),
                        child: u,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ).toList(),
    );
  }
}
