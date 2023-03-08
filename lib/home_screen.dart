import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    "Büşra Balta",
    style: sEncodeSansBold.copyWith(
      color: sDarkBrown,
      fontSize: SizeConfig.blockSizeHorizontal! * 4,
    ),
  );
}
