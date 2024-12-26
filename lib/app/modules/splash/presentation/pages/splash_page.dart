import 'package:flutter/material.dart';
import 'package:nasa_challenge/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:nasa_challenge/app/modules/splash/presentation/widgets/fade_image.dart';

import '../../../../shared/style/style_theme.dart';
import '../../../../shared/widgets/scaffold/scaffold_app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.controller,
  });
  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late SplashController controller;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    controller.dismiss();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      child: Container(
        color: Style.theme.primaryColor,
        padding: Style.edgeInsets.sdAll,
        child: FadeImage(
          animation: _animation,
          imagePath: Style.images.logo,
        ),
      ),
    );
  }
}
