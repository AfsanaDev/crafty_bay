import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
    required this.sliders,
  });

  final List<SliderModel> sliders;
  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            onPageChanged: (int currentInderx, _) {
              _currentSlider.value = currentInderx;
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: widget.sliders.map((Slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(Slider.photoUrl),
                        fit: BoxFit.cover,
                      )),
                  alignment: Alignment.center,
                  // child: Text(
                  //   '${Slider.description}',
                  //   style: TextStyle(fontSize: 16.0),
                  // )
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _currentSlider,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.sliders.length; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(left: 2),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade400, width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                        color: index == i ? AppColors.themeColor : null,
                      ),
                    ),
                ],
              );
            })
      ],
    );
  }
}
