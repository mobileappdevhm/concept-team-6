import 'package:flutter/material.dart';
import 'package:prototype/ui/factory/ui_factory.dart';

class FavouriteList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return UIFactory.getAppScaffold(body: new FavouriteList(),context: context);
  }

}