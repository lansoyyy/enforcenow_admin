import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String? hint;
  bool? isObscure;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final int? maxLine;
  final TextInputType? inputType;
  final bool? isPassword;
  final bool? isEmail;
  final Color? textcolor;

  TextFieldWidget(
      {super.key,
      required this.label,
      this.hint = '',
      required this.controller,
      this.isObscure = false,
      this.width = 300,
      this.textcolor = Colors.white,
      this.height = 40,
      this.maxLine = 1,
      this.isPassword = false,
      this.isEmail = false,
      this.inputType = TextInputType.text});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRegular(text: widget.label, fontSize: 12, color: widget.textcolor!),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              textCapitalization: widget.isEmail! && widget.isPassword!
                  ? TextCapitalization.none
                  : TextCapitalization.words,
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: widget.isPassword!
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isObscure = !widget.isObscure!;
                          });
                        },
                        icon: widget.isObscure!
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      )
                    : const SizedBox(),
                hintText: widget.hint,
                border: InputBorder.none,
              ),
              maxLines: widget.maxLine,
              obscureText: widget.isObscure!,
              controller: widget.controller,
            ),
          ),
        ),
      ],
    );
  }
}
