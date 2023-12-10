import 'package:equatable/equatable.dart';

class RehearsalTeaserModel extends Equatable {
  final String title;
  final DateTime date;

  const RehearsalTeaserModel({
    required this.title,
    required this.date,
  });

  factory RehearsalTeaserModel.fromMap(Map<String, dynamic> map) {
    return RehearsalTeaserModel(
      title: map['title'] as String,
      date: map['date'] as DateTime,
    );
  }

  static List<RehearsalTeaserModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((e) => RehearsalTeaserModel.fromMap(e as Map<String, dynamic>)).toList();
  }

  @override
  List<Object?> get props => [
        title,
        date,
      ];

  static List<Map<String, dynamic>> mocksMapList =
      List.generate(10, (index) => {'title': 'title $index', 'date': DateTime.now()}).toList();
}
