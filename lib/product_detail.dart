import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/counter.dart';
import 'package:clothing_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final Counter _counter = Counter();

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap:() {
          debugPrint('sepete ekle butonuna basın');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: sPaddinHorizontal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: sDarkBrown,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/shopping_cart_icon.svg'),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2),
              RichText(
                text: TextSpan(
                  text: 'Sepete Ekle | \₺999.90',
                  style: sEncodeSansBold.copyWith(
                    color: sWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\₺190.90',
                      style: sEncodeSansRegular.copyWith(
                        color: sWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: SizeConfig.blockSizeHorizontal! *1,
                        decorationColor: sWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: sPaddinHorizontal),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 50,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/image_product_detail.png',
                        height: SizeConfig.blockSizeVertical! * 50,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: sWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: sBrown.withOpacity(0.11),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  'assets/arrow_back_icon.svg'),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: sWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: sBrown.withOpacity(0.11),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                  'assets/favorite_black_icon.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Modern hafif elbiseler",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: sEncodeSansSemiBold.copyWith(
                        color: sDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 7,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _decrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: sBorderColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: sWhite,
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: sGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      Text(
                        _counter.value.toString(),
                        style: sEncodeSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: sDarkBrown,
                        ),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: sBorderColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: sWhite,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: sDarkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 18,
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.all(2),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: sYellow,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    unratedColor: sLightGrey,
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      text: '5.0',
                      style: sEncodeSansRegular.copyWith(
                        color: sDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(1453 inceleme)',
                          style: sEncodeSansRegular.copyWith(
                            color: sBlue,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ReadMoreText(
                'Slip elbise modelleri genelde elbisenin eteğinde ya da yakasında dantelin olduğu, gecelik ile elbise arasında söyleyebileceğimiz saten, ipek gibi kumaşlardan tasarlanan ince elbiselerdir.  Slip elbiseler genelde saten ve ipek kumaştan üretilir ve spagetti dediğimiz ince ip gibi askıları olur. Bazen de geceliklerde olduğu gibi slip elbiseler güpürler ve dantellerle süslenir. Yaz için hafif ve sade elbiselerdir.',
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: ' ',
                trimCollapsedText: 'Devamını Oku...',
                trimExpandedText: 'Daha Az Göster',
                style: sEncodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: sDarkGrey,
                ),
                moreStyle: sEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: sDarkBrown,
                ),
                lessStyle: sEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: sDarkBrown,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                height: 1,
                color: sLightGrey,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beden Seç',
                        style: sEncodeSansBold.copyWith(
                          color: sDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sWhite,
                            ),
                            child: Center(
                              child: Text(
                                'S',
                                style: sEncodeSansRegular.copyWith(
                                  color: sDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sWhite,
                            ),
                            child: Center(
                              child: Text(
                                'M',
                                style: sEncodeSansRegular.copyWith(
                                  color: sDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sDarkBrown,
                            ),
                            child: Center(
                              child: Text(
                                'L',
                                style: sEncodeSansBold.copyWith(
                                  color: sWhite,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sWhite,
                            ),
                            child: Center(
                              child: Text(
                                'XL',
                                style: sEncodeSansRegular.copyWith(
                                  color: sDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Renk Seç',
                        style: sEncodeSansBold.copyWith(
                          color: sDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sLightGrey,
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sDarkBrown,
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: sLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: sBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
