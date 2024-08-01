import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luedke/components/cadastro_endereco_atual_component.dart';
import 'package:luedke/models/usuario.dart';
import 'package:luedke/shared/arguments.dart';

class CadastroEnderecoAtualPage extends StatefulWidget {
  const CadastroEnderecoAtualPage({super.key});

  @override
  State<CadastroEnderecoAtualPage> createState() =>
      _CadastroEnderecoAtualPageState();
}

class _CadastroEnderecoAtualPageState extends State<CadastroEnderecoAtualPage> {
  late final Usuario usuario;
  late final String senha;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final RouteArguments args =
        ModalRoute.of(context)!.settings.arguments as RouteArguments;
    usuario = args.usuario;
    senha = args.senha;
  }

  @override
  Widget build(BuildContext context) {
    return _buildTela();
  }

  Widget _buildTela() {
    if (!kIsWeb) {
      return Scaffold(
        body: CadastroAtualComponent(usuario: usuario, senha: senha),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fundocadastroenderecoatual.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: Center(
                child: SizedBox(
                  width: 900,
                  height: 900,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(220, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: CadastroAtualComponent(usuario: usuario, senha: senha),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
