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
  final PageController _pageController = PageController(initialPage: 0);

  void goToPage(int pageNum, PageController pageController) {
    pageController.animateToPage(
      pageNum,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  List<PlutoMenuItem> test_menus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: '뉴스',
        id: 'Select1',
        onTap: () => goToPage(0, _pageController),
      ),
      PlutoMenuItem(
        title: '금융',
        id: 'Select2',
        onTap: () => goToPage(1, _pageController),
      ),
      PlutoMenuItem(
        title: '스포츠',
        id: 'Select3',
        onTap: () => goToPage(2, _pageController),
      ),
      PlutoMenuItem(
        title: '연예',
        id: 'Select4',
        onTap: () => goToPage(3, _pageController),
      ),
      PlutoMenuItem(
        title: '쇼핑',
        id: 'Select5',
        onTap: () => goToPage(4, _pageController),
      ),
      PlutoMenuItem(
        title: '메일',
        id: 'Select6',
        onTap: () => goToPage(5, _pageController),
      ),
    ];
  }

  Widget _pageView() {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      reverse: false,
      onPageChanged: (index) {
        print('test $index');
      },

      children: [
        Container(
          color: const Color.fromARGB(255, 255, 233, 231),
          child: Text(
            'Page 1',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
        Container(
          color: Colors.green,
          child: Text(
            'Page 2',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Text(
            'Page 3',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Text(
            'Page 4',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Text(
            'Page 5',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          child: Text(
            'Page 6',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
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
              enableSelectedTopMenu: true,
            ),

            mode: PlutoMenuBarMode.hover,
            menus: test_menus(context),
          ),
          Expanded(child: _pageView()),
        ],
      ),
    );
  }
}
