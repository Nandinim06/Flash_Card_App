import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.amber,
      ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amber[50],
            image:const  DecorationImage(image: AssetImage('assets/images/Login.png',
            ),
            fit: BoxFit.fill),
          ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width-20,
                  onPressed: (){},
                  child: Text("LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  ),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
        )
    );
  }
}
