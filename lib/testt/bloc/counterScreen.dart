
import 'package:cubiterasoft/testt/bloc/Counter_bloc/Counter_cubit.dart';
import 'package:cubiterasoft/testt/bloc/Counter_bloc/Counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocConsumer<Counter_cubit, Counter_states>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                print("Our State Now is $state");
                return Text("number now is  ${Counter_cubit.get_object(context).counter.toString()}");
              },
            ),


            SizedBox(height: 20,),

            Container(
              color: Colors.black,
              child: TextButton(
              onPressed: () {
                Counter_cubit.get_object(context).Increment();
              }, child: Text("Add Btn")
              ),
            ),

            SizedBox(height: 10,),

            Container(
              color: Colors.black,
              child: TextButton(
                  onPressed: () {
                    Counter_cubit.get_object(context).Minus();
                  }, child: Text("Minus Btn")
              ),
            ),

            SizedBox(height: 10,),

            Container(
              color: Colors.black,
              child: TextButton(
                  onPressed: () {
                    Counter_cubit.get_object(context).reset();
                  }, child: Text("Reset Btn")
              ),
            )
          ],
        )
      ),
    );
  }

}