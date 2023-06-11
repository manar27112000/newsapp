import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components.dart';
import '../newslayout/cubit.dart';
import '../newslayout/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: ( context,  state) {  },
      builder: ( context, state) {
        var cubit =NewsCubit.get(context).science;
        return ConditionalBuilder(
          condition: cubit.length>0,
          builder:(context)=> ListView.separated(
            itemBuilder: (context,index)=>
                buildArticleItem(cubit[index],context),
            separatorBuilder:(context,index)=>mDivider()
            ,
            itemCount: cubit.length,),
          fallback: ( context) =>Center(
            child: CircularProgressIndicator(),
          ),

        );

      },

    );

  }
}
