import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luedke/components/botao_component.dart';
import 'package:luedke/models/endereco.dart';
import 'package:luedke/models/result_cep.dart';
import 'package:luedke/models/usuario.dart';
import 'package:luedke/shared/arguments.dart';
import 'package:luedke/shared/constants.dart';
import 'package:http/http.dart' as http;

class CadastroAtualComponent extends StatefulWidget {
  final Usuario usuario;
  final String senha;

  const CadastroAtualComponent({
    super.key,
    required this.usuario,
    required this.senha,
  });

  @override
  State<CadastroAtualComponent> createState() => _CadastroAtualComponent();
}

class _CadastroAtualComponent extends State<CadastroAtualComponent> {
  final _key = GlobalKey<FormState>();
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  double largura = 400;
  double tamanhoFonte = 30;

  @override
  Widget build(BuildContext context) {
    double tamanhoTela = MediaQuery.of(context).size.width;
    if (tamanhoTela < 1000) {
      largura = 400;
    } else if (tamanhoTela < 1600) {
      largura = tamanhoTela / 2;
      tamanhoFonte = 35;
    } else {
      largura = tamanhoTela / 2.5;
      tamanhoFonte = 40;
    }
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Text(
                    'Endereço Atual',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: tamanhoFonte,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCep(),
                  const SizedBox(height: 20),
                  _buildLogradouro(),
                  const SizedBox(height: 20),
                  _buildNumero(),
                  const SizedBox(height: 20),
                  _buildComplemento(),
                  const SizedBox(height: 20),
                  _buildBairro(),
                  const SizedBox(height: 20),
                  _buildCidade(),
                  const SizedBox(height: 20),
                  _buildEstado(),
                  const SizedBox(height: 20),
                  _buildButton(widget.usuario),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildCep() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: cepController,
        keyboardType: TextInputType.number,
        validator: (cep) {
          if (cep == null || cep.isEmpty) {
            return "Por favor, digite um CEP número válido";
          }
          return null;
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CepInputFormatter(),
        ],
        decoration: inputDec(null, 'CEP'),
        onChanged: (cep) {
          if (cep.length == 10) {
            _buscarCep();
          }
        },
      ),
    );
  }

  SizedBox _buildLogradouro() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: logradouroController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo logradouro vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Logradouro'),
      ),
    );
  }

  SizedBox _buildNumero() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: numeroController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo Número vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Número'),
      ),
    );
  }

  SizedBox _buildComplemento() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: complementoController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo Complemento vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Complemento'),
      ),
    );
  }

  SizedBox _buildBairro() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: bairroController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo bairro vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Bairro'),
      ),
    );
  }

  SizedBox _buildCidade() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: cidadeController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo cidade vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Cidade'),
      ),
    );
  }

  SizedBox _buildEstado() {
    return SizedBox(
      width: largura,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: estadoController,
        validator: (log) {
          if (log == null || log.isEmpty) {
            return "Campo estado vazio";
          }
          return null;
        },
        decoration: inputDec(null, 'Estado'),
      ),
    );
  }

  Widget _buildButton(Usuario usuario) {
    return BotaoWidget(
      text: 'Próximo',
      onPress: () {
        onTapBtnProximo(usuario);
      },
    );
  }

  void onTapBtnProximo(Usuario usuario) {
    if (_key.currentState!.validate()) {
      // final service = AuthService();

      Endereco endAtual = Endereco(
        cep: cepController.text,
        logradouro: logradouroController.text,
        numero: numeroController.text,
        complemento: complementoController.text,
        bairro: bairroController.text,
        cidade: cidadeController.text,
        estado: estadoController.text,
      );

      usuario.enderecoAtual = endAtual;

      Navigator.pushReplacementNamed(
        context,
        "/cadastro-endereco-obra",
        arguments: RouteArguments(usuario, widget.senha),
      );
    } else {
      _exibirMensagem("Preencha todos os campos");
    }
  }

  void _exibirMensagem(String mensagem) {
    final snackbar = SnackBar(content: Text(mensagem));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _buscarCep() async {
    String cep = cepController.text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove qualquer caractere que não seja um dígito
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      ResultCep cepResult = ResultCep.fromJson(response.body);
      try {
        logradouroController.text = cepResult.logradouro!;
        bairroController.text = cepResult.bairro!;
        cidadeController.text = cepResult.localidade!;
        estadoController.text = cepResult.uf!;
      } catch (e) {
        _exibirMensagem('CEP não encontrado!');
      }
    } else {
      _exibirMensagem('CEP não encontrado!');
    }
  }
}
