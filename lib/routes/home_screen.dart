
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
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void loginTransition() {
    if (tabController.index != 1) tabController.animateTo(1);
  }

  void logoutTransition() {
    if (tabController.index != 0) tabController.animateTo(0);
  }

  String phoneNumber = "0";
  @override
  Widget build(BuildContext context) {
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

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [],
    );
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_loginStore.state) {
            case StoreState.initial:
            // return buildInitialInput();
            case StoreState.loading:
            // return buildLoading();
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
