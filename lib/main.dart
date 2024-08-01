import 'package:flutter/material.dart';
import 'package:luedke/services/messaging_service.dart';
import 'package:luedke/components/splash_screen.dart';
import 'package:luedke/firebase_options.dart';
import 'package:luedke/models/usuario.dart';
import 'package:luedke/pages/alterar_senha_page.dart';
import 'package:luedke/pages/arquivos_page.dart';
import 'package:luedke/pages/cadastro_endereco_atual_page.dart';
import 'package:luedke/pages/cadastro_endereco_obra_page.dart';
import 'package:luedke/pages/cadastro_page.dart';
import 'package:luedke/pages/clientes_page.dart';
import 'package:luedke/pages/configuracoes_page.dart';
import 'package:luedke/pages/cronograma_page.dart';
import 'package:luedke/pages/detalhes_arquivos_page.dart';
import 'package:luedke/pages/detalhes_reunioes_page.dart';
import 'package:luedke/pages/detalhes_vistorias_page.dart';
import 'package:luedke/pages/edit_clientes.dart';
import 'package:luedke/pages/edit_reunioes_page.dart';
import 'package:luedke/pages/edit_vistorias_page.dart';
import 'package:luedke/pages/esqueceu_senha_page.dart';
import 'package:luedke/pages/home_page.dart';
import 'package:luedke/pages/login_page.dart';
import 'package:luedke/pages/reunioes_page.dart';
import 'package:luedke/pages/vistorias_page.dart';
import 'package:luedke/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludke Arquitetura',
      debugShowCheckedModeBanner: false,
      theme: KTextTheme,
      routes: {
        '/': (context) => SplashScreen(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/registrar": (context) => const CadastroPage(),
        "/cadastro-endereco-atual": (context) => const CadastroEnderecoAtualPage(),
        "/cadastro-endereco-obra": (context) => const CadastroEnderecoObraPage(),
        "/clientes": (context) => const ClientesPage(),
        "/reunioes": (context) => const ReunioesPage(),
        "/vistorias": (context) => const VistoriasPage(),
        "/arquivos": (context) => const ArquivosPage(),
        "/detalhe-vistoria": (context) => const DetalhesVistoriaPage(),
        "/edit-vistoria": (context) => const EditVistoriaPage(),
        "/detalhe-reuniao": (context) => const DetalhesReuniaoPage(),
        "/edit-reuniao": (context) => const EditReuniaoPage(),
        "/detalhe-clientes": (context) => EditClientes(),
        "/detalhe-arquivo": (context) => const DetalhesArquivoPage(),
        "/alterar-senha": (context) => const AlterarSenhaPage(),
        "/esqueceu-senha": (context) => const EsqueceuSenhaPage(),
        "/configuracoes": (context) => const ConfiguracoesPage(),
        '/cronograma': (context) => CronogramaPage(usuario: ModalRoute.of(context)!.settings.arguments as Usuario)
      },
      initialRoute: '/',
    );
  }
}