import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flypers/widgets/appColors.dart';

class SearchBarModel extends StatefulWidget {
  const SearchBarModel({Key? key}) : super(key: key);

  @override
  State<SearchBarModel> createState() => _SearchBarModelState();
}

class _SearchBarModelState extends State<SearchBarModel> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _expanded ? MediaQuery.of(context).size.width - 20.w : 44.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        color: AppColors.colorWhite,
      ),
      child: Row(
        children: [
          Material(
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(
                _expanded ? Icons.close : Icons.search,
                color: AppColors.colorBlack,
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: _expanded
                ? const TextField(
                    cursorColor: AppColors.colorBlack,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: AppColors.colorBlack),
                        contentPadding: EdgeInsets.fromLTRB(10, 8, 20, 10),
                        border: InputBorder.none),
                  )
                : null,
          )),
        ],
      ),
    );
  }
}
