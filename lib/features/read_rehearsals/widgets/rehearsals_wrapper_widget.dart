import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/features/read_rehearsals/bloc/search_rehearsals_bloc.dart';
import 'package:skeleton_231210/features/read_rehearsals/models/form_rehearsals_search_query_model.dart';
import 'package:skeleton_231210/features/read_rehearsals/widgets/list/rehearsals_list_widget.dart';
import 'package:skeleton_231210/features/read_rehearsals/widgets/query/rehearsals_search_query_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_231210/models/request_status_model.dart';
import 'package:skeleton_231210/utilities/status_utilities.dart';
import 'package:skeleton_231210/widgets/common/loading_indicator_widget.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';

class RehearsalsWrapperWidget extends StatefulWidget {
  const RehearsalsWrapperWidget({super.key});

  @override
  State<RehearsalsWrapperWidget> createState() => _RehearsalsWrapperWidgetState();
}

class _RehearsalsWrapperWidgetState extends State<RehearsalsWrapperWidget> {
  late final FormRehearsalsSearchQueryModel _formModel;

  @override
  void initState() {
    super.initState();
    _formModel = FormRehearsalsSearchQueryModel.fromState(context);

    context.read<SearchRehearsalsBloc>().add(SearchRehearsalsEventInitialise());
  }

  void _listener(BuildContext context, SearchRehearsalsState state) {
    StatusUtilities.handleStatusMessage(context, state.status);
  }

  bool _listenWhen(SearchRehearsalsState previousState, SearchRehearsalsState state) =>
      previousState.status != state.status;

  Widget _builder(BuildContext context, SearchRehearsalsState state) {
    if (state.status.value == RequestStatusValue.fetching) {
      return const LoadingIndicatorWidget();
    }
    return RehearsalsListWidget(items: state.result);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RehearsalsSearchQueryWidget(formModel: _formModel),
        Expanded(
          child: BlocConsumer<SearchRehearsalsBloc, SearchRehearsalsState>(
            builder: _builder,
            listener: _listener,
            listenWhen: _listenWhen,
          ),
        ),
      ],
    );
  }
}
