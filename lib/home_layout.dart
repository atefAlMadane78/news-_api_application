import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit..dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/models/cache_helper.dart';
import 'package:newsapp/models/dio_helper.dart';

import 'models/searchscreen.dart';

class home_layout extends StatefulWidget {
  const home_layout({Key? key}) : super(key: key);

  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  @override
  Widget build(BuildContext context) {
    // bool isDark = false;
    return
        //  BlocProvider( // delete this widget and put ..getBusiness(),  in main after changedtheme
        //   create:  (context) => NewsCubit()..getBusiness(),
        //   child:
        BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: const Text("News App"),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>searchscreen()));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.brightness_4_outlined),
                      onPressed: () {
                        NewsCubit.get(context).changeTheme();
                        // setState(()async {
                        //   isDark = !isDark;
                        //   await cache_helper.putBoolean(key: 'isDark', value: isDark);
                        //    print(isDark);
                        // });
                      },
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  items: cubit.bottomItems,
                ),
                body: cubit.screens[cubit.currentIndex],
                // floatingActionButton: FloatingActionButton(
                //   child: const Icon(Icons.add),
                //   onPressed: () {
                //     print("wessssssssssel");

                //   },
                // ),
              );
            });
    // );
  }
}
