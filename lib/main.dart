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

/* void main() {
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
} */

// GESTURESSSSSSSSS

/* void main() {
  runApp(
    const MaterialApp(
      title: 'OMO',
      home: Scaffold(
        body: Center(
          child: MyCounter(),
        )
      )
    ),
  );
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was Tapped!');
      },

      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {

      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),

        const SizedBox(
          width: 16,
        ),

        Text('Count: $_counter'),
      ],
    );
  }
} */

// Assignment, Seperate Concerns

/* void main() {
  runApp(
    const MaterialApp(
      title: 'OMO',
      home: MyNewApp(),
    )
  );
}

class MyNewApp extends StatelessWidget {
  const MyNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyNewCounter(),
      ),
    );
  }
}

class MyNewCounter extends StatefulWidget {
  const MyNewCounter({super.key});

  @override
  State<MyNewCounter> createState() => _MyNewCounterState();
}

class _MyNewCounterState extends State<MyNewCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        CounterButton(onPressed: _incrementCounter),
        const SizedBox(width: 16),
        CounterDisplay(text: _counter),
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.text, super.key});

  final int text;

  @override
  Widget build(BuildContext context) {
    return Text('Count is: $text');
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
} */

// Routing

/* void main() {
  runApp(
    const MaterialApp(
      home: RoutingBasics(),
    )
  );
}

class RoutingBasics extends StatelessWidget {
  const RoutingBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'), centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
             context, MaterialPageRoute(builder: (context) => const SecondRoute()) 
            );
          },
          child: const Text('Next Route'),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'), centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        )
      ),

      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: "OMO",
        child: Icon(Icons.add),
      ),
    );
  }
} */

// todo yourself

void main() {
  runApp(
    const MaterialApp(
      home: MathTest(),
    )
  );
}

class MathTest extends StatefulWidget {
  const MathTest({super.key});

  @override
  State<MathTest> createState() => MathState();
}

class MathState extends State<MathTest> {
  List<String> questions = ["1 + 1 = 2", "2 + 2 = 5"];

  int currentQuestionID = 0;

  void answerQuestion(String answer) {
    if(answer == "Yes") {
      setState(() {
        currentQuestionID += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Test'), centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 50),
                child: QuestionDisplay(currentQuestion: questions[currentQuestionID]),
            ),

            SizedBox(
              child: AnswerButton(onPressed: answerQuestion)
            ),
          ],
        ),  
      ),
    );
  }
}

class QuestionDisplay extends StatelessWidget {
  const QuestionDisplay({required this.currentQuestion, super.key});

  final String currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Text(currentQuestion, style: const TextStyle(fontSize: 40));
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.onPressed(String str), super.key});

  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onPressed('Yes'),
          child: const Text('Yes'),
        ),
        
        const SizedBox(width: 16),

        ElevatedButton(
          onPressed: () => onPressed('No'),
          child: const Text('No'),
        ),
      ],
    );
  }
}