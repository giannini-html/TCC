import 'package:luedke/models/usuario.dart';
import 'package:luedke/models/reuniao.dart';

class UsuarioReuniao {
  final Usuario usuario;
  final Reuniao reuniao;

  UsuarioReuniao({
    required this.usuario,
    required this.reuniao,
  });
}