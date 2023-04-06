import 'package:flutter/material.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      body: Center(
        child: SizedBox.shrink(),
      ),
    );
  }
}
