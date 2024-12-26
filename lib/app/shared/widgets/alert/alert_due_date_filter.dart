import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';

@immutable
class AlertDueDateFilter extends StatefulWidget {
  const AlertDueDateFilter({
    super.key,
  });

  @override
  State<AlertDueDateFilter> createState() => _AlertDueDateFilterState();
}

class _AlertDueDateFilterState extends State<AlertDueDateFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: Style.inputBorder.borderRadiusAll,
        ),
        elevation: 2,
        backgroundColor: Style.theme.background,
        content: SizedBox(
          height: size.height / 2,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Icon(
                      Icons.select_all,
                      size: 40,
                    ),
                  ),
                  Style.spacing.sm,
                  Center(
                    child: Text(
                      'Selecione o motivo a ser filtrado:',
                      style: Style.fieldStyle.titleBold.copyWith(
                        color: Style.theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Style.spacing.sm,
                  SingleChildScrollView(
                    child: Column(
                      children: _buildList(),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  icon: const Icon(
                    Icons.cancel_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text) => Text(
        text,
        style: Style.fieldStyle.title.copyWith(
          fontSize: 14,
        ),
      );

  List<Widget> _buildList() => [
        ListTile(
          onTap: () {
            Modular.to.pop();
          },
          title: _text('Vencidos'),
          tileColor: Style.theme.grey3,
        ),
        Style.spacing.min,
        ListTile(
          onTap: () {
            Modular.to.pop();
          },
          title: _text('Críticos'),
          tileColor: Style.theme.grey3,
        ),
        Style.spacing.min,
        ListTile(
          onTap: () {
            Modular.to.pop();
          },
          title: _text('Baixados'),
          tileColor: Style.theme.grey3,
        ),
        Style.spacing.min,
        ListTile(
          onTap: () {
            Modular.to.pop();
          },
          title: _text('Próximos do vencimento'),
          tileColor: Style.theme.grey3,
        ),
      ];
}
