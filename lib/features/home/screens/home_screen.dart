import 'package:skeleton_231210/constants/icons.dart';
import 'package:skeleton_231210/widgets/common/local_image_wrapper_widget.dart';
import 'package:skeleton_231210/features/home/widgets/home_wrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/bloc/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  bool _buildWhen(BottomNavigationBarState previous, BottomNavigationBarState current) =>
      previous.selectedIndex != current.selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: LocalImageWrapperWidget(
              width: MediaQuery.of(context).size.width * 0.7,
              image: IconsConstants.flameball,
            ),
          ),
        ),
        BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
          buildWhen: _buildWhen,
          builder: (context, state) {
            return HomeWrapperWidget(viewIndex: state.selectedIndex);
          },
        ),
      ],
    );
  }
}
