import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/constants/routes.dart';
import 'package:skeleton_231210/models/navigation/navigation_params_model.dart';
import 'package:collection/collection.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<NavigationEventPush>(_mapNavigationEventPush);
    on<NavigationEventReset>(_mapNavigationEventReset);
    on<NavigationEventGoBack>(_mapNavigationEventGoBack);
    on<NavigationEventReplace>(_mapNavigationEventReplace);
    on<NavigationEventGoBackTo>(_mapNavigationEventGoBackTo);
  }

  void _mapNavigationEventGoBackTo(NavigationEventGoBackTo event, Emitter<NavigationState> emit) {
    final NavigationStateItem? item =
        state.items.lastWhereOrNull((NavigationStateItem item) => item.path == event.path);

    if (item == null) {
      return;
    }

    emit(
      state.copyWith(
        items: [...state.items]
          ..removeRange(state.items.lastIndexOf(item) + 1, state.items.length),
      ),
    );
  }

  void _mapNavigationEventPush(NavigationEventPush event, Emitter<NavigationState> emit) {
    emit(
      state.copyWith(
        items: [...state.items]
          ..add(
            NavigationStateItem(
              path: event.path,
              params: event.params,
            ),
          ),
      ),
    );
  }

  void _mapNavigationEventReplace(NavigationEventReplace event, Emitter<NavigationState> emit) {
    emit(
      state.copyWith(
        items: [...state.items]
          ..removeLast()
          ..add(
            NavigationStateItem(
              path: event.path,
              params: event.params,
            ),
          ),
      ),
    );
  }

  void _mapNavigationEventGoBack(NavigationEventGoBack event, Emitter<NavigationState> emit) {
    if (state.items.length < 2) {
      return;
    }

    emit(
      state.copyWith(
        items: [...state.items]
          ..removeLast(),
      ),
    );
  }

  void _mapNavigationEventReset(NavigationEventReset event, Emitter<NavigationState> emit) {
    emit(const NavigationState());
  }
}
