import 'package:chatbot_prj/log_in/inscription.dart';
import 'package:chatbot_prj/log_in/log_in_modele_veiw.dart';
import 'package:chatbot_prj/source/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  Color_widget color = Color_widget();
  Sing_up_modl_view sing = Sing_up_modl_view();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image_path(),
            header_Text(),
            Sing_in(),
            Save_info(),
          ],
        ),
      ),
    );
  }

  Image_path() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/assistant.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }

  header_Text() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Text("Bienvenue",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                color: Color(0xFF161616),
              )),
          Text(
              "Remplissez les informations suivantes pour vous connecter à votre compte",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.Text_color,
              )),
        ],
      ),
    );
  }

  Sing_in() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
      child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
              fontSize: 14.0,
              height: 1.4,
              fontFamily:
                  'Roboto', // Assuming 'Roboto' is the name of your font family
              fontWeight: FontWeight.w400,
              color: Color(0xFF101614),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TextFormField(
            controller: sing.Email.value,
            decoration: InputDecoration(
              // Set to true to add a background color

              hintText: 'Entrez votre nom complet',
              label: Text("Email"), // Specify the background color
              border: OutlineInputBorder(
                // Specify the border style
                borderRadius: BorderRadius.circular(10.0),
                // Set the border radius
                borderSide: BorderSide(
                  color: color.Text_color, // Set the border color
                  width: 3.0, // Set the border width
                ),
              ),
            ),
            onChanged: (val) {},
          ),
         
         SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
         
         Text(
            "Mot de Pass",
            style: TextStyle(
              fontSize: 14.0,
              height: 1.4,
              fontFamily:
                  'Roboto', // Assuming 'Roboto' is the name of your font family
              fontWeight: FontWeight.w400,
              color: Color(0xFF101614),
            ),
          ),
         SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
         
          TextFormField(
            controller: sing.password.value,
            obscureText: !sing.passwordVisible.value,
            decoration: InputDecoration(
              // Set to true to add a background color
              hintText: 'Mot de pass',
              label: Text("Mot de pass"),
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  sing.passwordVisible.value ? Iconsax.eye : Iconsax.eye_slash,
                  color: color.Text_color,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    sing.passwordVisible.value = !sing.passwordVisible.value;
                  });
                },
              ), // Specify the background color
              border: OutlineInputBorder(
                // Specify the border style
                borderRadius: BorderRadius.circular(10.0),
                // Set the border radius
                borderSide: BorderSide(
                  color: color.Text_color, // Set the border color
                  width: 3.0, // Set the border width
                ),
              ),
            ),
            onChanged: (val) {},
          ),
        ],
      )),
    );
  }
   
   Save_info(){
   return Container(
    child: Column(children: [
      Container(
              child: Row(
                children: [

                  Container(
                    width:  MediaQuery.of(context).size.width*0.6,
                    child: Row(
                      children: [

                        Obx(() =>  Checkbox(
                            activeColor: color.Button_color,
                            checkColor: Colors.white,
                            value: sing.save_information.value,   onChanged: (val)async{
                          sing.save_information.value=!sing.save_information.value;
                         // sing.save_info();

                        }

                        ),

                        ),
                        Text("Souviens-toi de moi".tr,style: TextStyle(
                          color: Color(0xFF979797),
                        ),),
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){
                   // Get.to(Password_oublie());

                  }, child:Text("Mot de pass oublie".tr,style: TextStyle(
                      color: color.Button_color
                  ),))

                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.06,

              child: ElevatedButton(onPressed:(){
                sing.louading.value=true;
                // sing.louading.value=true;
                // sing.is_connected.value=false;
                // log.loginUser(sing.Email.value.text,sing.password.value.text).then((value) {
                //   sing.louading.value=false;
                //   sing.save_information.value=true;
                //   sing.is_connected.value=true;
                //   sing.is_connected.value==false?Get.defaultDialog(
                //       content: Text('vérifier votre mot de pass ou email'.tr),
                //       actions: [
                //         ElevatedButton(onPressed: (){
                //           sing.save_information.value=false;
                //           sing.save_info('','','');
                //           Navigator.of(context).pop();
                //         }, child: Text("retour".tr))
                //       ]
                //   ) : Navigator.pushReplacement(
                //       context,
                //      MaterialPageRoute(builder: (context) => Fest_Page()),
                //        ); 
                // });

              },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(color.Button_color),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set the desired border radius
                      ),
                    ),
                  ),
                  child:Obx(() => sing.louading.value==false?Text("Se connecter".tr,style: TextStyle(
                      color: Colors.white,

                      fontSize: MediaQuery.of(context).size.width*0.05
                  )):CircularProgressIndicator(color: Colors.white,)) ),
            ),
         
         
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      "Vous n'avez pas de compte".tr,style: TextStyle(
                      color: Color(0xFF979797),
                    ),
                    ),
                  ),TextButton(onPressed: (){
                  Get.to(Inscription());

                  }, child: Text("S'inscrire".tr,style: TextStyle(
                      color: Colors.black
                  ),))
                ],
              ),
            ),


    ]),
   );
   }




}


