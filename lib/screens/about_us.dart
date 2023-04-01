import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/Mythemes.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.055,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'About  Us',
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 0.045 * MediaQuery.of(context).size.width,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Sarabun',
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Flexible(
                  flex:1,
                  child: Column(children: [
                    const SizedBox(height:30),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                          child: Image.asset(
                            'images/sxcslogo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:8),
                    const SizedBox(height:6),
                    const Center(child: Text("St. Xavier's Collegiate School", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Sarabun",
                      fontSize: 16,
                    )),),
                    const SizedBox(height:05),
                    const Center(child: Text("X - CODE", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Sarabun",
                      fontSize: 16,
                    )),),

                    const SizedBox(height:30),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),

                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[

                                const SizedBox(height: 30),
                                Center(
                                  child: Text("""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.                                
                                """, textAlign: TextAlign.center,style: TextStyle(
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                    children: <Widget>[
                                      const Expanded(
                                          child: Divider(thickness: 2,color: Colors.black)
                                      ),
                                      Text(" TEAM ", style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontFamily: "Sarabun",
                                        fontSize: 24,
                                      )),
                                      const Expanded(
                                          child: Divider(thickness: 2,color: Colors.black)
                                      ),
                                    ]
                                ),

                                SizedBox(height: height * .03),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ImgRtr(
                                        name: "TRIJAL SRIMAL",
                                        designation: "",
                                        about:
                                        """""",
                                        link: "images/java.png"),
                                    ImgRtr(
                                        name: "LAKSHYA  SINGHI",
                                        designation: "",
                                        about:
                                        """""",
                                        link: "images/python.png"),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ImgRtr(
                                        name: "ASHMEET JOHN LAKRA",
                                        designation: "",
                                        about:
                                        """""",
                                        link: "images/webdev.png"),
                                    ImgRtr(
                                        name: "PRANSHU  NEMANI",
                                        designation: "",
                                        about:
                                        """""",
                                        link: "images/webdev.png"),

                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ImgRtr(
                                        name: "SHREEVRIND  KAJARIA",
                                        designation: "",
                                        about:
                                        """""",
                                        link: "images/webdev.png"),

                                  ],
                                ),


                                const SizedBox(height:30),

                                const SizedBox(height: 10),
                                Row(
                                    children: <Widget>[
                                      const Expanded(
                                          child: Divider(thickness: 2,color: Colors.black)
                                      ),
                                      Text("  Contact Us ", style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontFamily: "Sarabun",
                                        fontSize: 24,
                                      )),
                                      const Expanded(
                                          child: Divider(thickness: 2,color: Colors.black)
                                      ),
                                    ]
                                ),

                                const SizedBox(height:30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        launch(
                                            "https://chat.whatsapp.com/EAHyMzFEr0mEVnXsZTwUFx",
                                            universalLinksOnly: true);
                                      },
                                      child: Text(
                                        "Whatsapp ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Oufit_Regular',
                                          fontSize: 0.04 *
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width:10),
                                    TextButton(
                                      onPressed: () {
                                        launch(
                                            "",
                                            universalLinksOnly: true);
                                      },
                                      child: Text(
                                        "Discord ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Oufit_Regular',
                                          fontSize: 0.04 *
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height:20),
                              ]
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )
      ),
    );
  }

}

class ImgRtr extends StatefulWidget {
  String name;
  String designation;
  String about;
  String link;

  ImgRtr(
      {Key? key,
        required this.name,
        required this.designation,
        required this.about,
        required this.link})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ImgRtr> createState() => _ImgRtrState(
      name: name, designation: designation, about: about, link: link);
}

class _ImgRtrState extends State<ImgRtr> {
  String name;
  String designation;
  String about;
  String link;
  _ImgRtrState(
      {required this.name,
        required this.designation,
        required this.about,
        required this.link});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  scrollable: true,
                  backgroundColor: const Color.fromARGB(255, 3, 12, 34),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.5 * MediaQuery.of(context).size.width,
                        width: 0.5 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                link),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(
                          height: 0.015 * MediaQuery.of(context).size.height),
                      Text(
                        textAlign: TextAlign.center,
                        name,
                        style: TextStyle(
                          fontFamily: "Xavier1",
                          fontSize: 0.045 * MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: 0.015 * MediaQuery.of(context).size.height),
                      Text(
                        about,
                        style: TextStyle(
                          fontSize: 0.035 * MediaQuery.of(context).size.width,
                          fontFamily: "Xavier3",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 0.055 * MediaQuery.of(context).size.width,
                          fontFamily: 'Xavier1',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 0.4 * MediaQuery.of(context).size.width,
              width: 0.4 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(link),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            height: 0.02 * MediaQuery.of(context).size.height,
            width: 0.0025 * MediaQuery.of(context).size.width),
      ],
    );
  }
}