part of 'bottom_navigation_bar_bloc.dart';

@immutable
class BottomNavigationBarState extends Equatable {
  final int selectedIndex;

  const BottomNavigationBarState({
    this.selectedIndex = 0,
  });

  BottomNavigationBarState copyWith({
    int? selectedIndex,
  }) {
    return BottomNavigationBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [selectedIndex];
}
