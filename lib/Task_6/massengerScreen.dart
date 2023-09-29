import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class massengerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 10,
            backgroundImage: Image.network("https://engineering.unl.edu/images/staff/Kayla-Person.jpg").image,
          ),
        ) ,

        title:const Text("Chats"),
        actions: [

          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: IconButton(onPressed: () {

            }, icon: const Icon(Icons.camera_alt,color: Colors.white,)),
          ),

          const SizedBox(width: 10,),

          Padding(
            padding: const EdgeInsets.only(right: 10),

            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: IconButton(
                  onPressed: () {

              }, icon: const Icon(Icons.edit,color: Colors.white,)),
            ),
          ),
        ],
      ),




      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5,vertical: 5 ),
                  child: SearchBar(
                    backgroundColor:MaterialStateProperty.all(Colors.grey[800]) ,
                    leading:const Icon(Icons.search,color: Colors.white,) ,
                    hintText: "Search",
                    hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                    padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)) ,
                    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),

                  ),
                ),




                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                         return SizedBox(width: 5,);
                        },
                        itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [

                            CircleAvatar(
                              radius: 25,
                              backgroundImage: Image.network("https://engineering.unl.edu/images/staff/Kayla-Person.jpg",).image,
                              child: const Align(
                                alignment:Alignment.bottomRight,
                                child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.green
                                ),
                              ),
                            ),

                            Text("Mona Ahmed",style: TextStyle(color: Colors.white,fontSize: 11),)
                          ],);
                      },
                    ),
                  ),
                ),





                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15,);
                    },
                    itemCount: 20,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: Image.network("https://engineering.unl.edu/images/staff/Kayla-Person.jpg",).image,
                          child:  Align(
                            alignment:Alignment.bottomRight,
                            child:
                            index % 2==0?
                            const CircleAvatar(
                                radius: 7,
                                backgroundColor: Colors.green
                            ):
                                const SizedBox.shrink()
                          ),
                        ),

                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yara hany",style: TextStyle(color: Colors.white),),
                                SizedBox(height: 10,),
                                Text("Welcome to flutter",style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),

                        Text("11:50 Am",style: TextStyle(color: Colors.grey[500]),),

                      ],);
                  },
                ),



          ]),
        ),
      ),
    );
  }

}