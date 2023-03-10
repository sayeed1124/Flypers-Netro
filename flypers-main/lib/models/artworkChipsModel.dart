import 'package:flutter/material.dart';
import 'package:flypers/screens/animeScreen.dart';

import '../widgets/appColors.dart';

class ArtworkChipsModel extends StatefulWidget {
  const ArtworkChipsModel({Key? key}) : super(key: key);

  @override
  State<ArtworkChipsModel> createState() => _ArtworkChipsModelState();
}

class _ArtworkChipsModelState extends State<ArtworkChipsModel> {
  List<String> _data = [
    "Anime",
    "Blue",
    "Tag",
    "Tag2",
    "Tag3",
    "Tag4",
  ];
  String? _selectedData;

  _onSelected(String data) {
    setState(() {
      _selectedData = data;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AnimeScreen(),
      ),
    );
  }

  TextStyle _selectedStyle = TextStyle(
    color: Colors.white,
    // Set any other style properties as per your design requirements
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            children: [
              Wrap(
                spacing: 5,
                children: _data.map((data) {
                  return FilterChip(
                    showCheckmark: false,
                    backgroundColor: _selectedData == data
                        ? AppColors.colorPrimary
                        : AppColors.colorWhite,
                    label: Text(
                      data,
                      style: _selectedData == data
                          ? _selectedStyle
                          : TextStyle(color: AppColors.colorBlackMidEmp),
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(color: AppColors.colorWhiteLowEmp),
                    ),
                    padding: EdgeInsets.all(5),
                    onSelected: (_) => _onSelected(data),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
