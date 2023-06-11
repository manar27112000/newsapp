import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/business/businessScreen.dart';
import 'package:news_app/screens/newslayout/states.dart';
import 'package:news_app/screens/science/science.dart';
import 'package:news_app/screens/settings/settings.dart';
import 'package:news_app/screens/sports/sports.dart';

import '../../cachHelper.dart';
import '../../dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

List<BottomNavigationBarItem> bottomItems =[
  const BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'Business'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings'
  ),
];
List<Widget>   screens =[const BusinessScreen(),
const SportsScreen(),
const ScienceScreen(),
const SettingsScreen()];
void changeBottomNavBar(int index){

  currentIndex=index;
  if(index==1) {getSports(); }

  if(index==2) {getScience(); }

  emit(NewsBottomState());
}
///////////////////////////////////////////////////////////
List<dynamic> business=[];
void getBusiness(){
emit(NewsLoadingState());
  DioHelper.getData(
    url:'v2/top-headlines',
    query:{
      'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
    },
  ).then((value){
    business =value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
  }).catchError((error){print(error.toString());
  emit(NewsGetBusinessErrorState(error.toString()));});
}
/////////////////////////////////////////////////////////////
  List<dynamic> sports=[];
  void getSports(){
    emit(NewsLoadingState());

    if(sports.length==0){
      DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        },
      ).then((value){
        sports =value.data['articles'];
        print(sports[0]['title']);


        emit(NewsGetSportsSuccessState());
      }).catchError((error){print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));});
    }else{        emit(NewsGetSportsSuccessState());
    }





  }


  List<dynamic> science=[];
  void getScience(){

    if(science.length==0){
      emit(NewsLoadingState());
      DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        },
      ).then((value){
        science =value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));});
    }
    else{   emit(NewsGetScienceSuccessState());
    }


  }

  bool isDark=false;
  ThemeMode appMode= ThemeMode.dark;
  void changeMode(){
   isDark=!isDark;
   ChacheHelper.putData('isDark',isDark).then((value) => emit(ModeState()));
   }}


