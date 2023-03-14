part of app_layout;

class AppBody extends StatelessWidget {
  const AppBody({
    Key? key,
    this.topBar = const AppTopBar(),
    required this.contents,
  }) : super(key: key);

  final AppTopBar topBar;
  final AppContents contents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          topBar,
          contents,
        ],
      ),
    );
  }
}
