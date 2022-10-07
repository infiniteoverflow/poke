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
  ValueNotifier happy = ValueNotifier(false);

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
                builder: (context, value, _) => Image.asset(
                  happy.value ? 'assets/joey2.webp' : 'assets/${widget.imgUrl}',
                  fit: BoxFit.cover,
                ),
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
      case 'rachel':
        return getRachel();
      case 'ross':
      case 'chandler':
      case 'monica':
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
          return ImageWidget(images: images,index:index);
        },
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

class _ImageWidgetState extends State<ImageWidget>  with AutomaticKeepAliveClientMixin{
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
