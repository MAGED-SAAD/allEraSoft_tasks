
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Login/LoginCubit.dart';
import 'package:flutter/material.dart';


class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  
  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment:MainAxisAlignment.end ,
      children: [
        const myText(text: "Remember Me",color: Colors.white,),
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.green,
          side:const  BorderSide(
            color: Colors.green,
            width: 2,
          ),
          value: LoginCubit.getObject(context).m3rfsh,
          onChanged: (value) {
            setState(() {
              LoginCubit.getObject(context).m3rfsh=value;
            });
          },
        ),

        
      ],
    );


  }
}