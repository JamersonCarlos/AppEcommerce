import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool activatedBrand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
              icon: const Icon(
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
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(19, 6, 13, 217),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Brand",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  elementBrand(
                      directoryImage: 'assets/img/beatsIcon.jpeg',
                      height: 31,
                      width: 31),
                  elementBrand(
                      directoryImage: 'assets/img/jblIcon.jpeg',
                      height: 39,
                      width: 27),
                  elementBrand(
                      directoryImage: 'assets/img/akgIcon.jpeg',
                      height: 60,
                      width: 23),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          iconSize: 26,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "house"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "list"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "perfil"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF060DD9),
        child: Icon(Icons.shopping_bag_outlined),
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget elementBrand(
      {required String directoryImage,
      required double height,
      required double width}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activatedBrand = !activatedBrand;
        });
      },
      child: Container(
        width: 104,
        height: 64,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: activatedBrand
                ? [
                    const BoxShadow(
                      color: Color.fromARGB(90, 0, 0, 0),
                      offset: Offset(1.0, 5.0),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                    )
                  ]
                : null),
        child: Image(
          image: AssetImage(directoryImage),
        ),
      ),
    );
  }
}
