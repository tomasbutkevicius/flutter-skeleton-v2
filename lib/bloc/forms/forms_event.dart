part of 'forms_bloc.dart';

@immutable
abstract class FormsEvent {
  const FormsEvent();
}

@immutable
class FormsEventSet extends FormsEvent {
  final String name;
  final FormGroup formGroup;

  const FormsEventSet(this.name, this.formGroup);
}


@immutable
class FormsEventResetByName extends FormsEvent {
  final String name;

  const FormsEventResetByName({required this.name});
}

@immutable
class FormsEventReset extends FormsEvent {}
