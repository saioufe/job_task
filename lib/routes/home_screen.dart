import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:job_task/routes/work_screen.dart';
import 'package:job_task/store/Login_store.dart';
import 'package:job_task/widgets/login_page.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
    _disposers ??= [
      reaction(
        (_) => _loginStore.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_loginStore.state) {
            case StoreState.initial:
              return LoginPage();
            case StoreState.loading:
            //   return LoginPage();
            case StoreState.logedIn:
              return WorkScreen();
              break;
            case StoreState.logedOut:
              return LoginPage();
              break;
          }
        },
      ),
    );
  }
}
