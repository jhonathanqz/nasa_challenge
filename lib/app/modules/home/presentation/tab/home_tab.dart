import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/style/style_theme.dart';
import '../../../../shared/widgets/appbar/app_bar_default.dart';
import '../../../../shared/widgets/scaffold/scaffold_app.dart';
import '../controller/home_controller.dart';
import '../store/home_store.dart';
import '../widgets/apod_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeController controller;
  late HomeStore store;

  @override
  void initState() {
    controller = widget.controller;
    store = controller.homeStore;
    controller.getApodDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ScaffoldApp(
        appBar: AppBarDefault(
          title: 'Home',
          leading: Container(),
        ),
        isLoading: store.isLoading,
        floatingActionButton: store.isError && store.apodEntity == null
            ? FloatingActionButton(
                backgroundColor: Style.theme.buttonColor,
                onPressed: () => controller.getApodDay(),
                child: Icon(
                  Icons.refresh,
                  color: Style.theme.buttonIconColor,
                ),
              )
            : null,
        child: Container(
          padding: Style.edgeInsets.sdAll,
          child: store.isLoading
              ? Container()
              : store.isError || store.apodEntity == null
                  ? Center(
                      child: Text(store.errorMessage ?? 'Não encontramos a imagem do dia.'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SwitchListTile(
                            title: const Text('Qualidade HD?'),
                            value: store.isHightQuality,
                            onChanged: (e) {
                              controller.setHightQuality(e);
                              setState(() {});
                            },
                          ),
                          ListTile(
                            title: const Text('Data'),
                            subtitle: Text(store.apodEntity!.datePtBR),
                            trailing: IconButton(
                              onPressed: () => controller.showDateSelect(context),
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ),
                          Visibility(
                            visible: store.apodEntity != null,
                            child: ApodCard(
                              isHightQuality: store.isHightQuality,
                              apodEntity: store.apodEntity!,
                              onDetails: (e) => controller.navigateToDetails(e),
                              onFavorite: (e) => controller.saveFavorite(e),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      );
    });
  }
}
