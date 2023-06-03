import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'page1_details.dart';
import 'page1_model.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListState();
}

class _ListState extends State<ListUser> {
  List<User> users = [];

  Future<List<User>> _getUser() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    final response2 =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    final dados = json.decode(response.body);
    final dados2 = json.decode(response2.body);

    final dadosList = dados['data'];
    final dadosList2 = dados2['data'];

    for (var element in dadosList) {
      User user = User(element['id'], element['email'], element['first_name'],
          element['last_name'], element['avatar']);
      users.add(user);
    }
    for (var element in dadosList2) {
      User user = User(element['id'], element['email'], element['first_name'],
          element['last_name'], element['avatar']);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUser(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: Text('Carregando...'));
        } else {
          return ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              scrollDirection: Axis.vertical,
              itemBuilder: (context2, index) => ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page1Details(
                            id: snapshot.data?[index].id,
                            nome:
                                '${snapshot.data?[index].firstName}${snapshot.data?[index].lastName}',
                            email: snapshot.data?[index].email,
                            avatar: snapshot.data?[index].avatar),
                      ),
                    ),
                    style: ListTileStyle.list,
                    splashColor: Colors.grey,
                    title: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: AlignmentDirectional.center,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 9,
                              offset: const Offset(3, 6),
                            )
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                            child: Image.network(
                              '${snapshot.data?[index].avatar}',
                              fit: BoxFit.cover,
                              width: 120,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data?[index].firstName} ${snapshot.data?[index].lastName}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${snapshot.data?[index].email}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              itemCount: users.length);
        }
      },
    );
  }
}
