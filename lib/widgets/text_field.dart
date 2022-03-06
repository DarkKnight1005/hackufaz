import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String label;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function onDone;
  final TextInputType? textInputType;
  final List<FilteringTextInputFormatter>? textFormatters;
  

  AppTextField({
    required this.hintText,
    required this.controller,
    required this.label,
    required this.focusNode,
    required this.textInputAction,
    required this.onDone,
    this.textInputType,
    this.textFormatters,
    this.isPassword = false,
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
            child: TextField(
                controller: controller,
                // obscureText: isPassword ? !notifier.isVisible : false,
                textInputAction: textInputAction,
                focusNode: focusNode,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: textInputType,
                inputFormatters: textFormatters,
                onSubmitted: (_text){
                  onDone();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color.fromRGBO(142, 158, 206, 1)),
                  contentPadding: new EdgeInsets.only(
                      top: 0, bottom: 0, left: 10, right: 10),
                ),
              ),
            ),
        ],
    );
  }
}
