import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luedke/pages/home_page.dart';
import 'package:luedke/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // Chama o método para verificar se o usuário está autenticado
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Aguarde a verificação do estado de autenticação
    await Future.delayed(Duration(seconds: 2)); // Simulação de verificação

    // Obtenha o usuário atualmente autenticado
    final currentUser = _auth.currentUser;

    // Navegue para a página apropriada com base no estado de autenticação
    if (currentUser != null) {
      // Se o usuário estiver autenticado, navegue para a página principal
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      // Caso contrário, navegue para a tela de login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine o tamanho da tela
    double screenWidth = MediaQuery.of(context).size.width;

    // Defina os tamanhos do logo para diferentes dispositivos
    double logoSize;
    if (screenWidth < 600) {
      // Tamanho para telas de celular
      logoSize = screenWidth * 0.5; // 50% da largura da tela
    } else {
      // Tamanho para telas de PC
      logoSize = 200; // 200 pixels
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 164, 160),
      body: Center(
        child: Container(
          width: logoSize,
          height: logoSize,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo_ludke.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
