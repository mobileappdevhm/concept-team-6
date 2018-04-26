import 'package:flutter/material.dart';
import 'package:prototype/ui/factory/ui_factory.dart';
import 'package:prototype/ui/widgets/favourite_list_widget.dart';

class FavouriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UIFactory.getAppScaffold(body: new FavouriteListWidget(), context: context);
  }
}
