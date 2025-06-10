// A Flutter 3D Carousel Slider
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Carousel3D(),
  ));
}

class Carousel3D extends StatefulWidget {
  const Carousel3D({Key? key}) : super(key: key);

  @override
  State<Carousel3D> createState() => _Carousel3DState();
}

class _Carousel3DState extends State<Carousel3D>
    with SingleTickerProviderStateMixin {
  PageController controller = PageController(viewportFraction: 0.5);
  double currentPage = 0.0;
  late AnimationController _tapController;
  late Animation<double> _tapAnimation;
  int tappedIndex = -1;

  final List<String> images = [
    'https://picsum.photos/id/1011/600/400',
    'https://picsum.photos/id/1021/600/400',
    'https://picsum.photos/id/1031/600/400',
    'https://picsum.photos/id/1041/600/400',
    'https://picsum.photos/id/1051/600/400',
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0.0;
      });
    });

    _tapController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _tapAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _tapController, curve: Curves.easeInOut),
    );
    _tapController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _tapController.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _tapController.dispose();
    super.dispose();
  }

  Widget _buildCard(int index, double scale, double rotationY, double screenWidth) {
    double cardWidth = screenWidth * 0.55;
    double cardHeight = cardWidth * 1.4;

    return GestureDetector(
      onTap: () {
        if (index == currentPage.round()) {
          setState(() {
            tappedIndex = index;
          });
          _tapController.forward();
        }
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotationY),
        alignment: Alignment.center,
        child: Container(
          height: scale * cardHeight,
          width: scale * cardWidth,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 3,
                offset: const Offset(0, 8),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '3D Carousel Slider',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000000),
              Color(0xFF1C1C1C),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.55,
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                double delta = index - currentPage;
                double scale = 1 - delta.abs() * 0.2;
                double rotationY = delta * 0.6;

                bool isCenter = index == currentPage.round();
                bool isTapped = tappedIndex == index;

                return Center(
                  child: isCenter && isTapped
                      ? AnimatedBuilder(
                          animation: _tapAnimation,
                          builder: (context, child) {
                            double finalScale = scale * _tapAnimation.value;
                            return _buildCard(index, finalScale, rotationY, screenWidth);
                          },
                        )
                      : _buildCard(index, scale, rotationY, screenWidth),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
