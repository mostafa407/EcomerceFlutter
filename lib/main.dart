import 'package:ecomerce/controller/login_cubit/login_cubit.dart';
import 'package:ecomerce/core/constants/color_manger.dart';
import 'package:ecomerce/core/helpers/cash_helper/cash_helper.dart';
import 'package:ecomerce/core/helpers/dio_helper/dio_helper.dart';
import 'package:ecomerce/core/observer/bloc_observer.dart';
import 'package:ecomerce/views/screen/layout/layout.dart';
import 'package:ecomerce/views/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  fixedSize: Size(MediaQuery
                      .of(context)
                      .size
                      .width, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
          scaffoldBackgroundColor: ColorManger.backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CashHelper.getString(key: CashHelper.tokenKey)!=null
        ? LayoutScreen():
        BlocProvider(create:
        (BuildContext context)
    {
      return LoginCubit();
    },
    child: const LoginScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
