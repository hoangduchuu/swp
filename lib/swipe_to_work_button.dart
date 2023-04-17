import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swipe_button/app_styles.dart';
import 'package:swipe_button/app_svg.dart';
import 'package:swipe_button/component_space.dart';
import 'package:swipe_button/swipable_widget.dart';

class SwipingButton extends StatefulWidget {
  const SwipingButton({Key? key}) : super(key: key);

  @override
  State<SwipingButton> createState() => _SwipingButtonState();
}

class _SwipingButtonState extends State<SwipingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var rightPositionValue = 12.5.w;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              //FIXME: Tu: missing color from palette
              colors: [Color(0xfff7f4ff), Color(0xffdfd3fe)],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'SWIPE TO WORK',
                  style: AppStyles.get().merge(
                    TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ComponentSpace(
                      width: Tween<double>(
                        begin: 3.w,
                        end: 0.w,
                      )
                          .animate(
                        CurvedAnimation(
                          parent: _controller,
                          curve: const Interval(0.0, 0.1),
                        ),
                      )
                          .value,
                    ),
                    Expanded(
                      child: SwipeableWidget(
                        height: Tween<double>(
                          begin: 52.h,
                          end: 60.h,
                        )
                            .animate(
                          CurvedAnimation(
                            parent: _controller,
                            curve: const Interval(0.0, 0.1),
                          ),
                        )
                            .value,
                        onSwipeCallback: () {},
                        onSwipeStartcallback: (val, conVal) {
                          // _controller.duration = Duration(milliseconds: (2000* conVal).toInt());
                          if (conVal == 1) {
                            //future delay
                            Future.delayed(Duration.zero, () {
                              rightPositionValue = TweenSequence([
                                TweenSequenceItem(
                                    tween: Tween<double>(
                                        begin: 12.5.w, end: 24.5.w),
                                    weight: 1),
                                TweenSequenceItem(
                                    tween: Tween<double>(
                                        begin: 24.5.w, end: 24.5.w),
                                    weight: 1),
                                TweenSequenceItem(
                                    tween: Tween<double>(
                                        begin: 24.5.w, end: -100.0.w),
                                    weight: 1),
                              ]).animate(_controller).value;
                            });
                          } else if (val) {
                            _controller.forward();
                            rightPositionValue = TweenSequence([
                              TweenSequenceItem(
                                  tween:
                                  Tween<double>(begin: 12.5.w, end: 30.0.w),
                                  weight: 1),
                            ])
                                .animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: const Interval(0.0, 0.1),
                              ),
                            )
                                .value;
                          }

                          if (val == false && conVal == 0) {
                            _controller.reverseDuration =
                            const Duration(milliseconds: 400);
                            _controller.reverse();
                            rightPositionValue = TweenSequence([
                              TweenSequenceItem(
                                  tween:
                                  Tween<double>(begin: 12.5.w, end: 12.5.w),
                                  weight: 1),
                            ])
                                .animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: const Interval(0.4, 0.6),
                              ),
                            )
                                .value;
                          }
                        },
                        screenSize: Get.width - 38,
                        child: Container(
                          width: 52.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Colors.purple.withOpacity(0.8)
                          ),
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Stack(
                                children: [
                                  Positioned(
                                    right: TweenSequence([
                                      TweenSequenceItem(
                                          tween: Tween<double>(
                                              begin: 12.5.w, end: 24.5.w),
                                          weight: 1),
                                      TweenSequenceItem(
                                          tween: Tween<double>(
                                              begin: 24.5.w, end: 24.5.w),
                                          weight: 1),
                                      TweenSequenceItem(
                                          tween: Tween<double>(
                                              begin: 24.5.w, end: -100.0.w),
                                          weight: 1),
                                    ])
                                        .animate(
                                      CurvedAnimation(
                                        parent: _controller,
                                        curve: const Interval(0.7, 1),
                                      ),
                                    )
                                        .value,
                                    // +2
                                    top: 16.5.h,
                                    bottom: 16.5.h,
                                    //animate rotate z
                                    child: ScaleTransition(
                                      scale: Tween<double>(
                                          begin: 1.0, end: 427 / 300)
                                          .animate(
                                        CurvedAnimation(
                                          parent: _controller,
                                          curve: const Interval(0.0, 0.2),
                                        ),
                                      ),
                                      child: Transform.rotate(
                                        angle: Tween<double>(
                                            begin: 0.0, end: 0.4)
                                            .animate(
                                          CurvedAnimation(
                                            parent: _controller,
                                            curve: const Interval(0.0, 0.2),
                                          ),
                                        )
                                            .value,
                                        child: SvgPicture.asset(
                                          AppSvg.iconFlight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
