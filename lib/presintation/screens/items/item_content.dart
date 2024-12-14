import 'package:falcons_task/presintation/coman_widgets/text.dart';
import 'package:falcons_task/presintation/controller/item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    ItemBloc bloc = context.read();
    ItemBloc blocListener = context.watch();
    return bloc.fetchedData.isEmpty
        ? const Center(
          child: CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.grey,
            ),
        )
        : SingleChildScrollView(
            child: GridView.builder(
            padding: EdgeInsets.all(3.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5 / 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) {
               String price=bloc.fetchedData[index]['lsprice'];
               String quantity=bloc.fetchedData[index]['qty'].toString();
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 7,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                      child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                // fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/image/shopping.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextWidget(
                            text: bloc.fetchedData[index]['name'] ?? "yousef",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            maxLines: 1,
                            textColor: Colors.black,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 2,),
                              const Icon(
                                Icons.price_change_rounded,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextWidget(
                                text:price,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/image/box.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextWidget(
                                text:
                                    quantity,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                textColor:bloc.fetchedData[index]['qty']<5 ?Colors.red:Colors.black ,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              );
            },
            itemCount: bloc.fetchedData.length,
          ));
  }
}
