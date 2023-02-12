import 'package:animations_course/menu/animation_curves_page.dart';
import 'package:animations_course/menu/implicit_animations_page.dart';
import 'package:animations_course/menu/matrix4_page.dart';
import 'package:animations_course/menu/transform_page.dart';
import 'package:animations_course/menu/tween_animations_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animation Types'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            menuItem(
              title: 'Implicit Animations',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ImplicitAnimationsPage(),
                  ),
                );
              },
            ),
            menuItem(
              title: 'Transform',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const TransformPage(),
                  ),
                );
              },
            ),
            menuItem(
              title: 'Matrix4',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Matrix4Page(),
                  ),
                );
              },
            ),
            menuItem(
              title: 'Animation Curves',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AnimationCurvesPage(),
                  ),
                );
              },
            ),
            menuItem(
              title: 'Tween Animations',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const TweenAnimationsPage(),
                  ),
                );
              },
              needPadding: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem({required String title, required VoidCallback onTap, bool? needPadding}) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: needPadding == false ? 0 : 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.navigate_next_rounded,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
