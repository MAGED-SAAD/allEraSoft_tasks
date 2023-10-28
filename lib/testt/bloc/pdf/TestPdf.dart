import 'package:cubiterasoft/Task8/View/Components/myText.dart';
import 'package:cubiterasoft/testt/bloc/pdf/pdfApi.dart';
import 'package:flutter/material.dart';

class TestPdf extends StatelessWidget{
  const TestPdf({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: MaterialButton(
            color: Colors.green,
            onPressed:() async{

              final pdfFile=await PdfApi.genrateText(
                text:""
              );

              PdfApi.openFile(myfile: pdfFile);


            },
            child: const myText(text: "Creat Pdf",color: Colors.white,),
            ),
        ) 
        ),
    );
  }

}