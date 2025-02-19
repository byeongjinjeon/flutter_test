import 'package:flutter/material.dart';
import '/til_button.dart';
import 'package:test1/gridview_wedget.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class Naver extends StatefulWidget {
  Naver({Key? key}) : super(key: key);

  @override
  _NaverState createState() => _NaverState();
}

class _NaverState extends State<Naver> {
  final List<Widget> list = [
    TilButton(title: 'GridView', routeName: '/gridview2'),
  ];

  List<PlutoMenuItem> test_menus(BuildContext context) {
    return [
      PlutoMenuItem(title: '뉴스'),
      PlutoMenuItem(title: '금융'),
      PlutoMenuItem(title: '스포츠'),
      PlutoMenuItem(title: '연예'),
      PlutoMenuItem(title: '쇼핑'),
      PlutoMenuItem(title: '메일'),
      PlutoMenuItem(title: '카페'),
      PlutoMenuItem(title: '블로그'),
      PlutoMenuItem(title: '지식iN'),
      // PlutoMenuItem(
      //   title: 'naver',
      //   onTap: () {
      //     Navigator.pushNamed(context, '/naver');
      //   },
      // ),
    ];
  }

  int _itemCount = 4;
  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'N',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 215, 90),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: '검색 키워드를 입력해주세요',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 153, 153, 153),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Color.fromARGB(255, 0, 215, 90),
            ),
          ],
        ),
      ),
      body: Column(
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
            menus: test_menus(context),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: _itemCount,
              onPageChanged: _onPageChanged,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://picsum.photos/600/1000"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
