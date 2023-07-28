import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';
import 'package:firebase_firestoreapp/screens/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_firestoreapp/screens/index.dart';
import 'package:firebase_firestoreapp/model/user.dart';
class LoadingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.blue.shade600,
    body:
    Center(child: 
    Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
      SpinKitCubeGrid(
      color:Colors.white,
      size: 70,
      ),
      SizedBox(height: 20,),
      Text("loading credentials",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),) ,
      // Image(image: AssetImage('images/mike.jpg')),
    ],)
   )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//Controllers for e-mail and password textfields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool signUp = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) => isLoading ? LoadingPage() : Scaffold(
      // appBar: AppBar(
      //   //hide back arrow button
      //   automaticallyImplyLeading: false,
      //   title: Text('Firebase Firestore App'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset('images/logo.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(30,20,0,20),child:Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),) ,)
            ,
          ],),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontWeight:FontWeight.bold)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          //Sign in / Sign up button
          RaisedButton(
            onPressed: () async {

                setState(()=> isLoading = true);
                await Future.delayed(const Duration(seconds: 3));
                setState(() => isLoading = false);

              if (signUp) {
                var newuser = await FirebaseAuthService().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (newuser != null) {
                  FirestoreService().addUserData(null, null, null, "member", newuser.uid);
                  // String email = FirestoreService().readUserData().userlist.;
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }
              } else {
                Future<List<User>> user  = FirestoreService().readUserData();
                String email = user.email;
                print(FirestoreService().readUserData());
                var reguser = await FirebaseAuthService().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (reguser != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              }
            },
            child: signUp ? Text("Sign Up") : Text("Sign In"),
          ),
          //Sign up / Sign In toggler
          OutlineButton(
            onPressed: () {
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp
                ? Text("Have an account? Sign In")
                : Text("Create an account"),
          )
        ],
      ),
    );
  } //build

