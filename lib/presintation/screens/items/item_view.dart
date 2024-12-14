import 'package:falcons_task/app.dart';
import 'package:falcons_task/presintation/controller/item_bloc.dart';
import 'package:falcons_task/presintation/screens/items/item_content.dart';
import 'package:falcons_task/presintation/screens/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../coman_widgets/text.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    ItemBloc bloc = context.read()..add(FetchDataEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          'All Items',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: RefreshIndicator(
          backgroundColor: Colors.grey[200],
          color: Colors.blue,
          onRefresh: () async {
            bloc.fetchedData = [];
            bloc.add(GetItemMasterEvent());
            bloc.add(GetItemQuantityEvent());
            bloc.add(FetchDataEvent());
          },
          child: const ItemContent()),
    );
  }
}
