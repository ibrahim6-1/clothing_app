import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "Tüm Eşyalar",
    "Elbiseler",
    "Şapka",
    "Saat",
  ];

  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];

  List<String> image = [
    'image-01.png',
    'image-02.png',
    'image-03.png',
    'image-04.png',
    'image-05.jpg',
    'image-06.jpg',
    'image-07.jpg',
    'image-08.jpg',
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 8),
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? sPaddinHorizontal : 15,
                        right: index == categories.length - 1
                            ? sPaddinHorizontal
                            : 0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? sBrown : sWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(
                              color: sLightGrey,
                              width: 1,
                            ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(current == index
                            ? 'assets/${icons[index]}_selected.svg'
                            : 'assets/${icons[index]}_unselected.svg'),
                        const SizedBox(width: 4),
                        Text(
                          categories[index],
                          style: sEncodeSansMedium.copyWith(
                            color: current == index ? sWhite : sDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 31),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: image.length,
            padding: const EdgeInsets.symmetric(horizontal: sPaddinHorizontal),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(sBorderRadius),
                          child: Image.asset(
                            'assets/images/${image[index]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/favorite_cloth_icon_unselected.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Modern Hafif Elbiseler',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: sEncodeSansSemiBold.copyWith(
                      color: sDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    'Modern Elbise',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: sEncodeSansRegular.copyWith(
                      color: sGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '361.99 ₺',
                        style: sEncodeSansSemiBold.copyWith(
                          color: sDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: sYellow,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '5.0',
                            style: sEncodeSansRegular.copyWith(
                              color: sDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            },
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
    "Hava Balta",
    style: sEncodeSansBold.copyWith(
      color: sDarkBrown,
      fontSize: SizeConfig.blockSizeHorizontal! * 4,
    ),
  );
}
