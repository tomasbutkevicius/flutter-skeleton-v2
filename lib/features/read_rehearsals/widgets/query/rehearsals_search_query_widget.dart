import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/bloc/navigation/navigation_bloc.dart';
import 'package:skeleton_231210/features/read_rehearsals/bloc/search_rehearsals_bloc.dart';
import 'package:skeleton_231210/features/read_rehearsals/models/form_rehearsals_search_query_model.dart';
import 'package:skeleton_231210/widgets/proxy/input/proxy_input_text_widget.dart';

class RehearsalsSearchQueryWidget extends StatefulWidget {
  final FormRehearsalsSearchQueryModel formModel;

  const RehearsalsSearchQueryWidget({super.key, required this.formModel});

  @override
  State<RehearsalsSearchQueryWidget> createState() => _RehearsalsSearchQueryWidgetState();
}

class _RehearsalsSearchQueryWidgetState extends State<RehearsalsSearchQueryWidget> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    widget.formModel.persis();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmitted() {
    _removeFocus();
    context.read<SearchRehearsalsBloc>().add(SearchRehearsalsEventSearch(query: widget.formModel.nameValue ?? ''));
  }

  void _onChange() {
    context.read<SearchRehearsalsBloc>().add(SearchRehearsalsEventSearch(query: widget.formModel.nameValue ?? ''));
  }

  void _listener(BuildContext context, NavigationState state) => _removeFocus();

  void _removeFocus() {
    if (_focusNode.hasFocus) _focusNode.unfocus();
  }

  bool _listenWhen(NavigationState previousState, NavigationState state) => previousState.items != state.items;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: widget.formModel.form,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 46.0,
              ),
              child: ProxyInputTextWidget(
                keyboardType: TextInputType.visiblePassword,
                focusNode: _focusNode,
                onSubmitted: _onSubmitted,
                onChanged: (value) => _onChange(),
                textInputAction: TextInputAction.search,
                label: 'Search by title',
                formControlName: FormRehearsalsSearchQueryModel.fieldNameTitle,
                prefixLabel: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          BlocListener<NavigationBloc, NavigationState>(
            listener: _listener,
            listenWhen: _listenWhen,
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
