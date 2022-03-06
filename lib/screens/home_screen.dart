import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
import 'package:hackufaz/api/farmer_service.dart';
import 'package:hackufaz/consts/appColors.dart';
import 'package:hackufaz/consts/table_consts.dart';
import 'package:hackufaz/models/farmer.dart';
import 'package:hackufaz/models/farms.dart';
import 'package:hackufaz/providers/farm_provider.dart';
import 'package:hackufaz/widgets/datetime_field.dart';
import 'package:hackufaz/widgets/text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // static const int column_count = 20;
  static int row_count = 1;

  static Color primaryColor = AppColors.corpMain;
  static Color accentColor = AppColors.corpAccent;

  static FarmerProvider? farmProvider;

  FarmerService farmerService = FarmerService();

  final TextEditingController _regionController = TextEditingController();

  final FocusNode regionFocusNode = FocusNode();

  Farmer farmer = Farmer(
    farmer: FarmerClass(), 
    autumnPloughing: Ploughing(), 
    springPloughing: Ploughing(), 
    seeding: Seeding(), 
    planting: Planting(), 
    irrigation: Ation(), 
    cultivation: Ation(), 
    fertilizing: Fertilizing(), 
    topping: Topping(), 
    efficiency: Efficiency(), 
    quality: Quality(),
  );

  @override
  void initState() {
    super.initState();
    _initInputs();
    _getFarms();
  }

  void _initInputs(){
    _regionController.addListener(() {
      
    });
  }

  Widget _buildFields(String _text){
    return Container(
      color: primaryColor,
      margin: EdgeInsets.all(1),
      child: Center(
          child: Text(
            _text
        )
      )
    );
  }

  void _getFarms() async{

    List<Farms> _data = await farmerService.fetchTable();
    if(farmProvider != null){ 
      farmProvider!.updateFarms(_data); 
    }
    row_count = _data.length;

    rows = List.generate(
        row_count,
        (rowIndex) => ExpandableTableRow(
              height: 50,
              firstCell: Container(
                  color: primaryColor,
                  margin: EdgeInsets.all(1),
                  child: Center(
                      child: Text(
                    farmProvider != null 
                    ? farmProvider!.farms![rowIndex].id.toString()
                    : "",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    // style: textStyle,
                  ))),
              children: <Widget>[
                for (var item in TableConsts.columns) ...[
                  Container(
                      color: primaryColor,
                      margin: EdgeInsets.all(1),
                      child: Center(
                          child: Text(
                            (farmProvider!.farms![rowIndex].toJson())[item.id].toString(),
                            style: TextStyle(
                              color: 
                              item.isIdent
                              ? (int.parse((farmProvider!.farms![rowIndex].toJson())[item.id].toString()) >= 80 
                              ? Colors.green 
                              : int.parse((farmProvider!.farms![rowIndex].toJson())[item.id].toString()) > 60 
                              ? Colors.amber
                              : Colors.red)
                              : Colors.white
                            ),
                      ))
                  )
                ]
              ]
            ));
  }

  ExpandableTableHeader header = ExpandableTableHeader(
        firstCell: Container(
            color: primaryColor,
            margin: EdgeInsets.all(1),
            child: Center(
                child: Text(
              'NO',
              style: TextStyle(color: Colors.white),
              // style: textStyle,
            ))),
        children: List.generate(
            TableConsts.columns.length,
            (index) => Container(
                color: primaryColor,
                margin: EdgeInsets.all(1),
                child: Center(
                    child: Text(
                  TableConsts.columns[index].title,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  // style: textStyle,
                )))));

  List<ExpandableTableRow> rows = [];
//Creation rows
   

  Widget _buildForm(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          AppTextField(
            hintText: "hintText", 
            controller: _regionController, 
            label: "label", 
            focusNode: regionFocusNode,
            textInputAction: TextInputAction.next, 
            // textInputType: TextInputType.number,
            // textFormatters: [FilteringTextInputFormatter.digitsOnly],
            onDone: (){}
          ),
          SizedBox(height: 20,),
          AppTextField(
            hintText: "hintText", 
            controller: _regionController, 
            label: "label", 
            focusNode: regionFocusNode,
            textInputAction: TextInputAction.next, 
            // textInputType: TextInputType.number,
            // textFormatters: [FilteringTextInputFormatter.digitsOnly],
            onDone: (){}
          ),
          SizedBox(height: 20,),
          AppTextField(
            hintText: "hintText", 
            controller: _regionController, 
            label: "label", 
            focusNode: regionFocusNode,
            textInputAction: TextInputAction.next, 
            // textInputType: TextInputType.number,
            // textFormatters: [FilteringTextInputFormatter.digitsOnly],
            onDone: (){}
          ),
          SizedBox(height: 20,),
          AppTextField(
            hintText: "hintText", 
            controller: _regionController, 
            label: "label", 
            focusNode: regionFocusNode,
            textInputAction: TextInputAction.next, 
            // textInputType: TextInputType.number,
            // textFormatters: [FilteringTextInputFormatter.digitsOnly],
            onDone: (){}
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Autumn Ploughing", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  DateTimeField(
                    onValChanged: (val){},
                    label: "label"
                  ),
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Spring Ploughing", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  DateTimeField(
                    onValChanged: (val){},
                    label: "label"
                  ),
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Planting", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  DateTimeField(
                    onValChanged: (val){},
                    label: "label"
                  ),
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Irrigation", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Cultivation", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Fertilizing", style: TextStyle(fontSize: 24),)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Column(
                children: [
                  AppTextField(
                    hintText: "hintText", 
                    controller: _regionController, 
                    label: "label", 
                    focusNode: regionFocusNode,
                    textInputAction: TextInputAction.next, 
                    // textInputType: TextInputType.number,
                    // textFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onDone: (){}
                  ),
                  DateTimeField(
                    onValChanged: (val){},
                    label: "label"
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    farmProvider = Provider.of<FarmerProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              // width: MediaQuery.of(context).size.width * 0.8,
              child: rows.isNotEmpty 
              ? ExpandableTable(
                rows: rows,
                header: header,
                scrollShadowColor: Colors.grey[100]!,
              )
              : Center(
                child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator()),
              )
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  children: [
                     _buildForm(),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}