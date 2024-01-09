import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/routes.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    super.initState();
    initSlideAnimated();
    NavToHome();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: sliderAnimation,
          builder: (context, child) => SlideTransition(
            position: sliderAnimation,
            child: const Center(
              child: Text('akd'),
            ),
          ),
        ),
      ],
    );
  }

  void initSlideAnimated() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sliderAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(animationController);
    sliderAnimation.addListener(() {});
    animationController.forward();
  }

  void NavToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(const HomeView(),
      // transition: Transition.downToUp, duration: TransitionDuretion);
      GoRouter.of(context).push(khomeview);
    });
  }
}
