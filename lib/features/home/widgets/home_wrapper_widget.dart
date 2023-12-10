import 'package:skeleton_231210/features/read_rehearsals/widgets/rehearsals_wrapper_widget.dart';
import 'package:skeleton_231210/widgets/events/events_wrapper_widget.dart';
import 'package:skeleton_231210/widgets/profile/profile_wrapper_widget.dart';
import 'package:skeleton_231210/widgets/weeks_overview/weeks_overview_wrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/settings.dart';

class HomeWrapperWidget extends StatefulWidget {
  final int viewIndex;

  const HomeWrapperWidget({Key? key, required this.viewIndex}) : super(key: key);

  @override
  State<HomeWrapperWidget> createState() => _HomeWrapperWidgetState();
}

class _HomeWrapperWidgetState extends State<HomeWrapperWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.viewIndex);
  }

  @override
  void didUpdateWidget(HomeWrapperWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewIndex != widget.viewIndex) {
      _onActiveStepChanged();
    }
  }

  void _onActiveStepChanged() {
    _pageController.animateToPage(
      widget.viewIndex,
      curve: Curves.fastOutSlowIn,
      duration: SettingsConstants.duration300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        WeeksOverviewWrapperWidget(),
        RehearsalsWrapperWidget(),
        EventsWrapperWidget(),
        ProfileWrapperWidget(),
      ],
    );
  }
}
