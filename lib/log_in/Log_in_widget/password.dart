import 'package:chatbot_prj/log_in/log_in_modele_veiw.dart';
import 'package:chatbot_prj/source/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class Password_inscription extends StatefulWidget {
  const Password_inscription({Key? key}) : super(key: key);

  @override
  State<Password_inscription> createState() => _Password_inscriptionState();
}

class _Password_inscriptionState extends State<Password_inscription> {

  Sing_up_modl_view sing = Get.put(Sing_up_modl_view());

  Color_widget colors = Color_widget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child:  Column(
          children: [
            header(),
            test_pqssword(),
            Go_bcak_to_connection_page(),
          ],
        ),
      )

    );
  }
  header(){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),

        Center(
          child: Container(
            width:  MediaQuery.of(context).size.width*0.72,
            child: Column(
              children: [
                Text(
                    "Créer un mot de passe".tr,
                    style :TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.07,

                      color :Color(0xFF161616),
                    )
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                Text("créer un mot de passe fort pour sécuriser vos informations personnelles".tr, textAlign : TextAlign.center,
                    style : TextStyle(

                      color : Color(0xFF979797),
                      fontSize:15


                    )
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),

      ],
    );
  }
  test_pqssword(){
    return Column(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width*0.85,
          child:  Form(
              child:Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 5,top: 20,bottom: 5),
                      child: Text('Mot de passe'.tr,style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.05

                      ),)),
                  TextFormField(
                    controller: sing.password.value,
                    obscureText: !sing.passwordVisible.value,
                    decoration: InputDecoration(
                      // Set to true to add a background color
                      hintText: 'Mot de pass'.tr,
                      label: Text("Mot de pass".tr),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                            sing.passwordVisible.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash,
                            color: Colors.black
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            sing.passwordVisible.value = ! sing.passwordVisible.value;
                          });
                        },
                      ),// Specify the background color
                      border: OutlineInputBorder(
                        // Specify the border style
                        borderRadius: BorderRadius.circular(10.0),
                        // Set the border radius
                        borderSide: BorderSide(
                          color: Colors.black12,  // Set the border color
                          width: 3.0,  // Set the border width
                        ),
                      ),
                    ),
                    onChanged: (val){

                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 5,top: 20,bottom: 5),
                      child: Text('Confirmer le mot de passe'.tr,style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.05

                      ),)),
                  TextFormField(
                    controller: sing.password2.value,
                    obscureText: !sing.passwordVisible.value,
                    decoration: InputDecoration(
                      // Set to true to add a background color
                      hintText: 'Confirmer le mot de passe'.tr,
                      label: Text("Confirmer le mot de passe".tr),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                            sing.passwordVisible.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash,
                            color: Colors.black
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            sing.passwordVisible.value = ! sing.passwordVisible.value;
                          });
                        },
                      ),// Specify the background color
                      border: OutlineInputBorder(
                        // Specify the border style
                        borderRadius: BorderRadius.circular(10.0),
                        // Set the border radius
                        borderSide: BorderSide(
                          color: Colors.black12,  // Set the border color
                          width: 3.0,  // Set the border width
                        ),
                      ),
                    ),
                    onChanged: (val){

                    },
                  ),


                ],
              )),
        ),
      ],
    );
  }
  Go_bcak_to_connection_page(){
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.15,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.06,

            child: ElevatedButton(onPressed:(){


            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(colors.Button_color),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set the desired border radius
                    ),
                  ),
                ),
                child: Obx(() => sing.louading.value==false?Text("S'inscrire".tr,style: TextStyle(
                    color: Colors.white,

                    fontSize: MediaQuery.of(context).size.width*0.05
                )):CircularProgressIndicator(
                  color: Colors.white,
                ))),
          ),

        ],
      ),
    );
  }
}
