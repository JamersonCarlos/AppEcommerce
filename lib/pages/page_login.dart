import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/pages/homePage.dart';
import 'package:firebase_project/pages/page_register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  final _pageController = PageController();
  bool viewPassword = true;

  //Registrar novo usuário

  void returnPage() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 800), curve: Curves.easeIn);
  }

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.text, password: _pass.text);
      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowScaffoldMessenger("Usuário não encontrado!");
      } else if (e.code == 'wrong-password') {
        ShowScaffoldMessenger("Senha Incorreta!");
      }
    }
  }

  void ShowScaffoldMessenger(String Messenger) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(Messenger),
      backgroundColor: Color.fromARGB(143, 242, 61, 61),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
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
                      height: 400,
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
                            obscureText: viewPassword,
                            decoration: InputDecoration(
                              labelStyle:
                                  const TextStyle(color: Color(0xFFF23D3D)),
                              labelText: "Senha",
                              prefixIcon: const Icon(
                                Icons.password_sharp,
                                color: Color(0xFFF23D3D),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    viewPassword = !viewPassword;
                                  });
                                },
                                color: Colors.white.withOpacity(0.4),
                                icon: Icon(viewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(181, 119, 10, 166),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
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
                                    login();
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFED3253),
                                  ),
                                  child: const Text(
                                    "Login",
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
                              const Text("Não tem cadastro?"),
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeIn);
                                },
                                child: const Text(
                                  "Cadastra-se!",
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
          ),
          PageRegister(
            returnPage: returnPage,
          ),
        ],
      ),
    );
  }
}
