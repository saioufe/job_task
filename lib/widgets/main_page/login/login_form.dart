import 'package:flutter/material.dart';
import 'package:job_task/store/Login_store.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // final _key = GlobalKey<FormState>();
  PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParallaxRain(
        dropColors: [Colors.grey, Colors.white, Colors.black45],
        dropHeight: 6,
        trail: true,
        numberOfDrops: 50,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(2, 186, 156, 1).withOpacity(0.7),
                Color.fromRGBO(22, 158, 167, 1).withOpacity(0.9),
                Color.fromRGBO(32, 139, 173, 1),
                Color.fromRGBO(51, 108, 183, 1),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: LayoutBuilder(builder: (context, data) {
            var baseWidth = 750.0;

            if (data.maxWidth >= baseWidth) {
              baseWidth = data.maxWidth / 1.4;
            }

            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Image.asset(
                      "assets/images/Cyber.png",
                      width: 130,
                      height: 130,
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Expanded(
                      child: PageView(
                        allowImplicitScrolling: false,
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FirstPage(
                            pageController: controller,
                          ),
                          SecondPage(
                            pageController: controller,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({
    @required this.pageController,
  });

  final PageController pageController;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                  controller: userNameController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.person_add_outlined,
                        color: Colors.white,
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                  controller: passwordController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Did you forget your password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 14, color: Colors.white.withOpacity(0.5)),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  //Navigator.of(context)?.pushNamed(RouteGenerator.searchPage);
                  // pageController.animateToPage(0,
                  //     duration: Duration(milliseconds: 100),
                  //     curve: Curves.easeOut);
                  if (userNameController.text == "" ||
                      passwordController.text == "") {
                    key.currentState.showSnackBar(
                      SnackBar(
                        content: Text("please enter all the field"),
                      ),
                    );
                  } else {
                    if (userNameController.text != "task" ||
                        passwordController.text != "task1234") {
                      key.currentState.showSnackBar(
                        SnackBar(
                          content: Text("wrong password and username"),
                        ),
                      );
                    } else {
                      final loginStore =
                          Provider.of<LoginStore>(context, listen: false);
                      loginStore.login(
                          userNameController.text, passwordController.text);
                    }
                  }
                },
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  final PageController pageController;
  const FirstPage({
    this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Container(
                width: 120,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Container(
                width: 120,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "Register",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "Now! Quick login use your touch ID",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 17),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {
            pageController.animateToPage(1,
                duration: Duration(milliseconds: 100), curve: Curves.easeIn);
          },
          child: Icon(
            Icons.fingerprint,
            color: Colors.white,
            size: 110,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "USE TOUCH ID!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
