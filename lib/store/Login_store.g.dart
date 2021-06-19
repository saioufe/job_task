// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_LoginStore.state'))
      .value;

  final _$_loginFutureAtom = Atom(name: '_LoginStore._loginFuture');

  @override
  ObservableFuture<void> get _loginFuture {
    _$_loginFutureAtom.reportRead();
    return super._loginFuture;
  }

  @override
  set _loginFuture(ObservableFuture<void> value) {
    _$_loginFutureAtom.reportWrite(value, super._loginFuture, () {
      super._loginFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<dynamic> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
