part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {
  const BottomNavigationBarEvent();
}

@immutable
class BottomNavigationBarEventChangeIndex extends BottomNavigationBarEvent {
  final int index;

  const BottomNavigationBarEventChangeIndex({
    required this.index,
  });
}

@immutable
class BottomNavigationBarEventInit extends BottomNavigationBarEvent {}