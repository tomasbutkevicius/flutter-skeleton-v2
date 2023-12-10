import 'package:skeleton_231210/models/navigation/navigation_params_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class NavigationItem extends Equatable {
  final Function(NavigationParams? params) body;
  final Function(NavigationParams? params) appBar;
  final Function(NavigationParams? params) bottomNavigationBar;


  const NavigationItem({
    required this.body,
    required this.appBar,
    required this.bottomNavigationBar,
  });

  @override
  List<Object> get props => [body, appBar, bottomNavigationBar];
}
