import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageRegister extends StatefulWidget {
  PageRegister({super.key, required Function this.returnPage});

  Function returnPage;

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _user = TextEditingController();

  void register() async {
    try {
      if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text, password: _pass.text);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/backgroundTelaLogin (2).jpg"),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: const Color.fromARGB(38, 242, 61, 61),
            shadowColor: Colors.black,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 450,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(24, 242, 61, 61),
                      ),
                      child: Expanded(
                        child: Image.asset(
                          'assets/img/logo2.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFF23D3D)),
                        labelText: "Usuário",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFF23D3D),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(181, 119, 10, 166),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF770AA6),
                          width: 2,
                        )),
                      ),
                    ),
                    TextField(
                      controller: _user,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFF23D3D)),
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFFF23D3D),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(181, 119, 10, 166),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF770AA6),
                          width: 2,
                        )),
                      ),
                    ),
                    TextField(
                      controller: _pass,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Color(0xFFF23D3D)),
                        labelText: "Senha",
                        prefixIcon: Icon(
                          Icons.password_sharp,
                          color: Color(0xFFF23D3D),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(181, 119, 10, 166),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF770AA6),
                          width: 2,
                        )),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              register();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFED3253),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Já tem Conta? "),
                        GestureDetector(
                          onTap: () {
                            widget.returnPage();
                          },
                          child: const Text(
                            "Login!",
                            style: TextStyle(
                              color: Color(0xFFF23D3D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
