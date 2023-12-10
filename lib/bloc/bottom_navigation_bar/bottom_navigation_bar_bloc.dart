import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(const BottomNavigationBarState()) {
    on<BottomNavigationBarEventChangeIndex>(_mapBottomNavigationBarEventChangeIndex);
    on<BottomNavigationBarEventInit>(_mapBottomNavigationBarEventInit);
  }

  void _mapBottomNavigationBarEventChangeIndex(
    BottomNavigationBarEventChangeIndex event,
    Emitter<BottomNavigationBarState> emit,
  ) {
    emit(
      state.copyWith(
        selectedIndex: event.index,
      ),
    );
  }

  void _mapBottomNavigationBarEventInit(
    BottomNavigationBarEventInit event,
    Emitter<BottomNavigationBarState> emit,
  ) {
    emit(const BottomNavigationBarState());
  }
}
