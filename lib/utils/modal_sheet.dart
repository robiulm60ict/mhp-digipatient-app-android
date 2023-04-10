
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getDiseaseModalSheet(BuildContext context, {String name = ""}){
  return showModalBottomSheet(context: context,
      builder: (context) => SizedBox(
        height: 400.h,
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () => context.router.pop(), icon: Icon(Icons.dangerous, color: Colors.red, size: 30.h,),),
              ),
              SizedBox(height: 20.h,),
              Text(name),
            ],
          ),
        ),
      ),);
}