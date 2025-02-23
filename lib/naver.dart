import 'package:flutter/material.dart';
import '/til_button.dart';
import 'package:test1/gridview_wedget.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

import "package:test1/GridViewPage.dart";

class Naver extends StatefulWidget {
  Naver({Key? key}) : super(key: key);

  @override
  _NaverState createState() => _NaverState();
}

class _NaverState extends State<Naver> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0; // 현재 활성화된 페이지 인덱스

  late List<PlutoMenuItem> menus;

  @override
  void initState() {
    super.initState();
    menus = _buildMenus();
  }

  // 페이지 이동 함수
  void goToPage(int pageNum) {
    setState(() {
      _currentPageIndex = pageNum; // 현재 페이지 인덱스 업데이트
    });
    _pageController.animateToPage(
      pageNum,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  // PlutoMenuBar 메뉴 생성
  List<PlutoMenuItem> _buildMenus() {
    return [
      PlutoMenuItem(title: '뉴스', id: 'Select0', onTap: () => _onMenuTap(0)),
      PlutoMenuItem(title: '금융', id: 'Select1', onTap: () => _onMenuTap(1)),
      PlutoMenuItem(title: '스포츠', id: 'Select2', onTap: () => _onMenuTap(2)),
      PlutoMenuItem(title: '연예', id: 'Select3', onTap: () => _onMenuTap(3)),
      PlutoMenuItem(title: '쇼핑', id: 'Select4', onTap: () => _onMenuTap(4)),
      PlutoMenuItem(title: '메일', id: 'Select5', onTap: () => _onMenuTap(5)),
    ];
  }

  // PageView 위젯
  Widget _pageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 233, 231),
          child: Gridviewpage(),
        ),
        Container(color: Colors.green, child: const Center(child: Text('금융'))),
        Container(
          color: Colors.orange,
          child: const Center(child: Text('스포츠')),
        ),
        Container(color: Colors.blue, child: const Center(child: Text('연예'))),
        Container(color: Colors.purple, child: const Center(child: Text('쇼핑'))),
        Container(color: Colors.yellow, child: const Center(child: Text('메일'))),
      ],
    );
  }

  void _onMenuTap(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex; // 현재 선택된 메뉴 업데이트
    });
    print('change : $pageIndex');
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex; // 현재 페이지 인덱스 업데이트
    });
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
            itemStyle: PlutoMenuItemStyle(
              enableSelectedTopMenu: true,
              activatedColor: Colors.deepOrange, // 활성화된 메뉴 색상
              textStyle: const TextStyle(color: Colors.black), // 기본 텍스트 색상
            ),

            mode: PlutoMenuBarMode.tap,
            menus: _buildMenus(),
          ),
          Expanded(child: _pageView()),
        ],
      ),
    );
  }
}
