import 'package:falcons_task/app.dart';
import 'package:falcons_task/presintation/controller/item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    ItemBloc itemBloc = context.read();
    ItemBloc itemBlocListener = context.watch();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 6.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: TextFormField(
              onChanged: (val) {
                itemBloc.add(SearchItemEvent());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey[200]!)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue[200],
                ),
                hintText: 'Search By Item Name Or Number',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey[200]!)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey[200]!)),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              return Expanded(
                child: state is SearchItemLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        color: Colors.blue,
                      ))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return itemBloc.searchItemList.isEmpty
                              ? Center(
                                  child: Text(
                                    'NO Item',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.blue[300]),
                                  ),
                                )
                              : Container(
                                  height: 10.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 2.w),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: const AssetImage(
                                              'assets/image/shopping.png'),
                                          radius: 25.sp,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          ' yousef',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp,
                                              color: Colors.blue[300]),
                                        ),
                                        const Spacer(),
                                        Text(
                                          ' yousef',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.sp,
                                              color: Colors.blue[300]),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 1.h,
                          );
                        },
                        itemCount: itemBloc.searchItemList.length,
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
