import 'package:animations_course/hero/users_list_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(person.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: person.id,
            child: SizedBox(
              width: double.infinity,
              height: 400,
              child: Image.asset(
                person.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            person.name,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${person.age} years old',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
