import 'package:flutter/material.dart';
/* import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart'; */

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

/* void main() {
  runApp(
    const MaterialApp(
      home: MathTest(),
    )
  );
}

Map getQuestions() {
  Map questions = {
    "1": {
      "question": "1 + 1 = 2",
      "answer": "Yes",
    },
    "2": {
      "question": "2 + 2 = 5",
      "answer": "No",
    },
    "3": {
      "question": "7 - 4 = 3",
      "answer": "Yes",
    },
    "4": {
      "question": "12 + 22 = 55",
      "answer": "No",
    },
    "5": {
      "question": "6 * 25 = 15",
      "answer": "No",
    },
    "6": {
      "question": "4 / 18 = 0.5",
      "answer": "No",
    },
    "7": {
      "question": "90 + 18 = 98",
      "answer": "No",
    },
    "8": {
      "question": "20 - 18 = 2",
      "answer": "Yes",
    },
    "9": {
      "question": "72 * 18 = 1296",
      "answer": "Yes",
    },
    "10": {
      "question": "128 / 2 * 3 + 10 - 77 = 125",
      "answer": "Yes",
    },
  };

  return questions;
}

class MathTest extends StatefulWidget {
  const MathTest({super.key});

  @override
  State<MathTest> createState() => MathState();
}

class MathState extends State<MathTest> {
  // List<String> questions = ["1 + 1 = 2", "2 + 2 = 5"];
  Map questions2 = getQuestions();

  int currentScore = 0;

  int currentQuestionID = 1;

  bool finished = false;

  void answerQuestion(String answer) {
    String currentAnswer = questions2["$currentQuestionID"]["answer"];

    if(answer.toLowerCase() == currentAnswer.toLowerCase()) {
      setState(() {
        currentScore += 1;

        currentQuestionID += 1;
      });
    }
    else {
      setState(() {
        currentQuestionID += 1;
      });
    }

    if(currentQuestionID > questions2.length) {
      finished = true;
    }
  }

  void playAgain() {
    setState(() {
      currentQuestionID = 1;

      currentScore = 0;

      finished = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Test'), centerTitle: true,
      ),

      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(!finished) Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text("Question $currentQuestionID of ${questions2.length}", style: const TextStyle(fontSize: 20)),
              ),
        
              if(!finished) Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: QuestionDisplay(currentQuestion: questions2["$currentQuestionID"]["question"]),
              ),
        
              if(!finished) Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  child: AnswerButton(onPressed: answerQuestion)
                ),
              ),
              
              if(finished) Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ScoreDisplay(score: currentScore, totalQuestions: questions2.length, playAgain: playAgain),
              ),
            ],
          ),
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
    return Text(currentQuestion, style: const TextStyle(fontSize: 48), textAlign: TextAlign.center);
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
          style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
          child: const Text('Yes', style: TextStyle(fontSize: 20)),
        ),
        
        const SizedBox(width: 16),

        ElevatedButton(
          onPressed: () => onPressed('No'),
          style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
          child: const Text('No', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}

class ScoreDisplay extends StatelessWidget {
  const ScoreDisplay({required this.score, required this.totalQuestions, required this.playAgain, super.key});

  final int score;

  final int totalQuestions;

  final VoidCallback playAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        score < 3 ? const Text('LMAO, are you okay (jus playing)?', style: TextStyle(fontSize: 20)) : const Text('Good Job', style: TextStyle(fontSize: 20)),

        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text('Score: $score out of $totalQuestions', style: const TextStyle(fontSize: 40)),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ElevatedButton(
            onPressed: playAgain,
            style: ElevatedButton.styleFrom(minimumSize: const Size(200, 40)),
            child: const Text('Play Again?', style: TextStyle(fontSize: 20)),
          ),
        )
      ],
    );
  }
} */

/* void main() {
  runApp(
    MaterialApp(
      home: Testing(),
    )
  );
}

class Testing extends StatelessWidget {
  Testing({super.key});

  final GlobalKey draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LongPressDraggable<Item>(
        data: item,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: ,
        child: MenuListItem(
          name: "Meat"
        ),
      ),
    );
  }
}

class Item {
  const Item({required this.name});

  final String name;
}

class MenuListItem extends StatelessWidget{
  const MenuListItem({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 10,
      child: Container(decoration: const BoxDecoration(color: Colors.black)),
    );
  }
} */

