// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeControllerBase.isLoading'))
          .value;

  final _$_usersRequestAtom = Atom(name: '_HomeControllerBase._usersRequest');

  @override
  ObservableFuture<List<User>> get _usersRequest {
    _$_usersRequestAtom.reportRead();
    return super._usersRequest;
  }

  @override
  set _usersRequest(ObservableFuture<List<User>> value) {
    _$_usersRequestAtom.reportWrite(value, super._usersRequest, () {
      super._usersRequest = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void fetchUsers() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchUsers');
    try {
      return super.fetchUsers();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
