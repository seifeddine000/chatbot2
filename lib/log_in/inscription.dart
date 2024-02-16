
import 'package:chatbot_prj/log_in/Log_in_widget/password.dart';
import 'package:chatbot_prj/log_in/log_in_modele_veiw.dart';
import 'package:chatbot_prj/source/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
 
  Sing_up_modl_view sing = Get.put(Sing_up_modl_view());
  Color_widget color=Color_widget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            information(),
          ],
        ),
      ),
    );
  }
  header(){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
        Center(
          child: Image_path(),
        ),
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
          width:  MediaQuery.of(context).size.width*0.7,
          child: Column(
            children: [
              Text(
                  "Rejoignez-nous".tr,
                  style :TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.07,

                    color :Color(0xFF161616),
                  )
              ),
              Text("veuillez nous fournir les informations suivantes afin de créer un compte".tr, textAlign : TextAlign.center,
                  style : TextStyle(

                    color : Color(0xFF979797),


                  )
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),

      ],
    );
  }
  Image_path() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/assistant.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }

  information(){
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
      child: SingleChildScrollView(
        child: Form(
          //key: client.formKey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                    child: Text("Nom et prenom".tr,style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.05
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.001,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.92,
                child: TextFormField(
                  controller: sing.Full_name.value,
                  decoration: InputDecoration(
                    labelText: 'nom et prénom'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for the desired shape
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // Adjust the width and height here
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _name = value;
                  },
                ),
              ),
              SizedBox(

                height: MediaQuery.of(context).size.height*0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                    child: Text("Email".tr,style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.05
                    ),),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.92,
                child: TextFormField(
                  controller: sing.Email.value,
                  decoration: InputDecoration(
                    labelText: 'Entrez votre Email complet'.tr,
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for the desired shape
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // Adjust the width and height here
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              SizedBox(

                height: MediaQuery.of(context).size.height*0.02,
              ),

              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                    child: Text("Numéro de téléphone".tr,style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.05
                    ),),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.92,
                child: TextFormField(
                  controller: sing.phone.value,
                  decoration: InputDecoration(
                    labelText: 'votre numéro de telephone'.tr,
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the border radius for the desired shape
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0), // Adjust the width and height here
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              SizedBox(

                height: MediaQuery.of(context).size.height*0.1,
              ),



              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.06,

                child: ElevatedButton(onPressed:(){
                 Get.to(Password_inscription());

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
                    child: Text("Suivant".tr,style: TextStyle(
                        color: Colors.white,

                        fontSize: MediaQuery.of(context).size.width*0.05
                    ))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  Text("Vous avez déjà un compte".tr,style: TextStyle(
                    color: Color(0xFF979797),
                  ),),
                  TextButton(onPressed: (){

                  }, child: Text("Se connecter".tr,style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height*0.02
                  ),))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
