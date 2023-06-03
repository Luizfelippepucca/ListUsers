import 'package:flutter/material.dart';

enum Gender {
  masculino,
  feminino,
  outro,
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '';
  String senha = '';
  bool acceptTems = false;
  String error = '';

  Gender genero = Gender.masculino;

  void handleLogin() {
    if (email != '' && email.contains('@') && senha != '' && acceptTems) {
      Navigator.pushNamed(context, 'page1');
      return;
    }

    if (email != '' && email.contains('@') && senha != '' && !acceptTems) {
      setState(() {
        error = 'Precisa aceitar os termos de uso';
      });
      return;
    }

    if (email != '' && !email.contains('@')) {
      setState(() {
        error = 'Email inválido';
      });
      return;
    }

    if (email == '' || senha == '') {
      setState(() {
        error = 'Dados imcompletos';
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Pagina de login'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              error == ''
                  ? const Text(
                      'Insira seus dados',
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      error,
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'email',
                ),
                onChanged: (value) => email = value,
                keyboardType: TextInputType.emailAddress,
                maxLength: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'senha',
                ),
                onChanged: (value) => senha = value,
              ),
              Row(
                children: [
                  Checkbox(
                      value: acceptTems,
                      onChanged: (checked) => setState(() {
                            acceptTems = checked!;
                          })),
                  const Text('Concordo com os termos de uso'),
                ],
              ),
              const Text('Esqueceu sua senha?'),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  ),
                  onPressed: () => handleLogin(),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
