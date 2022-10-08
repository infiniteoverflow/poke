import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:poke/models/recipe.dart';
import 'package:poke/network/api_service.dart';

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

class _CharacterState extends State<Character>
    with SingleTickerProviderStateMixin {
  ValueNotifier happy = ValueNotifier(false);
  ValueNotifier rotate = ValueNotifier(false);
  late final AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: 'character${widget.index}',
              child: ValueListenableBuilder(
                valueListenable: happy,
                builder: (context, value, _) => ValueListenableBuilder(
                    valueListenable: rotate,
                    builder: (context, value, _) {
                      return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            if (rotate.value) {
                              return RotateWidget(
                                controller: _controller,
                                happy: happy,
                                widget: widget,
                              );
                            }
                            return Image.asset(
                              happy.value
                                  ? 'assets/joey2.webp'
                                  : 'assets/${widget.imgUrl}',
                              fit: BoxFit.cover,
                            );
                          });
                    }),
              ),
            ),
          ),
          getWidget(widget.name),
        ],
      ),
    );
  }

  Widget getWidget(String name) {
    switch (name) {
      case 'joey':
        return getJoey();
      case 'phoebe':
        return getPhoebe();
      case 'rachel':
        return getRachel();
      case 'ross':
        return getRoss();
      case 'chandler':
        return getChandler();
      case 'monica':
        return getMonica();
      default:
        return getJoey();
    }
  }

  Widget getJoey() {
    Future future = Future.delayed(const Duration(seconds: 1));
    return Expanded(
        child: Center(
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              happy.value = true;
            });
            String data = snapshot.data.toString();
            return Center(
              child: Image.asset(
                data == 'pizza' ? 'assets/pizza.webp' : 'assets/sandwich.webp',
                fit: BoxFit.cover,
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
  }

  Widget getRachel() {
    List images = [
      's1.jpg',
      's2.jpg',
      's3.jpg',
      's4.jpg',
      's5.jpg',
      's6.jpg',
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageWidget(images: images, index: index);
        },
      ),
    );
  }

  Widget getRoss() {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            rotate.value = !rotate.value;
          },
          child: Image.asset('assets/sandwich.webp'),
        ),
      ),
    );
  }

  Widget getChandler() {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            rotate.value = !rotate.value;
          },
          child: Image.asset('assets/sandwich.webp'),
        ),
      ),
    );
  }

  Widget getMonica() {
    return Expanded(
      child: Center(
        child: FutureBuilder(
            future: getRecipes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RecipeData> recipes = snapshot.data as List<RecipeData>;
                return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    Recipe? recipe = recipes[index].recipe;
                    return GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  recipe?.images?.lARGE?.url ?? '',
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 120,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recipe?.label ?? '',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Calories : ${recipe?.calories?.toInt().toString() ?? '0'}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Future<List<RecipeData>> getRecipes() async {
    List ids = [
      '1b9794df9596fb8a060fb52029db63b0',
      '60cdcf4d0ec60fd96bd491db8eba10bc',
      '68794b61476d390d2e4fca5880875c7a',
    ];

    List<RecipeData> recipeData = [];

    for (int i = 0; i < ids.length; i++) {
      RecipeData recipeDa = await ApiService.fetchRecipe(id: ids[i]);
      recipeData.add(recipeDa);
    }

    return recipeData;
  }

  Widget getPhoebe() {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            rotate.value = !rotate.value;
          },
          child: Image.asset('assets/sandwich.webp'),
        ),
      ),
    );
  }
}

class RotateWidget extends StatefulWidget {
  const RotateWidget({
    Key? key,
    required AnimationController controller,
    required this.happy,
    required this.widget,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final ValueNotifier happy;
  final Character widget;

  @override
  State<RotateWidget> createState() => _RotateWidgetState();
}

class _RotateWidgetState extends State<RotateWidget> {
  @override
  void initState() {
    print('RotateWidget initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: widget._controller.value * 2 * math.pi,
      child: Image.asset(
        widget.happy.value
            ? 'assets/joey2.webp'
            : 'assets/${widget.widget.imgUrl}',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  final List images;
  final int index;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Image.asset(
      'assets/${widget.images[widget.index]}',
      fit: BoxFit.cover,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    print('Image at index ${widget.index} disposed');
    super.dispose();
  }
}
