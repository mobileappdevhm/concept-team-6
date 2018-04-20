import 'package:prototype/logic/DataBaseInterface.dart';
import 'package:prototype/logic/DataBaseMock.dart';

class DataFactory{

  DataBaseInterface getDataProvider() {
    return new DataBaseMock();
  }

}