import 'package:job_task/repository/user_repository/username_password_repository.dart';
import 'package:mobx/mobx.dart';

part 'Login_store.g.dart';

enum StoreState { initial, loading, logedIn, logedOut }

class LoginStore extends _LoginStore with _$LoginStore {
  LoginStore(UsernamePasswordUserRepository userRepository)
      : super(userRepository);
}

abstract class _LoginStore with Store {
  final UsernamePasswordUserRepository _userRepository;

  _LoginStore(this._userRepository);

  @observable
  ObservableFuture<void> _loginFuture;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    //print(" this is the status state : " + _loginFuture.status.toString());
    if (_loginFuture == null || _loginFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _loginFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.logedIn;
  }

  @action
  Future login(String username, String password) async {
    try {
      errorMessage = null;
      _loginFuture =
          ObservableFuture(_userRepository.fakeLogIn(username, password));
    } catch (e) {
      errorMessage = "Couldn't LoggedIn. Is the device online?";
    }
  }

  @action
  void logOut() {
    try {
      print("logout");
      StoreState.logedOut;
      _loginFuture = ObservableFuture(_userRepository.logout());
    } catch (e) {
      errorMessage = "something Went Wrong!";
    }
  }
}
