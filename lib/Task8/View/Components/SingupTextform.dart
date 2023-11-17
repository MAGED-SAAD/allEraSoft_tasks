import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/appColors.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Signup/SignupCubit.dart';
import 'package:flutter/material.dart';

class SingupTextform extends StatelessWidget {
  const SingupTextform({
    super.key,
    required this.emailCont,
    required this.passwordcont,
    required this.namecont,
    required this.confirmpasswordcont
  });

final TextEditingController namecont;
final TextEditingController emailCont;
final TextEditingController passwordcont;
final TextEditingController confirmpasswordcont;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignupCubit.getObject(context).SignupformKey,
      child: Column(
        children: [
    
    
    
    
    
    
           Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextFormField(
                    controller: namecont,
                    //initialValue:displayNote.title,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: AppColors.whitee),
                    decoration: const InputDecoration(
                      labelText: "Name",
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
                    controller: passwordcont,
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
                      } else if (value.length < 8) {
                        return ("password must be at least 8 letters");
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
                    controller: confirmpasswordcont,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //initialValue:displayNote.title,
    
                    style: const TextStyle(color: AppColors.whitee),
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
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
                      }else if(confirmpasswordcont.text!=passwordcont.text){
                        return("paswword are diffrent");
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
