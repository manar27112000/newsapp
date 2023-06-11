import 'package:flutter/material.dart';

Widget buildArticleItem(article,context)=>Column(
  children: [
        Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(children: [
        Container(
          width: 120,height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              image:  DecorationImage(
                  image: NetworkImage('${article['urlToImage']}')
                  ,fit: BoxFit.cover)),

        ),

        const SizedBox(width:20),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}'
                    ,style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,),
                ),
                Text('${article['publishedAt']}',style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),)
              ],),
          ),
        ),


      ],

      ),
    ),

  ],
);



Widget mDivider()=> const Divider(
  color: Colors.grey, //color of divider
  height: 4, //height spacing of divider
  thickness: 1, //thickness of divier line
  // indent: 20, //spacing at the start of divider
  // endIndent: 20, //spacing at the end of divider
);

