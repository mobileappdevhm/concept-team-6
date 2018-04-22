import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/DataBaseMock.dart';

class DataFactory{

  static DataBaseInterface dataBase;

  static DataBaseInterface getDataProvider() {
    if (dataBase == null) {
      dataBase = new DataBaseMock();
    }

    return dataBase;
  }

}