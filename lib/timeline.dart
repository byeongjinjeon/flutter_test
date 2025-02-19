import 'package:flutter/material.dart';
import 'package:test1/BaseAppBar.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  List<Color> colors = [Colors.blue, Colors.yellow, Colors.teal, Colors.red];

  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([Colors.blue, Colors.yellow, Colors.teal, Colors.red]);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      //scrollDirection: Axis.horizontal,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder:
          (context, index) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/600/1000"),
                fit: BoxFit.cover,
              ),
            ),
            // color: colors[index],
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); //이전페이지 이동
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 146, 146, 146),
                        ),
                        iconColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                //Center(child: Text("Screen $index")),
              ],
            ),
          ),
    );
  }
}
