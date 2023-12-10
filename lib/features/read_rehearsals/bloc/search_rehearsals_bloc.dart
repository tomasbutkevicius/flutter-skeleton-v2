import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skeleton_231210/features/read_rehearsals/bloc/search_rehearsals_repository.dart';
import 'package:skeleton_231210/features/read_rehearsals/models/rehearsal_teaser_model.dart';
import 'package:skeleton_231210/models/request_status_model.dart';

part 'search_rehearsals_event.dart';

part 'search_rehearsals_state.dart';

class SearchRehearsalsBloc extends Bloc<SearchRehearsalsEvent, SearchRehearsalsState> {
  final SearchRehearsalsRepository repository = SearchRehearsalsRepository();

  SearchRehearsalsBloc() : super(const SearchRehearsalsState()) {
    on<SearchRehearsalsEventInitialise>(_onInit);
    on<SearchRehearsalsEventSearch>(_onSearch);
  }

  void _onInit(SearchRehearsalsEventInitialise event, Emitter<SearchRehearsalsState> emit) {
    if (state.status.value == RequestStatusValue.init) {
      add(SearchRehearsalsEventSearch());
    }
  }

  Future _onSearch(SearchRehearsalsEventSearch event, Emitter<SearchRehearsalsState> emit) async {
    await _handleError(event, emit, () async {
      emit(const SearchRehearsalsState(status: RequestStatus.fetching));

      List<RehearsalTeaserModel> result = await repository.search(event.query);

      emit(SearchRehearsalsState(status: RequestStatus.done, result: result));
    });
  }

  Future _handleError(SearchRehearsalsEventSearch event, Emitter<SearchRehearsalsState> emit, Function action) async {
    try {
      await action();
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.errorDio(e),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: RequestStatus.error(),
      ));
    }
  }
}
