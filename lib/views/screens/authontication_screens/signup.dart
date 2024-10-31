import 'package:first_app/controllers/auth_controller.dart';
import 'package:first_app/views/screens/authontication_screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();
  bool _isLoading = false;
  bool _isObsecureText = false;
  late String name;

  late String email;

  late String password;

  registerUser() async{
    setState(() {
      _isLoading = true;
    });
    BuildContext localContext = context;
    String res = await _authController.registerNewUser(email, name, password);                                                                              
    if(res == "success") {
      setState(() {
        _isLoading = false;
      });
      Future.delayed(Duration.zero, (){
        Navigator.push(localContext, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Congratulation account has been created successfully.")));
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res, style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.grey.shade200
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Your Account", 
                      style: GoogleFonts.getFont(
                        'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        color: const Color(0xff0d120e),
                        
                      ),
                    ),
                    Text(
                      "To Explore the world exclusives", 
                      style: GoogleFonts.getFont(
                        'Lato', 
                        color: const Color(0xff0d120e),
                      ),
                    ),
                            
                    Image.asset(
                      'assets/images/login.png',
                      width: 200,
                      height: 200,
                    ),
                            
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Name",
                        style: GoogleFonts.getFont(
                          "Lato",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'enter your name';
                        } else {
                          return null; 
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        enabledBorder: InputBorder.none,
                        labelText: 'enter your name',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans', 
                          fontSize: 14,
                          letterSpacing: 0.1
                        ),
                        prefixIcon: Icon(Icons.card_giftcard)
                      ),
                    ),
                        
                    SizedBox(
                      height: 20,
                    ),
                        
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.getFont(
                          "Lato",
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'enter your email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        enabledBorder: InputBorder.none,
                        labelText: 'enter your email',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans', 
                          fontSize: 14,
                          letterSpacing: 0.1
                        ),
                        prefixIcon: Icon(Icons.email)
                      ),
                    ),
                            
                    SizedBox(
                      height: 20,
                    ),
                            
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "password",
                        style: GoogleFonts.getFont("Lato", fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                            
                    
                    TextFormField(
                      obscureText: _isObsecureText,
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'enter your password';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        enabledBorder: InputBorder.none,
                        labelText: 'enter your password',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans', 
                          fontSize: 14,
                          letterSpacing: 0.1
                        ),
                        prefixIcon: Icon(Icons.key_sharp),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObsecureText = !_isObsecureText;
                            });
                          },
                          icon: Icon(
                          _isObsecureText ? Icons.visibility : Icons.visibility_off)
                        )
                      ),
                    ),
                            
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            registerUser();
                          } else {
                            print("failed");
                          }
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(246, 130, 26, 248),
                                Color.fromARGB(197, 16, 16, 190)
                              ]
                            ),
                          ),
                          
                          child: Stack(
                            children: [
                              Positioned(
                                left: 278,
                                top: 19,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 5, 8, 221),
                                        width: 12 
                                      ),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  ),
                                ),
                              ),
                                    
                              Positioned(
                                left: 250,
                                top: 9,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(0, 106, 106, 238),
                                        width: 3
                                      ),
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                  ),
                                ),
                                    
                              ),
                                    
                              Positioned(
                                left: 270,
                                top: -8,
                                child: Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 10
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ),
                                    
                              ),
                              Positioned(
                                left: 230,
                                top: 20,
                                child: Opacity(
                                  opacity: 0.1,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 15
                                      ),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  ),
                                ),
                                    
                              ),
                              Center(
                                child: _isLoading ? 
                                CircularProgressIndicator(color: Colors.white,)
                                :Text(
                                  "Sign Up",
                                  style: GoogleFonts.getFont("Lato", fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                            
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: Text("Don't you have account?", style: GoogleFonts.getFont('Lato', fontSize: 13, color: Colors.indigo),),
                    // ),
                    
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You have an account? ', style: GoogleFonts.getFont('Lato', fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, 
                                MaterialPageRoute(builder: (context){
                                return LoginScreen();
                              }));
                            },
                            child: Text('Sign In', style: GoogleFonts.getFont("Lato", fontWeight: FontWeight.bold, decoration: TextDecoration.underline),))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}