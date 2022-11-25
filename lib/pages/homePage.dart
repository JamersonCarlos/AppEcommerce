import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "AudioZic",
          style: GoogleFonts.rasa(
            textStyle: const TextStyle(
              color: Color(0xFF060DD9),
              fontSize: 30,
            ),
          ),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Color(0xFF060DD9),
              size: 34,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Color(0xFF060DD9),
                size: 30,
              ))
        ],
      ),
      drawer: const Drawer(
        elevation: 5,
        width: 250,
        backgroundColor: Color(0xFF060DD9),
      ),
    );
  }
}
