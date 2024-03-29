import 'package:flutter/material.dart';

import '../../../models/order.dart';
import '../driverMain.dart';
import 'driverPickup.dart';

class driverSelectOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Select Your Order'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {

            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:
            orders.length, // replace with your data length from the database
        itemBuilder: (context, index) {
          // Here pull data from a database
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${order.time} ', // Replace with variable for time and day
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Price: RM ${order.price}', // Replace with variable for price
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          'Route: ${order.route}'), // Replace with variable for route
                      Text(
                          'Start: ${order.start}'), // Replace with variable for start point
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          'Pax: ${order.pax}'), // Replace with boolean variable
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle accept action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => driverPickup()),
                      );
                    },
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color.fromRGBO(119, 97, 255, 1.0), // Background color
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
