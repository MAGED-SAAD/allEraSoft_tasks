import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Login/LoginCubit.dart';
import 'package:flutter/material.dart';

class LoginTextform extends StatelessWidget {
  const LoginTextform({
    super.key,
    required this.emailCont,
    required this.password,
  });

  final TextEditingController emailCont;
final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.getObject(context).formKeyLogin,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextFormField(
                    controller: emailCont,
                    //initialValue:displayNote.title,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: AppColors.whitee),
                    decoration: const InputDecoration(
                      labelText: "email",
                      labelStyle: TextStyle(color: AppColors.green),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.whitee,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.whitee,
                        ), //<-- SEE HERE
                      ),
                    ),
    
                    validator: (value) {
                      if (value == null) {
                        return ("this fieled is empty ");
                      } else if (value.length < 3) {
                        return ("Data un Valid ");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    maxLines: 1,
                    controller: password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //initialValue:displayNote.title,
    
                    style: const TextStyle(color: AppColors.whitee),
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: AppColors.green),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.whitee,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.whitee,
                        ), //<-- SEE HERE
                      ),
                    ),
    
                    validator: (value) {
                      if (value == null) {
                        return ("this fieled is empty ");
                      } else if (value.length < 3) {
                        return ("Data is un Valid ");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
