import 'package:flutter/material.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: color.AppColor.companyWhiteColor,
        boxShadow: [
          BoxShadow(
            color: color.AppColor.companyBlackColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: widget.onChanged,
          cursorColor: color.AppColor.lightGreenColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: color.AppColor.companyWhiteColor,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: color.AppColor.companyWhiteColor,
                width: 0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: color.AppColor.companyWhiteColor,
                width: 0,
              ),
            ),
            hintText: 'Buscar',
            hintStyle: TextStyle(
              color: color.AppColor.darkGrayColor.withOpacity(0.7),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: controller.text.isEmpty
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 25,
                    ),
                    color: color.AppColor.darkGrayColor.withOpacity(0.7),
                  )
                : IconButton(
                    onPressed: () {
                      controller.clear();
                      widget.onChanged('');
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 25,
                    ),
                    color: color.AppColor.darkGrayColor.withOpacity(0.7),
                  ),
          ),
          style: TextStyle(
            color: color.AppColor.darkGrayColor,
            fontSize: 18,
          ),
          autocorrect: false,
          textCapitalization: TextCapitalization.sentences,
          enableSuggestions: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
