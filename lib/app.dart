import 'package:falcons_task/presintation/controller/item_bloc.dart';
import 'package:falcons_task/presintation/screens/items/item_view.dart';
import 'package:falcons_task/presintation/screens/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/services/server_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ItemBloc(
                itemMasterUsecase: sl(),
                quantityUsecase: sl(),
                databaseHelper: sl())
              ..add(GetItemMasterEvent())
              ..add(GetItemQuantityEvent())),
      ],
      child: Sizer(builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ItemView(),
        );
      }),
    );
  }
}
