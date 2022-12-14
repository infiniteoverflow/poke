import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/network/api_service.dart';
import 'package:poke/ui/screens/character.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  List friends = [
    ['Ross Geller', 'ross.jpeg'],
    ['Monica Geller', 'monica.jpeg'],
    ['Rachel Green', 'rachel.jpeg'],
    ['Chandler Bing', 'chandler.webp'],
    ['Joey Tribbiani', 'joey1.webp'],
    ['Phoebe Buffay', 'pheobe.webp'],
    ['Ross Geller', 'ross2.jpeg'],
    ['Monica Geller', 'monica2.jpeg'],
    ['Rachel Green', 'rachel2.jpeg'],
    ['Chandler Bing', 'chandler2.jpeg'],
    ['Joey Tribbiani', 'joey2.webp'],
    ['Phoebe Buffay', 'pheobe2.webp'],
  ];

  bool happy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: friends.take(6).length,
                itemBuilder: (context, index) {
                  int dummy = index;
                  if (happy) index = index + 6;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Character(
                            imgUrl: friends[index][1],
                            index: dummy,
                            name: friends[index][0]
                                .toString()
                                .toLowerCase()
                                .split(' ')[0],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: SizedBox(
                        child: Hero(
                          tag: 'character$dummy',
                          child: Image.asset(
                            'assets/${friends[index][1]}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  happy = !happy;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/friends.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
