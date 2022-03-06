import 'package:hackufaz/models/table_column.dart';

class TableConsts {
    static const List<TableColumn> columns = [
      TableColumn(id: "region", title: "Regioin", isIdent: false),
      TableColumn(id: "farmer", title: "Farmer", isIdent: false),
      TableColumn(id: "n_fields", title: "# of Field", isIdent: false),
      TableColumn(id: "ha", title: "HA", isIdent: false),
      TableColumn(id: "autumn", title: "Autumn ploughing"),
      TableColumn(id: "spring", title: "Spring ploughing"),
      TableColumn(id: "seeding", title: "Seeding"),
      TableColumn(id: "planting", title: "Planting"),
      TableColumn(id: "irrigation", title: "Irrigiation"),
      TableColumn(id: "cultivation", title: "Cultivation"),
      TableColumn(id: "fertilizing", title: "Fertilizing"),
      TableColumn(id: "topping", title: "Tapping"),
      TableColumn(id: "efficiency", title: "Efficency"),
      TableColumn(id: "quality", title: "Quality"),
      TableColumn(id: "index", title: "Index"),
  ];
}