/* void main() {
  runApp(
    const MaterialApp(
      home: ExampleDragAndDrop(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

const List<Item> _items = [
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      title: Text(
        'Order Food',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 36,
              color: const Color(0xFFF64209),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildMenuList(),
              ),
              _buildPeopleRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
      itemBuilder: (context, index) {
        final item = _items[index];
        return _buildMenuItem(
          item: item,
        );
      },
    );
  }

  Widget _buildMenuItem({
    required Item item,
  }) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
    );
  }

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 20,
      ),
      child: Row(
        children: _people.map(_buildPersonWithDropZone).toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }
}

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    super.key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    final textColor = highlighted ? Colors.white : Colors.black;

    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8 : 4,
        borderRadius: BorderRadius.circular(22),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image(
                    image: customer.imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                customer.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: textColor,
                      fontWeight:
                          hasItems ? FontWeight.normal : FontWeight.bold,
                    ),
              ),
              Visibility(
                visible: hasItems,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      customer.formattedTotalItemPrice,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: textColor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  });

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.totalPriceCents,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;
  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
        items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
} */

/* void main() {
  runApp(
    const MaterialApp(
      home: AboutImage(),
    )
  );
}

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GTA 5'), centerTitle: true,
      ),

      body: Container(
        child: Center(
          child: Image.asset('assets/img1.png'),
        ),
      ),
    );
  }
} */

/* void main() {
  runApp(
    const MaterialApp(
      home: PageViewTutorial(),  
    )
  );
}

class PageViewTutorial extends StatelessWidget {
  const PageViewTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            
          },
          child: const Icon(Icons.arrow_back),
        ),

        title: const Text('GTA V'), centerTitle: true,
      ),

      body: PageView(
        controller: controller,
        children: <Widget>[
          Image.asset('assets/img1.png'),
          Image.asset('assets/img2.png'),
        ],
      ),
    );
  }
} */

// Photo View

/* void main() {
  runApp(
    const MaterialApp(
      home: PhotoViewGalleryApp(),
    )
  );
}

class PhotoViewApp extends StatelessWidget {
  const PhotoViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo View App"), centerTitle: true,
      ),

      body: Container(
        child: PhotoView(
          imageProvider: const AssetImage('assets/img1.png'),
        ),
      ),
    );
  }
}

class PhotoViewGalleryApp extends StatelessWidget {
  const PhotoViewGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Container(
      child: PhotoViewGallery(
        pageOptions: <PhotoViewGalleryPageOptions>[
          PhotoViewGalleryPageOptions(imageProvider: const AssetImage('assets/img1.png')),
          PhotoViewGalleryPageOptions(imageProvider: const AssetImage('assets/img2.png')),
        ],

        pageController: controller,
      )
    );
  }

} */

// attempt tic tac toe

void main() {
  runApp(
    const MaterialApp(
      home: TicTacToe(),
    )
  );
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _GameState();
}

class _GameState extends State<TicTacToe> {
  List<String> boxState = ['', '', '', '', '', '', '', '', ''];

  String currentTurn = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'), centerTitle: true,
      ),

      body: _buildGrid(context),
    );
  }

  Widget _buildGrid(BuildContext context) {
    int totalBoxes = 9;

    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: <Widget>[
          for(int i = 0; i < totalBoxes; ++i) ...[
            _buildBox(boxState[i], i),
          ],
        ],
      ),
    );
  }

  Widget _buildBox(String state, int id) {
    return GestureDetector(
      onTap: () {
        _boxPress(id);
      },

      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.black,
          ),
        ),

        child: Center(
          child: Text(
            state, 
            style: const TextStyle(fontSize: 40)),
        ),
      ),
    );
  }

  void _boxPress(int id) {
    setState(() {
      // print(currentTurn);

      boxState[id] = currentTurn;

      // currentTurn = currentTurn == 'X' ? 'O' : 'X';
      // currentTurn += 'O';
      _switchTurn();
    });
  }

  void _switchTurn() {
    currentTurn = currentTurn == 'X' ? 'O' : 'X';
  }
}