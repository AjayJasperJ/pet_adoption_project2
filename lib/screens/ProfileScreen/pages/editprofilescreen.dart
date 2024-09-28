import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastnameCOntroller=TextEditingController();
  TextEditingController datecontroller =TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController=TextEditingController();
   final _formKey = GlobalKey<FormState>();

    @override
  void initState() {
    super.initState();
    
    // Fetch user data and initialize controllers
    final user = Provider.of<UserProvider>(context, listen: false).currentUserId;
    
    if (user != null) {
      userNameController.text =  'Vishal';
      lastnameCOntroller.text =  'Vichu';
      datecontroller.text =  '29-11-1999';  // Ensure the DOB is in the correct format
      phoneNumberController.text = '8870120688';
      addressController.text = 'Kanyakumari';
      emailController.text ='vishal@gmail.com';
    }
  }
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the date and set it in the TextField
      String formattedDate = "${picked.day}-${picked.month}-${picked.year}";
  
      datecontroller.text = formattedDate;
    }
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text('Edit Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: purpleColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key:_formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    //  imageProfile()
                      // SizedBox(
                      //   child: CircleAvatar(
                      //     radius: 40.0,
                      //     backgroundColor: Colors.white,
                      //     child: CircleAvatar(
                      //       child: Align(
                      //         alignment: Alignment.bottomRight,
                      //         child: CircleAvatar(
                      //           backgroundColor: Colors.black,
                      //           radius: 12.0,
                      //           child: Icon(
                      //             Icons.camera_alt,
                      //             size: 15.0,
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                      //       radius: 30,
                      //       backgroundImage: AssetImage('assets/profile.png'),
                      //     ),
                      //   ),
                      // ),
                      // CircleAvatar(
                      //   radius: 30,
                      //   child: Image.asset('assets/profile.png'),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  const Text(
                    'First Name',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
              
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Enter First Name',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(userNameController.text.isEmpty){
                              return "Please enter your firstname";
                            }
                            else{
                              return null;
                            }
                          },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                   const Text(
                    'Last Name',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: lastnameCOntroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Enter Last Name',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(lastnameCOntroller.text.isEmpty){
                              return "Please enter your lastname";
                            }
                            else{
                              return null;
                            }
                          },
                    ),
                  ),
                     SizedBox(height: size.height * 0.01),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.01,
                  // ),
              
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: 'Enter Phone Number',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(phoneNumberController.text.isEmpty){
                              return "Please enter your phone";
                            }
                            else{
                              return null;
                            }
                          },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                   const Text(
                    'Date of Birth',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
              
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: datecontroller,
                      
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                       
                          hintText: 'Enter Date of birth',
                          prefixIcon: IconButton(onPressed: (){
                            _selectDate(context);
              
                          }, icon:Icon(IconlyLight.calendar)),
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(datecontroller.text.isEmpty){
                              return "Please enter your dob";
              
                            }
                            else{
                              return null;
                            }
                          },
                         
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    'Address',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
              
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Enter  Address',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(addressController.text.isEmpty){
                              return "Please enter your address";
                            }
                            else{
                              return null;
                            }
                          },
                    ),
                  ),
                   SizedBox(height: size.height * 0.01),
                  const Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
              
                   SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.07,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Enter  Email',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder()),
                          validator: (value) {
                            if(emailController.text.isEmpty){
                              return "Please enter your email";
                            }
                            else{
                              return null;
                            }
                          },
                    ),
                  ),
                   SizedBox(height: size.height * 0.01),
                  
                 
                  // const Text(
                  //   'Sponser ID ',
                  //   style: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w500),
                  // ),
                  // SizedBox(height: size.height * 0.01),
                  // SizedBox(
                  //   height: size.height * 0.07,
                  //   child: TextFormField(
                  //     //controller: emailController,
                  //     keyboardType: TextInputType.text,
                  //     decoration: const InputDecoration(
                  //         hintText: 'Enter Sponser ID',
                  //         hintStyle: TextStyle(fontSize: 13),
                  //         border: OutlineInputBorder()),
                  //   ),
                  // ),
                  // const Text(
                  //   'Sponser link',
                  //   style: TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w500),
                  // ),
              
                  // SizedBox(height: size.height * 0.01),
                  // SizedBox(
                  //   height: size.height * 0.07,
                  //   child: TextFormField(
                  //     //controller: emailController,
                  //     keyboardType: TextInputType.emailAddress,
                  //     decoration: const InputDecoration(
                  //         hintText: 'Enter Sponser link',
                  //         hintStyle: TextStyle(fontSize: 13),
                  //         border: OutlineInputBorder()),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // Spacer(),
                  // SizedBox(
                  //   height: size.height * 0.39,
                  // ),
                  SizedBox(
                    height: size.height * 0.049,
                    width: size.width * 0.93,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor:purpleColor),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                              updateProfileApi();

                          }
                          

                        
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (builder) => bottomsheet());
          },
          // child: image != null
          //     ? Image.file(image!)
          //     : CircleAvatar(
          //         radius: 30,
          //         backgroundImage: AssetImage('assets/person.png'),
          //       )
          child: CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: image != null
                  ? Image.file(image!)
                  : Image.asset('assets/newprofile.png'),
            ),
          ),
        ),
        // const Positioned(
        //     bottom: 30.0,
        //     top: 50.0,
        //     left: 55,
        //     child: Icon(
        //       Icons.camera_alt,
        //       color: Colors.black,
        //       size: 28,
        //     ))
      ],
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.teal,
                  ),
                  label: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton.icon(
                  onPressed: () {
                   // pickImage();
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.teal,
                  ),
                  label: const Text(
                    'Gallery',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> updateProfileApi() async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/PetAdoption/api/edit_profile.php'),
      );
      print(
          'http://campus.sicsglobal.co.in/Project/PetAdoption/api/edit_profile.php');
      request.fields.addAll({
        'firstname': userNameController.text.trim(),
        'lastname':lastnameCOntroller.text.trim(),
        'phone': phoneNumberController.text.trim(),
        'email': emailController.text.trim(),
        'dob':datecontroller.text.trim(),
        'password': '123',
        'gender':'Male',
        'address': addressController.text.trim(),
        'user_id': user.currentUserId ?? "1"
      });
        if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image!.path));
    }
      http.StreamedResponse response = await request.send();

      print(await response.stream.bytesToString());
      print(""" 'firstname': ${userNameController.text.trim()},
       'lastname':${lastnameCOntroller.text.trim()},
        'phone': ${phoneNumberController.text.trim()},
        'email': 'jose@gmail.com',
        'password': '123',
        'gender':'Male',
        'address': ${addressController.text.trim()},
        'user_id': ${user.currentUserId}?? "1" """);
      if (response.statusCode == 200) { 
         
          
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor:purpleColor,
                                  content: const Text("Profile Updated successfully...!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PetBottomNavigation()));
                         
                        
        

        print(await response.stream.bytesToString());
      } else { 
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
