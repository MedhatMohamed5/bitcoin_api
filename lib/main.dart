import 'package:bitcoin_api/bloc/bloc_observer.dart';
import 'package:bitcoin_api/bloc/cubit/app_cubit.dart';
import 'package:bitcoin_api/network/dio_helper.dart';
import 'package:bitcoin_api/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bitcoin Price',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Bitcoin Price'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return HomeScreen(title: title);
  }
}
