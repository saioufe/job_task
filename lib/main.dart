import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:job_task/providers/theme_manager.dart';
import 'package:job_task/repository/user_repository/username_password_repository.dart';
import 'package:provider/provider.dart';
import 'localization/localization_delegate.dart';
import 'routes.dart';

void main() {
  runApp(
    Provider<UsernamePasswordUserRepository>(
      create: (_) => UsernamePasswordUserRepository(),
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
}

// {
//     @Override
//     public void onAuthStateChanged(@NonNull FirebaseAuth auth) {
//         FirebaseUser firebaseUser = auth.getCurrentUser();
//         if (firebaseUser != null) {
//             //Do what you need to do
//         }
//     }
// };
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp();
  @override
  Widget build(BuildContext context) {
    final repository = context.select((UsernamePasswordUserRepository r) => r);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: ThemeManager(),
          ),
        ],
        child: Consumer<ThemeManager>(
          builder: (ctx, theme, _) {
            return MaterialApp(
              title: 'Job Task',
              theme: theme.themeData,
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) => "Job Task",
              initialRoute: RouteGenerator.workPage,
              onGenerateRoute: RouteGenerator.generateRoute,
              navigatorKey: RouteGenerator.key,
              localizationsDelegates: [
                const AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale.fromSubtags(languageCode: "ar"),
                Locale.fromSubtags(languageCode: "en"),
              ],
            );
          },
        ));
  }
}
