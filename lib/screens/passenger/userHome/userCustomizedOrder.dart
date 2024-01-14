import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:putra_go/screens/passenger/userHome/userMatchingDriver.dart';

import '../../../services/auth.dart';
import '../userMain.dart';


class userCustomizedOrder extends StatefulWidget {
  @override
  _CustomOrderPageState createState() => _CustomOrderPageState();
}

class _CustomOrderPageState extends State<userCustomizedOrder> {
  final AuthService _auth = AuthService();

  String? selectedRoute;
  int? selectedPax;
  String? selectedPrice;
  DateTime selectedDate = DateTime.now();

  final List<String> routes = ['within UPM', 'IOI Mall', 'Sri Serdang'];
  final List<int> paxNumbers = [1, 2, 3, 4, 5, 6];
  final List<String> prices = ['Price 1', 'Price 2', 'Price 3'];

  int routePrice = 0;
  String startLoction = '';

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (date == null) return;

    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );
    if (time == null) return;

    setState(() {
      selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });

    // Here can save the selected date and time to the database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

      //Title
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 36,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => userMain()),
            );
          },
        ),

        //Logout button
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, // text color
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),

      body:
      SingleChildScrollView(
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Customized your order",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: 14),
                    Container(
                      width: 334,
                      height: 52,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedRoute,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                        hint: Text('Select your route'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedRoute = newValue;
                          });
                          // Here, you would usually save the selected 'Pax' to the database
                        },
                        items: routes.map((number) {
                          return DropdownMenuItem(
                            child: Text('$number'),
                            value: number,
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: 334,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:   TextFormField(
                          decoration: InputDecoration(
                            hintText: "   Type your start location",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 20,
                            color: Colors.black, // input  text color
                          ),
                          onChanged: (val) {
                            startLoction = val;
                            // need to add startLocation into Database
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: 334,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(165, 165, 165, 1),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                        TextFormField(
                          readOnly: true,
                          onTap: () => _selectDateTime(context),
                          decoration: InputDecoration(
                            hintText: selectedDate != null ? DateFormat.yMd().add_jm().format(selectedDate) : 'Select date and time',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: 334, // Set the width to 334
                      height: 52, // Set the height to 52
                      padding: EdgeInsets.symmetric(horizontal: 12), // You can adjust the horizontal padding if needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), // Adjust the border radius if needed
                        border: Border.all(color: Colors.grey), // Add a border with a grey color
                      ),
                      child: DropdownButtonFormField<int>(
                        value: selectedPax,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Match the border radius with the Container
                            borderSide: BorderSide.none, // Use a transparent border side to hide the underline
                          ),
                          contentPadding: EdgeInsets.fromLTRB(11, 0, 0, 0), // Adjust the content padding to center the dropdown value and hint
                        ),
                        hint: Text('Pax (how may persons)'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedPax = newValue;
                          });
                          // Here, you would usually save the selected 'Pax' to the database
                        },
                        items: paxNumbers.map((number) {
                          return DropdownMenuItem(
                            child: Text('$number'),
                            value: number,
                          );
                        }).toList(),
                      ),
                    ),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: "Price",
                    //     hintStyle: TextStyle(
                    //       fontFamily: 'Poppins',
                    //       // fontSize: 20,
                    //       color: Colors.black,
                    //     ),
                    //     border: InputBorder.none,
                    //   ),
                    //   style: TextStyle(
                    //     fontFamily: 'Poppins',
                    //     // fontSize: 20,
                    //     color: Colors.black, // input  text color
                    //   ),
                    // ),

                    // DropdownButtonFormField<String>(
                    //   value: selectedPrice,
                    //   hint: Text('Price:'),
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       selectedPrice = newValue;
                    //     });
                    //     // Here, you would usually save the selected 'Price' to the database
                    //   },
                    //   items: prices.map((price) {
                    //     return DropdownMenuItem(
                    //       child: Text(price),
                    //       value: price,
                    //     );
                    //   }).toList(),
                    // ),

                    SizedBox(height: 30),
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
                            MaterialPageRoute(builder: (context) => userMatchingDriver()),
                          );
                        },
                        child: Text(
                          'Countinue',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      )

    );
  }
}
