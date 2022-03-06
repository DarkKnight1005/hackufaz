import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimeField extends StatelessWidget {
  // final String hintText;
  // final bool isPassword;
  final String label;
  // final FocusNode focusNode;
  // final TextInputAction textInputAction;
  // final TextEditingController controller;
  // final Function onDone;
  // final TextInputType? textInputType;
  // final List<FilteringTextInputFormatter>? textFormatters;
  final Function(DateTime value) onValChanged;
  

  DateTimeField({
    required this.onValChanged,
    // required this.hintText,
    // required this.controller,
    required this.label,
    // required this.focusNode,
    // required this.textInputAction,
    // required this.onDone,
    // this.textInputType,
    // this.textFormatters,
    // this.isPassword = false,
  });

  @protected
  Widget extendWidget(){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.label,
                  style: TextStyle(
                    color: Color.fromRGBO(75, 87, 123, 1),
                    fontSize: 18,
                  ),
                ),
                extendWidget(),
              ],
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white,
            ),
            child: Container(
              height: 300,
              width: 300,
              child: SfDateRangePicker(
                onSelectionChanged: (val){
                  onValChanged(val.value);
                  debugPrint(val.value.toString());
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            ),
        ],
    );
  }
}
