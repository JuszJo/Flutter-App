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
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            title: Text("Sticky Headers"), centerTitle: true,
          ),
    
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      color: Colors.grey,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Section $index', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    )
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}