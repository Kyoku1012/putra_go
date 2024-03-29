import 'package:flutter/material.dart';
import '../../../services/auth.dart';
import '../passenger/userHome/userCustomizedOrder.dart';
import 'driverHome/driverSelectOrder.dart';
import 'driverMain.dart';

class driverLogin extends StatefulWidget {

  @override
  State<driverLogin> createState() => _userLoginState();
}

class _userLoginState extends State<driverLogin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 36,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => driverMain()),
              );
            },
          ),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align at the top
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title: Login
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Driver Login",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Input student email
                    SizedBox(height: 10),
                    Container(
                      width: 334,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "UPM Email",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.black, // input  text color
                          ),
                          validator: (val) => val!.isEmpty ? 'Enter a student email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                    ),

                    // Input Password
                    SizedBox(height: 10),
                    Container(
                      width: 334,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.black, // input  text color
                          ),
                          validator: (val) =>
                          val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                    ),

                    //Check the Auth
                    SizedBox(height: 20),
                    Container(
                      width: 334,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(119, 97, 255, 1.0),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => driverSelectOrder()),
                          );


                          // if (_formKey.currentState!.validate()) {
                          //   setState(() => loading = true);
                          //   dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          //   if (result == null) {
                          //     setState(() {
                          //       setState(() {
                          //         loading = false;
                          //         error = 'Could not sign in with those credentials';
                          //       });
                          //     });
                          //   }
                          // }
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),


                    // Forget Password little button
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => driverSelectOrder()),
                        // );

                      },
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(119, 97, 255, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
}
