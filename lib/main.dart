import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //animation controller
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(
        reverse: true,
      );
    hoverAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.02),
    ).animate(animationController);
    super.initState();
  }

  //List of products
  List<Products> products = [
    Products(
        color: const Color(0xff000000),
        path: "assets/images/7499af44-9d7a-489c-80f0-51f7799289e4_720x.webp"),
    Products(
        color: const Color(0xfffcecd0),
        path: "assets/images/eb8e0fbd-c412-48b3-9c91-5b49ddf35800_720x.webp"),
    Products(
        color: const Color(0xffb6d7e4),
        path: "assets/images/ae22e3a6-9590-401a-94f6-d8ecf42b4932_720x.webp"),
  ];

  int currentIndex = 0;

  //constants colors
  Color black = const Color(0xff000000);
  Color blue = const Color(0xffb6d7e4);
  Color cream = const Color(0xfffcecd0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff292929),
        body: Center(
          child: Column(
            children: [
              SlideTransition(
                position: hoverAnimation,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: Image.asset(
                    products[currentIndex].path,
                    key: ValueKey<int>(currentIndex),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'BOAT ROCKERZ 450R',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Century Gothic",
                  fontSize: 34.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'Bluetooth Headphones',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28.0,
                  fontFamily: "Century Gothic",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(products.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = index;
                      }),
                      child: CircleAvatar(
                        backgroundColor: products[index].color,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                '20000 FCFA',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28.0,
                  fontFamily: "Century Gothic",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Container(
                  key: ValueKey<int>(currentIndex),
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: products[currentIndex].color,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "ACHETER",
                      style: TextStyle(
                        color: currentIndex != 1 ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontFamily: "Century Gothic",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Products {
  final Color color;
  final String path;

  Products({
    required this.color,
    required this.path,
  });
}
