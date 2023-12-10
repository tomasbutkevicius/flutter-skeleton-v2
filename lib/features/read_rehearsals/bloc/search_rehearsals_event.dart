part of 'search_rehearsals_bloc.dart';

@immutable
abstract class SearchRehearsalsEvent {}

@immutable
class SearchRehearsalsEventInitialise extends SearchRehearsalsEvent {}

@immutable
class SearchRehearsalsEventSearch extends SearchRehearsalsEvent {
  final String query;

  SearchRehearsalsEventSearch({this.query = ''});
}
