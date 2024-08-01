import 'package:luedke/models/usuario.dart';
import 'package:luedke/models/vistoria.dart';

class UsuarioVistoria {
  final Usuario usuario;
  final Vistoria vistoria;

  UsuarioVistoria({
    required this.usuario,
    required this.vistoria,
  });
}