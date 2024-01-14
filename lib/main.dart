import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:putra_go/services/auth.dart';
import 'models/user.dart';
import 'screens/passenger/userMain.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ensure Flutter binding initialise
  await Firebase.initializeApp(); // initialise Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    //add stream Provider
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,

      child: MaterialApp(
        //remove Debug Banner for all
        debugShowCheckedModeBanner: false,
        title: 'PutraGo',

        home: userMain(),
      ),
    );
  }

}

