import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/screens/newslayout/cubit.dart';
import 'package:news_app/screens/newslayout/newsLayout.dart';
import 'package:news_app/screens/newslayout/states.dart';

import 'blocObserver.dart';
import 'cachHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= AppBlocObserver();
  DioHelper.init();
 await ChacheHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        builder: ( context, state) {  return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:ThemeData(
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:Colors.black
                  )
              ),

              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light

                  ),titleTextStyle: TextStyle(color: Colors.white,
                  fontSize: 30,fontWeight: FontWeight.bold),
                  backgroundColor: Colors.brown
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.brown,
                elevation: 20,
              )
          ) ,
          darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black12,
              appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light

                  ),titleTextStyle: TextStyle(color: Colors.white,
                  fontSize: 30,fontWeight: FontWeight.bold),
                  backgroundColor: Colors.black12
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black12,
                elevation: 20,
              )
              ,textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              )
          )

          ),
          themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: const NewsLayout(),
        );},
        listener: ( context,  state) {  },

      ),
    );
  }
}



