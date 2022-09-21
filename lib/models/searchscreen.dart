import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit..dart';
import 'package:newsapp/cubit/states.dart';

class searchscreen extends StatelessWidget {
  var serachController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: serachController,
                  keyboardType: TextInputType.text,
                  // onChanged: (value) {
                  //   NewsCubit.get(context).getSearch(value);
                  //   //
                  // },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Serach Must not be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    //   prefix:const Icon(Icons.lock),
                    labelText: 'Search',
                    prefix: Icon(Icons.search),
                  ),
                ),
              ),
              RaisedButton(
                child:const Text('Search'),
                onPressed: () {
                  print(serachController.text);
                  NewsCubit.get(context).getSearch(serachController.text);
                },
              ),
              // TextFormField(
              //   controller: serachController,
              //   onChanged: (val){
              //     print(val);
              //   },
              // ),
              //IconButton(onPressed: (){NewsCubit.get(context).getSearch(s);}, icon:Icon( Icons.abc_outlined)),
              Expanded(
                child: list.length > 0
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${list[index]['imageUrl']}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 120.0,
                                    child: Column(
                                      //  mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${list[index]['name']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${list[index]['pubDate']}",
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: double.maxFinite,
                            height: 1.0,
                            color: Colors.grey[200],
                          );
                        },
                        itemCount: list.length)
                    :  Center(child: Container(
                      child:const Text("No Data Founded "),
                    )) ,//Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        );
      },
    );
  }
}
