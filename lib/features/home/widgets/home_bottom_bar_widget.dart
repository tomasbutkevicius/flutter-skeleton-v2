import 'package:flutter/material.dart';
import 'package:skeleton_231210/widgets/bottom_bar/bottom_bar_widget.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomBarWidget(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
