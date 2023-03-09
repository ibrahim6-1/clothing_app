import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> categories =[
    "Tüm Eşyalar",
    "Elbiseler",
    "Şapka",
    "Saat",
  ];

  List<String> icon =[
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];

  List<String> images =[
    'images-01',
    'images-02',
    'images-03',
    'images-04',
    'images-05',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sPaddinHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextClassName().welcomeText,
                    TextClassName().nameText,
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: sGrey,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sPaddinHorizontal),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: sEncodeSansRegular.copyWith(
                      color: sDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 13),
                        prefixIcon: const IconTheme(
                          data: IconThemeData(
                            color: sDarkGrey,
                          ),
                          child: Icon(Icons.search),
                        ),
                        hintText: "Kıyafet ara...",
                        border: sInputBorder,
                        errorBorder: sInputBorder,
                        disabledBorder: sInputBorder,
                        focusedBorder: sInputBorder,
                        focusedErrorBorder: sInputBorder,
                        enabledBorder: sInputBorder,
                        hintStyle: sEncodeSansRegular.copyWith(
                          color: sDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        )),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 49,
                  width: 49,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sBorderRadius),
                    color: sBlack,
                  ),
                  child: SvgPicture.asset("assets/filter_icon.svg"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextClassName {
  Text welcomeText = Text(
    "Merhaba, Hoşgeldin👋",
    style: sEncodeSansRegular.copyWith(
      color: sDarkBrown,
      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
    ),
  );

  Text nameText = Text(
    "Aylin Balta",
    style: sEncodeSansBold.copyWith(
      color: sDarkBrown,
      fontSize: SizeConfig.blockSizeHorizontal! * 4,
    ),
  );
}
