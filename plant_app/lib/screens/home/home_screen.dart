import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart' as LImagePicker;

import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/data_plan/data_plan_screen.dart';

// import 'package:plant_app/components/my_buttom_appbar.dart';
import 'package:plant_app/screens/details/details_screen.dart';

import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/screens/perfil/perfil_screen.dart';
import 'package:plant_app/screens/process_images/process_images_screen.dart';

class HomeScren extends StatefulWidget {
  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  int currentTab = 0;

  final List<Widget> screens = [
    PerfilScreen(),
    ProcessImageScreen(),
    DetailsScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = BodyHome();

  final LImagePicker.ImagePicker _picker = LImagePicker.ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: buildAppBar(),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // bottomNavigationBar: MyBottomNavBar(),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () {
              options(context);
            }),
        onLongPress: () {
          setImage(3, context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  options(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setImage(2, context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Seleccionar una imagen"),
                          ),
                          Icon(
                            Icons.folder,
                            color: kPrimaryColor.withOpacity(0.75),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setImage(1, context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Tomar foto"),
                          ),
                          Icon(
                            Icons.camera,
                            color: kPrimaryColor.withOpacity(0.75),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future setImage(int opt, BuildContext context) async {
    var _pickedFile;

    if (opt == 1 || opt == 3) {
      _pickedFile = _pickedFile =
          await _picker.pickImage(source: LImagePicker.ImageSource.camera);
    } else {
      _pickedFile =
          await _picker.pickImage(source: LImagePicker.ImageSource.gallery);
    }
    if (opt != 3 && _pickedFile != null) {
      Navigator.of(context).pop();
    }
    if (_pickedFile != null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                    child: Image.file(File(_pickedFile.path)),
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Enfermedad"),
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColorMaterial.shade50,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DataPlanScreen(file:File(_pickedFile.path))));
                          },
                          child: Text("Buscar Planta"),
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColorMaterial.shade50))
                    ],
                  )
                ],
              ),
            ));
          });
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // leading: IconButton(
      //   icon: FlutterSVG.SvgPicture.asset("assets/icons/menu.svg"),
      //   onPressed: () {},
      // ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = BodyHome();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                          color: currentTab == 0 ? kPrimaryColor : Colors.grey),
                      Text(
                        "Home",
                        style: TextStyle(
                            color:
                                currentTab == 0 ? kPrimaryColor : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = DetailsScreen();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard_outlined,
                          color: currentTab == 1 ? kPrimaryColor : Colors.grey),
                      Text(
                        "Detail",
                        style: TextStyle(
                            color:
                                currentTab == 1 ? kPrimaryColor : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = PerfilScreen();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle_rounded,
                          color: currentTab == 2 ? kPrimaryColor : Colors.grey),
                      Text(
                        "Detail",
                        style: TextStyle(
                            color:
                                currentTab == 2 ? kPrimaryColor : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = PerfilScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle_rounded,
                          color: currentTab == 3 ? kPrimaryColor : Colors.grey),
                      Text(
                        "Detail",
                        style: TextStyle(
                            color:
                                currentTab == 3 ? kPrimaryColor : Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
