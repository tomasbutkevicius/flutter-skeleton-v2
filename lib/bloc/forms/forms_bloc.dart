import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'forms_event.dart';

part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<FormsEventSet>(_mapFormsEventSet);
    on<FormsEventResetByName>(_mapFormsEventResetByName);
    on<FormsEventReset>(_mapFormsEventReset);
  }

  void _mapFormsEventReset(FormsEventReset event, Emitter<FormsState> emit) {
    emit(const FormsState());
  }

  void _mapFormsEventResetByName(FormsEventResetByName event, Emitter<FormsState> emit) {
    FormsState? newState = state.resetItem(event.name);
    if (newState == null) {
      return;
    }

    emit(newState);
  }

  void _mapFormsEventSet(FormsEventSet event, Emitter<FormsState> emit) {
    emit(
      state.setItem(event.name, event.formGroup),
    );
  }
}
