import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/LoginTextform.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/My_circular_progress.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/myText.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Components/remember_me.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/Signup.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View/Screens/viewNotes.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Login/LoginCubit.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Login/LoginCubitStates.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/bloc/Signup/SignupCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View_Model/Utils/Utils/appColors.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                
                width: 250,
                height: 280,
                decoration:const  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(112, 44, 44, 44),
                  image: DecorationImage(
                    alignment: Alignment.topRight,
                    image:NetworkImage("https://cdn-icons-png.flaticon.com/512/6194/6194029.png",)
                  )
                ),
              ),


              const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: FittedBox(
                      child: Text(
                        
                         "Dark ToDo App",
                         style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,wordSpacing: 10),),
                    ),
                ),
            
              const SizedBox(
                height: 15,
              ),
            
              LoginTextform(emailCont: LoginCubit.getObject(context).emailCont, password: LoginCubit.getObject(context).passwordCont),
            
                const RememberMe(),
              const SizedBox(
                height: 15,
              ),
            
                const Align(
                alignment: Alignment.center,
                child: myText(text: "Dont Have an Account ?",color: AppColors.lite_white,fontWeight: FontWeight.bold,)),
              
            
              Align(
                alignment: Alignment.center,
                child:TextButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupTodo(),));
                }, child:const myText(text: "Sign Up",color: AppColors.whitee,fontWeight: FontWeight.bold,fontSize: 17,letterSpacing: 1,)),
              ),
              
                ],
              ),
            ),

            //const Spacer(),
            
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () async{
                    if(LoginCubit.getObject(context).formKeyLogin.currentState!.validate()){
                      await  LoginCubit.getObject(context).Login();
                    }
                  },
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child:  Center(
                      child: 
                      BlocConsumer<LoginCubit, LoginCubitStates>(
                        builder: (context, state) {
                          return state is IsLoading
                              ? const My_circular_progress()
                              : const myText(
                                  text: "Login",
                                  color: AppColors.whitee,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 2,
                                );
                        },
                        listener: (context, state) {
                          if (state is DataGetSuccess) {
                            message(
                              context: context,
                              message: "Login Succesfuly",
                            );
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>const viewNotes(isFilter: false),));
                          }else if(state is GetDataFailed){
                            message(
                              context: context,
                              message: state.error.toString(),
                              Textcolor: Colors.red
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          
          ],
        ),
      )),
    );
  }
}
