import 'package:flutter/material.dart';
import 'package:skeleton_231210/features/read_rehearsals/models/rehearsal_teaser_model.dart';
import 'package:skeleton_231210/features/read_rehearsals/widgets/list/rehearsals_list_empty_widget.dart';
import 'package:skeleton_231210/features/read_rehearsals/widgets/list/reherasals_list_item_widget.dart';

class RehearsalsListWidget extends StatelessWidget {
  final List<RehearsalTeaserModel> items;

  const RehearsalsListWidget({super.key, required this.items});

  Widget _itemBuilder(BuildContext context, int index) {
    return RehearsalsListItemWidget(
      item: items[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const RehearsalsListEmptyWidget();
    }

    return ListView.builder(
      itemCount: items.length,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: _itemBuilder,
    );
  }
}
