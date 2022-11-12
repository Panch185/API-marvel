import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialThemeData = ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 14, 39, 59)),
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.blue,
        canvasColor: Colors.blue,
        backgroundColor: Colors.red,
        textTheme:
            const TextTheme().copyWith(bodyText1: const TextTheme().bodyText2),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blue));

    const cupertinoTheme = CupertinoThemeData(
        primaryColor: Colors.blue,
        barBackgroundColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white);

    return PlatformApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(
        title: 'AVENGERS',
      ),
      material: (_, __) => MaterialAppData(theme: materialThemeData),
      cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          widget.title,
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
      ),
      material: (_, __) => MaterialScaffoldData(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/мстители.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FirstScreen(),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(144, 24, 23, 23),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: PlatformTextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              material: (_, __) => MaterialTextFieldData(
                decoration: const InputDecoration(
                  labelText: 'User name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                style: const TextStyle(color: Colors.white),
                placeholder: 'User name',
                placeholderStyle: const TextStyle(color: Colors.white),
                obscureText: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PlatformTextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              material: (_, __) => MaterialTextFieldData(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                style: const TextStyle(color: Colors.white),
                placeholder: 'Password',
                placeholderStyle: const TextStyle(color: Colors.white),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PlatformElevatedButton(
              color: const Color.fromARGB(255, 197, 69, 60),
              onPressed: () {
                openURL();
              },
              child: const Text('Login'),
              material: (_, __) => MaterialElevatedButtonData(),
              cupertino: (_, __) => CupertinoElevatedButtonData(),
            ),
          ),
        ],
      ),
    );
  }

  openURL() {
    String urll =
        'https://www.google.com/search?q=%D0%BC%D1%81%D1%82%D0%B8%D1%82%D0%B5%D0%BB%D0%B8&bih=767&biw=1600&hl=ru&sxsrf=ALiCzsa59zON_E12hFpn4sqyUei0zATz6Q%3A1659274962610&ei=0obmYrrjJJODxc8Pl7qFgA0&ved=0ahUKEwi6lOz1oKP5AhWTQfEDHRddAdAQ4dUDCA4&uact=5&oq=%D0%BC%D1%81%D1%82%D0%B8%D1%82%D0%B5%D0%BB%D0%B8&gs_lcp=Cgdnd3Mtd2l6EAMyBAgjECcyBAguEEMyDgguEIAEELEDEIMBENQCMgsILhCABBCxAxCDATIOCC4QgAQQsQMQgwEQ1AIyDgguEIAEELEDEIMBENQCMgQIABBDMggIABCABBCxAzIICAAQgAQQsQMyCwgAEIAEELEDEIMBOgcIABBHELADOgcIABCwAxBDOg8ILhDUAhDIAxCwAxBDGAE6DAguEMgDELADEEMYAUoECEEYAEoECEYYAVC_BFi_BGDyGWgBcAF4AIABQ4gBQ5IBATGYAQCgAQHIARHAAQHaAQYIARABGAg&sclient=gws-wiz';
    // ignore: deprecated_member_use
    launch(urll);
  }
}
