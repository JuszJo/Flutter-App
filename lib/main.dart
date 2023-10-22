import "package:flutter/material.dart";

void main() {
  runApp(
    const MaterialApp(
      home: MyScrollView(),
    )
  );
}

class MyScrollView extends StatelessWidget {
  const MyScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          title: Text("Sticky Headers")
        )
      ],
    );
  }
}