import 'package:cubiterasoft/Task8/View/Components/MessageScaffold.dart';
import 'package:cubiterasoft/Task8/View/Components/SingupTextform.dart';
import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Signup/SignupCubit.dart';
import 'package:cubiterasoft/Task8/View_Model/Utils/bloc/Signup/SignupCubitStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View_Model/Utils/Utils/appColors.dart';

class SignupTodo extends StatelessWidget {
  const SignupTodo({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit cubitObject = SignupCubit.getObject(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.Background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            SingupTextform(
              emailCont: SignupCubit.getObject(context).emailCont,
              passwordcont: SignupCubit.getObject(context).passwordCont,
              namecont: SignupCubit.getObject(context).namecont,
              confirmpasswordcont:
                  SignupCubit.getObject(context).confirmpasswordCont,
            ),
            const SizedBox(
              height: 15,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () async {
                    if (SignupCubit.getObject(context)
                        .SignupformKey
                        .currentState!
                        .validate()) {
                      await cubitObject.signUp();
                    }
                  },
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: 
                      BlocConsumer<SignupCubit, SignupCubitStates>(
                        builder: (context, state) {
                          return state is IsLoading
                              ? const Center(child: CircularProgressIndicator(color: AppColors.whitee,))
                              : const myText(
                                  text: "SignUp",
                                  color: AppColors.whitee,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                );
                        },
                        listener: (context, state) {
                          if (state is DataGetSuccess) {
                            message(
                              context: context,
                              message: "Sign Up Succesfuly ",
                            );
                            Navigator.pop(context);
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
