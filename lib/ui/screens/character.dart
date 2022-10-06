import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  final String imgUrl;
  final int index;
  final String name;
  const Character({
    Key? key,
    required this.imgUrl,
    required this.index,
    required this.name,
  }) : super(key: key);

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: 'character${widget.index}',
              child: Image.asset(
                'assets/${widget.imgUrl}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          getWidget(widget.name),
        ],
      ),
    );
  }

  Widget getWidget(String name) {
    switch(name) {
      case 'joey':
        return getJoey();
      case 'phoebe':
      case 'rachel':
      case 'ross':
      case 'chandler':
      case 'monica':
      default:
        return getJoey();
    }
  }

  Widget getJoey() {
    Future future = Future.delayed(const Duration(seconds: 10), () => 1);
    return Expanded(
        child: Center(
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
  }
}
