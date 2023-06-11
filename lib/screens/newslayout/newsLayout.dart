import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/newslayout/cubit.dart';
import 'package:news_app/screens/newslayout/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),

      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, NewsStates state) {  },
        builder: ( context, state) {
          var cubit =NewsCubit.get(context);
          return Scaffold(

            appBar: AppBar(

              title: const Text('News App'),
              actions: [
                IconButton(onPressed: (){},
                  icon: const Icon(Icons.search)),
                IconButton(onPressed:
                    () {
                  NewsCubit.get(context).changeMode();
                    }
                , icon: const Icon(
                  Icons.brightness_6_outlined
                ),)
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems
            ,currentIndex: cubit.currentIndex,
            onTap:(index) {
                cubit.changeBottomNavBar(index);
            },),
            body: cubit.screens[cubit.currentIndex],
          );

        },

          ),
    );
  }
}
