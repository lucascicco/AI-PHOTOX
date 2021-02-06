// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guessing_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GuessingController = BindInject(
  (i) => GuessingController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GuessingController on _GuessingControllerBase, Store {
  Computed<int> _$listFalseComputed;

  @override
  int get listFalse =>
      (_$listFalseComputed ??= Computed<int>(() => super.listFalse,
              name: '_GuessingControllerBase.listFalse'))
          .value;
  Computed<int> _$listTrueComputed;

  @override
  int get listTrue =>
      (_$listTrueComputed ??= Computed<int>(() => super.listTrue,
              name: '_GuessingControllerBase.listTrue'))
          .value;

  final _$listBoolsAtom = Atom(name: '_GuessingControllerBase.listBools');

  @override
  ObservableList<bool> get listBools {
    _$listBoolsAtom.reportRead();
    return super.listBools;
  }

  @override
  set listBools(ObservableList<bool> value) {
    _$listBoolsAtom.reportWrite(value, super.listBools, () {
      super.listBools = value;
    });
  }

  final _$_GuessingControllerBaseActionController =
      ActionController(name: '_GuessingControllerBase');

  @override
  void addBoolean(bool boolean) {
    final _$actionInfo = _$_GuessingControllerBaseActionController.startAction(
        name: '_GuessingControllerBase.addBoolean');
    try {
      return super.addBoolean(boolean);
    } finally {
      _$_GuessingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listBools: ${listBools},
listFalse: ${listFalse},
listTrue: ${listTrue}
    ''';
  }
}
