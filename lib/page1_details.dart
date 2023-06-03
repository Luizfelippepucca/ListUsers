import 'package:flutter/material.dart';

class Page1Details extends StatelessWidget {
  final int? id;
  final String? nome;
  final String? email;
  final String? avatar;

  const Page1Details({
    super.key,
    this.id,
    this.nome,
    this.email,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome as String),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              avatar as String,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text('id: $id', style: const TextStyle(fontSize: 30)),
            Text(
              'email: $email',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
