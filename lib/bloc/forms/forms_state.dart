part of 'forms_bloc.dart';

@immutable
class FormsState extends Equatable {
  final Map<String, FormGroup> items;

  const FormsState({
    this.items = const {},
  });

  FormsState copyWith({
    Map<String, FormGroup>? items,
  }) {
    return FormsState(
      items: items ?? this.items,
    );
  }

  FormsState setItem(String name, FormGroup item) {
    return copyWith(
      items: {}
        ..addAll(items)
        ..update(name, (_) => item, ifAbsent: () => item),
    );
  }

  FormsState? resetItem(String name) {
    return copyWith(
      items: {}..addAll(items)..remove(name)
    );
  }

  FormGroup? getItem(String name) => items[name];

  @override
  List<Object> get props => [items];
}
