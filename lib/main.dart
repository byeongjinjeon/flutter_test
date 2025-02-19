import 'package:flutter/material.dart';
import 'package:test1/BaseAppBar.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flut1ter Demo Home Page'),
      debugShowCheckedModeBanner: false, //debug 띠 제거
      routes: Routes.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<PlutoMenuItem> test_menus;
  final List<String> items = List.generate(9, (index) => "${index}");

  @override
  void initState() {
    super.initState();
    test_menus = _makeMenus(context);
  }

  List<PlutoMenuItem> _makeMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: '가로메뉴',
        //icon: Icons.home,
        onTap: () {
          Navigator.pushNamed(context, '/test');
        },
      ),
      PlutoMenuItem(
        title: '그리드뷰',
        onTap: () {
          Navigator.pushNamed(context, '/gridview');
        },
      ),
      PlutoMenuItem(
        title: 'Carousel',
        onTap: () {
          Navigator.pushNamed(context, '/carousel');
        },
      ),
      PlutoMenuItem(
        title: 'FullScreen',
        onTap: () {
          Navigator.pushNamed(context, '/timeline');
        },
      ),
      PlutoMenuItem(
        title: 'homepage',
        onTap: () {
          Navigator.pushNamed(context, '/homepage');
        },
      ),
    ];
  }

  final postList = [
    {"title": "Title 1", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 2", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 3", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 4", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 5", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 6", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 7", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
    {"title": "Title 8", "imageURL": "https://picsum.photos/500"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(),
      body: ListView(
        children: [
          PlutoMenuBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            borderColor: const Color.fromARGB(255, 255, 255, 255),
            itemStyle: const PlutoMenuItemStyle(
              activatedColor: Color.fromARGB(255, 0, 0, 0),
              indicatorColor: Colors.deepOrange,
              textStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              iconColor: Color.fromARGB(255, 0, 0, 0),
              moreIconColor: Color.fromARGB(255, 0, 0, 0),
            ),
            mode: PlutoMenuBarMode.hover,
            menus: test_menus,
          ),
          postContainer(postList),
        ],
      ),
    );
  }

  Widget postContainer(List<Map<String, String>> postList) {
    return Container(
      height: 600, // 고정된 높이 설정
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 6,
        ),
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: const Text('test'),
              //subtitle: Text('Item'),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(postList[index]["imageURL"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
