import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nasa_challenge/app/shared/widgets/empty/list_empty.dart';

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
        child: SizedBox(
          // padding: Style.edgeInsets.sdAll,
          child: store.isLoading
              ? Container()
              : store.isError || store.apodEntity == null
                  ? ListEmpty(message: 'Não foi possível carregar a imagem do dia.')
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Style.theme.appBarColor,
                            child: Column(
                              children: [
                                Style.spacing.min,
                                Text(
                                  'Olá, ${store.userName}',
                                  style: Style.fieldStyle.big22(fontWeight: FontWeight.bold),
                                ),
                                SwitchListTile(
                                  title: Text(
                                    'Qualidade HD?',
                                    style: Style.fieldStyle.medium16(),
                                  ),
                                  value: store.isHightQuality,
                                  onChanged: (e) {
                                    controller.setHightQuality(e);
                                    setState(() {});
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    'Data',
                                    style: Style.fieldStyle.medium16(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    store.apodEntity!.datePtBR,
                                    style: Style.fieldStyle.small14(),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () => controller.showDateSelect(context),
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Style.theme.iconColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: store.apodEntity != null,
                            child: Padding(
                              padding: Style.edgeInsets.sdAll,
                              child: ApodCard(
                                isHightQuality: store.isHightQuality,
                                apodEntity: store.apodEntity!,
                                onDetails: (e) => controller.navigateToDetails(e),
                                onFavorite: (e) => controller.saveFavorite(e),
                              ),
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
