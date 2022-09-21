import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit..dart';
import '../cubit/states.dart';
import '../models/web_view.dart';

class sport_screen extends StatelessWidget {
  const sport_screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit, NewsStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        var list = NewsCubit.get(context).sports;
        return list.length > 0
            ? ListView.separated(
              physics:const BouncingScrollPhysics(),
                itemBuilder: (context , index){
                return  InkWell(
                  onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => web_view(
                                    url: list[index]['url'],
                                  )));
                                 // print("gooooooooooooooooooooooooooooooooooo");
                    },
                  child: Padding(
                      padding:const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                  image: NetworkImage('${list[index]['imageUrl']}'),
                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Expanded(
                            child: Container(
                              height: 120.0,
                              child: Column(
                              //  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("${list[index]['title']}",
                      style:Theme.of(context).textTheme.bodyText1,
                      // const TextStyle(
                      //   fontSize: 18.0,
                      //   fontWeight: FontWeight.w600
                      // ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis ,),
                    ),
                    Text("${list[index]['pubDate']}",
                    style:const TextStyle(
                      color: Colors.grey
                    ),)
                  ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                );
                },
                separatorBuilder: (context , index){
                 return Container(
                      width: double.maxFinite,
                      height: 1.0,
                      color: Colors.grey[200],
                    );
                },
                itemCount: 10)
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}