import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_challenge/app/modules/home/presentation/controller/home_controller.dart';
import 'package:nasa_challenge/app/modules/home/presentation/store/home_store.dart';
import 'package:nasa_challenge/app/shared/style/style_theme.dart';
import 'package:nasa_challenge/app/shared/widgets/scaffold/scaffold_app.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  late HomeStore store;
  int _currentIndex = 0;

  @override
  void initState() {
    controller = widget.controller;
    store = controller.homeStore;
    controller.getApodDay();
    changeIndex(0);
    super.initState();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    controller.changeIndex(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      bottomNavigationBar: Padding(
        padding: Style.edgeInsets.bmd,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => changeIndex(i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Style.theme.buttonColor,
            ),

            /// Favoritos
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite),
              title: const Text("Favoritos"),
              selectedColor: Style.theme.redColor,
            ),
          ],
        ),
      ),
      child: Container(
        color: Style.theme.primaryColor,
        child: const Column(
          children: [
            Expanded(child: RouterOutlet()),
          ],
        ),
      ),
    );
  }
}
