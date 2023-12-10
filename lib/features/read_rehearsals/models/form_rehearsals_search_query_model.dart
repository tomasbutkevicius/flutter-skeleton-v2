import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/bloc/forms/forms_bloc.dart';

class FormRehearsalsSearchQueryModel {
  static const String formName = 'searchRehearsalQuery';
  static const String fieldNameTitle = 'title';

  final FormsBloc bloc;
  final FormGroup form;

  const FormRehearsalsSearchQueryModel({
    required this.bloc,
    required this.form,
  });

  factory FormRehearsalsSearchQueryModel.fromState(BuildContext context) {
    final FormsBloc bloc = context.read<FormsBloc>();
    final FormGroup? form = bloc.state.getItem(formName);
    return form == null ? FormRehearsalsSearchQueryModel.init(bloc) : FormRehearsalsSearchQueryModel(form: form, bloc: bloc);
  }

  factory FormRehearsalsSearchQueryModel.init(FormsBloc bloc) {
    return FormRehearsalsSearchQueryModel(
      bloc: bloc,
      form: fb.group({
        fieldNameTitle: FormControl<String>(),
      }),
    );
  }

  void persis() => bloc.add(FormsEventSet(formName, form));

  String? get nameValue => form.value[fieldNameTitle] as String?;
}
