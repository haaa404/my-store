import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.onSubmit,
      required this.controller,
      required this.hint});

  final TextEditingController controller;
  final  Function onSubmit;
  final String hint;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
   OutlineInputBorder border(Color color){
     return OutlineInputBorder(
       borderSide: BorderSide(
         color: color,
       ),
       borderRadius: BorderRadius.circular(8),
     );
   }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .9,
        height: 45,
        child: TextField(
          onSubmitted: (value){
            widget.onSubmit();
          },
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.black87, size: 20,),
            border: border(Colors.grey),
            hintText: 'search',
            focusedBorder: border(Colors.black),
          ),
        ),
      ),
    );
  }
}
