// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SharedController on _SharedControllerBase, Store {
  Computed<int> _$listFalseComputed;

  @override
  int get listFalse =>
      (_$listFalseComputed ??= Computed<int>(() => super.listFalse,
              name: '_sharedControllerBase.listFalse'))
          .value;
  Computed<int> _$listTrueComputed;

  @override
  int get listTrue =>
      (_$listTrueComputed ??= Computed<int>(() => super.listTrue,
              name: '_sharedControllerBase.listTrue'))
          .value;
  Computed<String> _$getPathComputed;

  @override
  String get getPath =>
      (_$getPathComputed ??= Computed<String>(() => super.getPath,
              name: '_sharedControllerBase.getPath'))
          .value;

  final _$currentImageAtom = Atom(name: '_sharedControllerBase.currentImage');

  @override
  PickedFile get currentImage {
    _$currentImageAtom.reportRead();
    return super.currentImage;
  }

  @override
  set currentImage(PickedFile value) {
    _$currentImageAtom.reportWrite(value, super.currentImage, () {
      super.currentImage = value;
    });
  }

  final _$listBoolsAtom = Atom(name: '_sharedControllerBase.listBools');

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

  final _$_sharedControllerBaseActionController =
      ActionController(name: '_sharedControllerBase');

  @override
  void updateCurrentImage(PickedFile image) {
    final _$actionInfo = _$_sharedControllerBaseActionController.startAction(
        name: '_sharedControllerBase.updateCurrentImage');
    try {
      return super.updateCurrentImage(image);
    } finally {
      _$_sharedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBoolean(bool boolean) {
    final _$actionInfo = _$_sharedControllerBaseActionController.startAction(
        name: '_sharedControllerBase.addBoolean');
    try {
      return super.addBoolean(boolean);
    } finally {
      _$_sharedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentImage: ${currentImage},
listBools: ${listBools},
listFalse: ${listFalse},
listTrue: ${listTrue},
getPath: ${getPath}
    ''';
  }
}
