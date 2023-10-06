import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const Center(
//       child: Text(
//         'Hello World',
//         textDirection: TextDirection.ltr,
//       ),
//     )
//   );
// }

// create your own widget either stateful or stateless

/* class MyAppStatusBar extends StatelessWidget {
  // pass super to constructor
  const MyAppStatusBar({required this.title, super.key});

  // fields in a widget are always final

  final Widget title;

  // a widget must have a build implementation
  // the override is used to override the super method
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 56,
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),

          Expanded(
            child: Center(
              child: title,
            ),
          ),

          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      height: 64,
      child: const Row(
        children: [
          IconButton(
            icon: Icon(Icons.account_box),
            tooltip: 'Account',
            onPressed: null,
          ),

          Expanded(
            child: Center()
          ),

          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            onPressed: null,
          ),

          Expanded(
            child: Center()
          ),

          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: null,
          ),
        ],
      ),
    );
  }


}

// whatever the fuck scaffold is

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears

    return const Material(
      // column is a vertical, linear layout
      child: Column(
        children: [
          MyAppStatusBar(
            title: Text(
              'My Own Widget',
              // style: Theme.of(context).primaryTextTheme.titleLarge,
              style: TextStyle(color: Colors.black),
            ),
          ),

          Expanded(
            child: Center(
              child: Text('Hello World')
            ),
          ),

          BottomBar()
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: "OMO",
      home: SafeArea(
        child: MyScaffold(),
      ),
    )
  );
} */

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation Menu',
          onPressed: null,
        ),

        title: const Text('The Hell is this!'), centerTitle: true,

        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),

      body: const Center(
        child: Text('Hello World'),
      ),

      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        onPressed: null,
        child: Icon(Icons.add)
      ),
    );
  }
}

// GESTURESSSSSSSSS

