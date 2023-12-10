import 'package:skeleton_231210/features/read_rehearsals/models/rehearsal_teaser_model.dart';

class SearchRehearsalsRepository {
  Future<List<RehearsalTeaserModel>> search(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    List<RehearsalTeaserModel> rehearsals = RehearsalTeaserModel.fromMapList(RehearsalTeaserModel.mocksMapList);

    if (query.trim().isEmpty) return rehearsals;

    return rehearsals.where((element) => element.title.contains(query)).toList();
  }
}
