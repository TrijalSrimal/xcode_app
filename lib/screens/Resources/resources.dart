// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:untitled/screens/Components/NavBar.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override

  Widget build(BuildContext context) {
    Future<void> _launchUrl(url) async {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          appBar: AppBar(
            title: const Text("Resources",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: "Sarabun")),
            elevation: 10,
            centerTitle: true,
          ),
          drawer: const NavBar(),
          body:
          Scrollbar(
            child: ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                        title: const Text("Python Documentation"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/python.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          _launchUrl (Uri.parse("https://docs.python.org/3/"));
                        }
                    ),
                    ListTile(
                        title: const Text("JAVA Documentation"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/java.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          _launchUrl(Uri.parse("https://docs.oracle.com/en/java/"));
                        }
                    ),
                    ListTile(
                        title: const Text("Java Course Files"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/java.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          _launchUrl(Uri.parse("https://drive.google.com/file/d/1yLAVlDUXf2KupYZ4qkDbwIhr6Fx-OEAN/view?usp=share_link"));
                        }
                    ),
                    ListTile(
                        title: const Text("Illustrator Course Files"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/illustrator.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          _launchUrl(Uri.parse("https://drive.google.com/file/d/1LYZTGgHHsMS0NVDnBM2dWlZvncrZVvAP/view?usp=share_link"));
                        }
                    ),
                    ListTile(
                      title: const Text("Photoshop Course Files"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/photoshop.png"),
                      contentPadding: const EdgeInsets.all(20),

                        onTap: (){
                          _launchUrl(Uri.parse("https://drive.google.com/file/d/1T_2-W4EbP47dKkGPR4NitRm-BRK0jokp/view?usp=share_link"));
                        },
                    ),
                    ListTile(
                      title: const Text("Premiere Pro Course Files"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/premiere.png"),
                      contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          _launchUrl(Uri.parse("https://drive.google.com/file/d/15DBEVmE8R9thBphytEpoSZynRV0QVR9t/view?usp=share_link"));
                        },
                    ),
                  ],
                ),
              ],
            ),
          ),
          ),
    );
  }
}