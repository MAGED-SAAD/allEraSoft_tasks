import 'package:cubiterasoft/Pokemon/bloc/PokemonCubit.dart';
import 'package:cubiterasoft/Pokemon/bloc/PokemonCubitStates.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/EndPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Dark ToDo App/View_Model/Utils/Utils/appColors.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 20, 146),
        elevation: 0,
        title: myText(
          text: PokemonCubit.getObject(context)
                  .PokemonApi
                  ?.pokemon![
                      PokemonCubit.getObject(context).currentSelectedIndex!]
                  .name ??
              "Un Known",
          color: AppColors.whitee,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 54, 20, 146),
            Color.fromARGB(255, 76, 171, 248),
          ],
        )),
        child: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 40, left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.whitee),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Transform.translate(
                    offset: const Offset(0, -65),
                    child: Hero(
                      tag: PokemonCubit.getObject(context).currentSelectedIndex.toString(),
                      child: Image.network(PokemonCubit.getObject(context)
                              .PokemonApi
                              ?.pokemon![PokemonCubit.getObject(context)
                                  .currentSelectedIndex!]
                              .img ??
                          "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png"),
                    )),
                Transform.translate(
                  offset: const Offset(0, -60),
                  child: myText(
                    text: PokemonCubit.getObject(context)
                            .PokemonApi
                            ?.pokemon![PokemonCubit.getObject(context)
                                .currentSelectedIndex!]
                            .name ??
                        "Un Known",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 5,
                    
                  ),
                ),
               
               
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText(text: "Height: ",fontSize: 18,fontWeight: FontWeight.w500),
                      myText(
                        text: PokemonCubit.getObject(context)
                                .PokemonApi
                                ?.pokemon![PokemonCubit.getObject(context)
                                    .currentSelectedIndex!]
                                .height ??
                            "Un Known",fontSize: 18,fontWeight: FontWeight.w400
                      ),
                    ],
                  ),
                ),
               
               const SizedBox(height: 15,),
               
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText(text: "Weight: ",fontSize: 18,fontWeight: FontWeight.w500),
                      myText(
                        text: PokemonCubit.getObject(context)
                                .PokemonApi
                                ?.pokemon![PokemonCubit.getObject(context)
                                    .currentSelectedIndex!]
                                .weight ??
                            "Un Known",fontSize: 18,fontWeight: FontWeight.w400
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 15,),
                
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: myText(text: "Types",fontSize: 18,fontWeight: FontWeight.w500)),
                ),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: PokemonCubit.getObject(context)
                              .PokemonApi
                              ?.pokemon![PokemonCubit.getObject(context)
                                  .currentSelectedIndex!]
                              .type!
                              .length ??
                          0,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child:  Center(
                                child:  myText(
                                  text: PokemonCubit.getObject(context).PokemonApi?.pokemon![PokemonCubit.getObject(context).currentSelectedIndex!].type![index] ,
                                  color: AppColors.whitee,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ),


                const SizedBox(height: 15,),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: myText(text: "Weakness",fontSize: 18,fontWeight: FontWeight.w500)),
                ),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: PokemonCubit.getObject(context)
                              .PokemonApi
                              ?.pokemon![PokemonCubit.getObject(context)
                                  .currentSelectedIndex!]
                              .weaknesses!
                              .length ??
                          0,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child:  Center(
                                child:  myText(
                                  text: PokemonCubit.getObject(context).PokemonApi?.pokemon![PokemonCubit.getObject(context).currentSelectedIndex!].weaknesses![index]??"nothing" ,
                                  color: AppColors.whitee,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ),






                const SizedBox(height: 10,)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
