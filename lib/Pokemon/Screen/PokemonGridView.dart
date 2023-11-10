import 'package:cubiterasoft/Pokemon/Screen/PokemonInfo.dart';
import 'package:cubiterasoft/Pokemon/bloc/PokemonCubit.dart';
import 'package:cubiterasoft/Pokemon/bloc/PokemonCubitStates.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Task8/View_Model/Utils/Utils/appColors.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const myText(
          text: "Pokemon App",
          color: AppColors.whitee,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<PokemonCubit, PokemonCubitStates>(
              builder: (context, state) {
                if (state is getPokemonLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 10,
                  ));
                }

                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15),
                    padding: const EdgeInsets.all(10),
                    itemCount: PokemonCubit.getObject(context)
                            .PokemonApi
                            ?.pokemon!
                            .length ??
                        0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        splashColor: AppColors.appBarBackground,
                        onTap: () {
                          PokemonCubit.getObject(context)
                              .currentSelectedIndex = index;
                          Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => const PokemonInfo(),
                                )
                                );
                        },
                        child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 5,
                                    offset: Offset(4, 4),
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 5,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                
                                ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [

                                Expanded(child: 
                                Hero(
                                  tag: index.toString(),
                                  child: Image.network(PokemonCubit.getObject(context)
                                            .PokemonApi
                                            ?.pokemon![index]
                                            .img ??
                                        ""),
                                )
                                ),

                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: myText(
                                      text: PokemonCubit.getObject(context)
                                              .PokemonApi
                                              ?.pokemon![index]
                                              .name ??
                                          "Un Known",
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            )),
                      );
                    },
                  ),
                );

                //Image.network(PokemonCubit.getObject(context).PokemonApi?.pokemon![0].img??"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png");
              },
              listener: (context, state) {},
            )
          ],
        ),
      )),
    );
  }
}
