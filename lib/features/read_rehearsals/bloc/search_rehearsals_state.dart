part of 'search_rehearsals_bloc.dart';

@immutable
class SearchRehearsalsState extends Equatable {
  final RequestStatus status;
  final List<RehearsalTeaserModel> result;

  const SearchRehearsalsState({
    this.status = RequestStatus.init,
    this.result = const [],
  });

  SearchRehearsalsState copyWith({
    RequestStatus? status,
    List<RehearsalTeaserModel>? result,
  }) {
    return SearchRehearsalsState(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [status, result];

  static const init = SearchRehearsalsState();
}
