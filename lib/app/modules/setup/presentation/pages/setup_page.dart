import 'package:flutter/material.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/controller/setup_controller.dart';
import 'package:nasa_challenge/app/modules/setup/presentation/widgets/setup_form.dart';
import 'package:nasa_challenge/app/shared/style/style_theme.dart';
import 'package:nasa_challenge/app/shared/widgets/scaffold/scaffold_app.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({
    super.key,
    required this.controller,
  });

  final SetupController controller;

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  late SetupController controller;
  final nameController = TextEditingController();
  final nameFocus = FocusNode();

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Style.theme.buttonColor,
        onPressed: controller.saveNewUser,
        label: Text(
          'Continuar',
          style: Style.fieldStyle.small14(),
        ),
        icon: Icon(
          Icons.arrow_forward,
          color: Style.theme.buttonIconColor,
        ),
      ),
      child: Container(
        padding: Style.edgeInsets.mdAll,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SetupForm(
                nameController: nameController,
                nameFocus: nameFocus,
                onChanged: controller.setUserName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
