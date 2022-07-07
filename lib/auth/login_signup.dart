import 'package:application/firebase/authentication.dart';
import 'package:application/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var _index = 0;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();

  var _agree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _wid = MediaQuery.of(context).size.width;
    var _controller = TabController(length: 2, vsync: this);
    var _hit = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: _hit,
            width: _wid,
            color: Colors.grey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 33, 17),
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 25),
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Social X",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _index = 0;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: _wid / 2 - 2,
                                decoration: BoxDecoration(
                                    color: _index == 0
                                        ? Color.fromARGB(255, 255, 33, 17)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        bottomRight: Radius.circular(25))),
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: _index == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _index = 1;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: _wid / 2 - 2,
                                decoration: BoxDecoration(
                                    color: _index != 0
                                        ? Color.fromARGB(255, 255, 33, 17)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25))),
                                child: Center(
                                    child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: _index != 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _index == 0
                    ? SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 500,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, top: 15),
                                child: Center(
                                  child: Container(
                                    width: _wid - 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Signing into your \n Account",
                                          style: TextStyle(
                                              fontSize: 22, color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.email,
                                              color: Colors.red,
                                            ),
                                            hintText: "jhonDoe@gmail.com",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _passController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.red,
                                            ),
                                            hintText: "Password",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text("Login With"),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await getAuth()
                                                    .googleLogin(context);
                                              },
                                              child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      border: Border.all()),
                                                  child: Image.asset(
                                                    "assets/OIP.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    "assets/facbook.jpg",
                                                    fit: BoxFit.fill,
                                                  )),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Text("Don't have an Account ? "),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _index = 1;
                                                    });
                                                  },
                                                  child: Text(
                                                    "Register Now",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var res = await getAuth().gmailLogin(
                                      _emailController.text,
                                      _passController.text,
                                      context);
                                },
                                child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: Center(
                                      child: Text("Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 500,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, top: 15),
                                child: Center(
                                  child: Container(
                                    width: _wid - 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Create an \n Account",
                                          style: TextStyle(
                                              fontSize: 22, color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.person,
                                              color: Colors.red,
                                            ),
                                            hintText: "jhon Doe",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.email,
                                              color: Colors.red,
                                            ),
                                            hintText: "jhonDoe@gmail.com",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("Contact no"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/flag.png",
                                                  fit: BoxFit.fill),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "IN  +91 ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 150,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _contactController,
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.call,
                                                    color: Colors.red,
                                                  ),
                                                  hintText: "123456789",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _passController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.red,
                                            ),
                                            hintText: "Password",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                checkColor: Colors.white,
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red),
                                                value: _agree,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _agree = val!;
                                                  });
                                                }),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text("I agree with "),
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _index = 0;
                                                      });
                                                    },
                                                    child: Text(
                                                        "terms & Condition",
                                                        style: TextStyle(
                                                            color: Colors.red)))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text("Already have an Account ? "),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _index = 0;
                                                  });
                                                },
                                                child: Text("Sign In",
                                                    style: TextStyle(
                                                        color: Colors.red)))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var res = await getAuth().createAccount(
                                      _emailController.text,
                                      _passController.text);
                                  setState(() {
                                    _index = 0;
                                  });
                                },
                                child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: Center(
                                      child: Text("Register",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
              ],
            )),
      ),
    );
  }
}
