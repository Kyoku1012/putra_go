import 'package:flutter/material.dart';
import 'package:putra_go/screens/passenger/authenticate/userRegisterSuccess.dart';

import 'driverMain.dart';
import 'driverResisterSuccess.dart';


class driverRegister extends StatefulWidget {
  @override
  State<driverRegister> createState() => _userRegisterState();
}

class _userRegisterState extends State<driverRegister> {

  // text field state
  String name = '';
  String email = '';
  String phoneNumber = '';
  String icNumber = '';
  String password = '';
  String passwordCheck = '';
  // text about car information
  String carID = '';
  String carBrand = '';
  String carColor = '';

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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Register as a Driver..",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Input name
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
                            hintText: "Name",
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
                          validator: (val) => val!.length < 4 ? 'Enter a name more than 3 chars' : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ),
                      ),
                    ),

                    // Input UPM email
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
                            hintText: "UPM email",
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
                          val!.isEmpty ? 'Enter your UPM email' : null,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() => email= val);
                          },
                        ),
                      ),
                    ),

                    // Input Phone Number
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
                            hintText: "Phone Number (11-, not 011-)",
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
                          val!.length != 10 ? 'Enter a valid phone number' : null,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() => phoneNumber = val);
                          },
                        ),
                      ),
                    ),

                    // Input IC number
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
                            hintText: "IC Number / Passort Number",
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
                          val!.length != 12 || val!.length != 9 ? 'Enter a valid IC/Passport Number' : null,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() => icNumber = val);
                          },
                        ),
                      ),
                    ),

                    // Input CarID
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
                            hintText: "Car ID (Plate Number)",
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
                          validator: (val) => val!.length < 4 ? 'Enter a valid Car ID' : null,
                          onChanged: (val) {
                            setState(() => carID = val);
                          },
                        ),
                      ),
                    ),

                    // Input Car Brand
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
                            hintText: "Car Brand",
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
                          validator: (val) => val!.length < 3 ? 'Enter a valid Car Brand' : null,
                          onChanged: (val) {
                            setState(() => carBrand = val);
                          },
                        ),
                      ),
                    ),

                    // Input Car Color
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
                            hintText: "Car Color",
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
                          validator: (val) => val!.length < 2 ? 'Enter a valid Car Color' : null,
                          onChanged: (val) {
                            setState(() => carColor = val);
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
                          val!.length < 6 ? 'Enter a password > 6 chars long' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                    ),

                    // Check Password
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
                            hintText: "Password again",
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
                          val! != password ? 'Passwords are different' : null,
                          obscureText: true,
                        ),
                      ),
                    ),

                    // Continue Button
                    SizedBox(height: 20),
                    Container(
                      width: 334,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(119, 97, 255, 1.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle Next button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => driverRegisterSuccess()),
                          );
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
}
