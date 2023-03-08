part of app_layout;

class AppContents extends StatelessWidget {
  const AppContents({
    Key? key,
    required this.child,
    this.fillRemaining = false,
  }) : super(key: key);

  final Widget child;
  final bool fillRemaining;

  @override
  Widget build(BuildContext context) {
    return fillRemaining
        ? SliverFillRemaining(child: child)
        : SliverToBoxAdapter(child: child);
  }
}
