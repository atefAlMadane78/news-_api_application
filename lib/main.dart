import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/models/cache_helper.dart';
import 'package:newsapp/models/dio_helper.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit..dart';
import 'home_layout.dart';

void main() async {
  //Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await cache_helper.init();

  bool isDark = cache_helper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
// /*@override
//   void didChangeDependencies() {
//     Provider.of<themeprovider>(context, listen:false ).getThemeMode();
//     super.didChangeDependencies();
//   }*/
class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp(this.isDark);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..changeTheme()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "PRo 5",
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              //dialogBackgroundColor: Colors.white70,
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  //color: Colors.white, //Color.fromARGB(255, 194, 86, 204),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange,
                  elevation: 20.0),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              // primarySwatch: Colors.deepOrange,
              // accentColor: const Color.fromARGB(255, 191, 250, 244),
              // canvasColor: Colors
              //     .white, // Color(0xFF90f7ec), //const Color.fromRGBO(255, 254, 229, 1),
              // buttonColor: const Color(0xFFce9ffc),
              // cardColor: Colors.white, //const Color(0xFF32ccbc),
              // shadowColor: Colors.white60,
              // //iconTheme:IconThemeData(color: Color.fromARGB(255, 148, 71, 155)) ,
              // textTheme: ThemeData.light().textTheme.copyWith(
              //         bodyText1: const TextStyle(
              //       color: Color.fromARGB(255, 47, 78, 94),
              //     )),
              // // scaffoldBackgroundColor: Colors.grey.shade100,
              // primarySwatch: Colors.pink,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739')),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark == true
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* @override
  void initState() {
    
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home_layout(),
    );
  }
}
