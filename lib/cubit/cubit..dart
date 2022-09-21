import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/models/cache_helper.dart';
import 'package:newsapp/screen/business_screen.dart';
import 'package:newsapp/screen/science_screen.dart';
import 'package:newsapp/screen/settinf_screen.dart';
import 'package:newsapp/screen/sport_screen.dart';
import 'package:newsapp/models/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIniatialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  List<Widget> screens = [
    business_screen(),
    sport_screen(),
    science_screen(),
    //setting_screen()
  ];

  void changeIndex(index) {
    currentIndex = index;
    // if( index ==0 ){
    //   getBusiness();
    // }
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusineesLoadingStates());

    if (business.length == 0) {
      dioHelper.getData(
        //https://api.goperigon.com/v1/all?
        url: 'v1/all', //'v2/everything',
        query: {
          // 'domains':'wsj.com',
          // 'apiKey':'API_KEY'
          'country': 'br',
          'category': 'Business',
          'apiKey': '85c1684e-e4cc-4bfb-8ab0-050d967411a3',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(value.data['articles']);
        emit(NewsBusineesSuccessStates());
      }).catchError((error) {
        print("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr Businesssssssssss" +
            error.toString()); // video 3 min 13
        emit(NewsBusineesErrorStates(error.toString()));
      });
    } else {
      emit(NewsBusineesSuccessStates());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingStates());

    if (sports.length == 0) {
      dioHelper.getData(
        //https://api.goperigon.com/v1/all?
        url: 'v1/all', //'v2/everything',
        query: {
          // 'domains':'wsj.com',
          // 'apiKey':'API_KEY'
          'country': 'br',
          'category': 'Sports',
          'apiKey': '85c1684e-e4cc-4bfb-8ab0-050d967411a3',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(value.data['articles']);
        emit(NewsSportsSuccessStates());
      }).catchError((error) {
        print("errorrrrrrrrrrrrrSportssssssssssss " +
            error.toString()); // video 3 min 13
        emit(NewsSportsErrorStates(error.toString()));
      });
    } else {
      emit(NewsSportsSuccessStates());
    }
  }

  List<dynamic> scinces = [];

  void getScience() {
    emit(NewsGetSciencesLoadingStates());

    if (scinces.length == 0) {
      dioHelper.getData(
        //https://api.goperigon.com/v1/all?
        url: 'v1/all', //'v2/everything',
        query: {
          // 'domains':'wsj.com',
          // 'apiKey':'API_KEY'
          'country': 'br',
          'category': 'Science',
          'apiKey': '85c1684e-e4cc-4bfb-8ab0-050d967411a3',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        scinces = value.data['articles'];
        print(value.data['articles']);
        emit(NewsSciencesSuccessStates());
      }).catchError((error) {
        print("errorrrrrrscineceeeeeeeeeee " +
            error.toString()); // video 3 min 13
        emit(NewsSciencesErrorStates(error.toString()));
      });
    } else {
      emit(NewsSciencesSuccessStates());
    }
  }

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;

    cache_helper.putBoolean(key: 'isDark', value: isDark).then((value) {
      print(isDark);
      emit(NewsThemeStates());
    });
  }

  var search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates());

    search = [];
    print("from cubit search");
   
      dioHelper.getData(
        //https://api.goperigon.com/v1/journalists?
        url: 'v1/journalists', //'v2/everything',
        query: {
          // 'domains':'wsj.com',
          // 'apiKey':'API_KEY'
          'q': '$value',
          'apiKey': '85c1684e-e4cc-4bfb-8ab0-050d967411a3',
        },
      ).then((value) {
        search = value.data['results'];
        print(search[0]['title']);
        emit(NewsSearchSuccessStates());
      }).catchError((error) {
        print("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr " +
            error.toString()); // video 3 min 13
        emit(NewsSearchErrorStates(error.toString()));
      });
   
  }
}
