// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations_course/hero/details_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const uuid = Uuid();
    final people = <Person>[
      Person(id: uuid.v4(), name: 'Jane', age: 21, imagePath: 'assets/images/jane.jpg'),
      Person(id: uuid.v4(), name: 'John', age: 20, imagePath: 'assets/images/john.jpg'),
      Person(id: uuid.v4(), name: 'Jack', age: 22, imagePath: 'assets/images/jack.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('People'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => DetailsPage(
                  person: person,
                ),
              ),
            ),
            leading: Hero(
              tag: person.id,
              // flightShuttleBuilder: (
              //   flightContext,
              //   animation,
              //   flightDirection,
              //   fromHeroContext,
              //   toHeroContext,
              // ) {
              //   switch (flightDirection) {
              //     case HeroFlightDirection.push:
              //       return Material(
              //         color: Colors.transparent,
              //         child: ScaleTransition(
              //           scale: animation.drive(
              //             Tween<double>(
              //               begin: 0,
              //               end: 1,
              //             ).chain(
              //               CurveTween(
              //                 curve: Curves.ease,
              //               ),
              //             ),
              //           ),
              //           child: toHeroContext.widget,
              //         ),
              //       );
              //     case HeroFlightDirection.pop:
              //       return Material(
              //         color: Colors.transparent,
              //         child: ScaleTransition(
              //           scale: animation.drive(
              //             Tween<double>(
              //               begin: 0,
              //               end: 1,
              //             ).chain(
              //               CurveTween(
              //                 curve: Curves.ease,
              //               ),
              //             ),
              //           ),
              //           child: fromHeroContext.widget,
              //         ),
              //       );
              //   }
              // },
              child: CircleAvatar(
                backgroundImage: AssetImage(person.imagePath),
              ),
            ),
            title: Text(person.name),
            subtitle: Text('${person.age} years old'),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          );
        },
      ),
    );
  }
}

class Person {
  final String id;
  final String name;
  final int age;
  final String imagePath;
  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.imagePath,
  });
}
