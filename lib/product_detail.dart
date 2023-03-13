import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/counter.dart';
import 'package:clothing_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
