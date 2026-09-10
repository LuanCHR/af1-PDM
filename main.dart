class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

class Passagem {
  String? _codigoLocalizador = '';
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  Passagem() {}

  Passagem.somenteCodigo(String codigoLocalizador) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(String codigoLocalizador, Passageiro? passageiro,
      PlataformaVenda? plataforma, Atendente? atendente, String? observacoes) {
    _codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro}) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.all(String codigoLocalizador,
      {required Passageiro? passageiro,
      required PlataformaVenda? plataforma,
      required Atendente? atendente,
      String? observacoes}) {
    _codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? valor) {
    if (valor == null || valor.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = valor;
  }

  void EmitirPassagem() {
    print('Passagem emitida com sucesso!');
  }

  bool CancelarPassagem() {
    print('Passagem cancelada com sucesso!');
    return true;
  }

  void AtualizarPassagem() {
    print('Passagem atualizada com sucesso!');
  }

  Passagem ConsultarPassagem(String codigo) {
    print('Passagem consultada com sucesso!');
    return Passagem();
  }
}

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print('[Auditoria]: $mensagem');
  }
}

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(String codigoLocalizador,
      {required Passageiro? passageiro,
      required PlataformaVenda? plataforma,
      required Atendente? atendente,
      String? observacoes,
      required this.loungeAcesso})
      : super.all(codigoLocalizador,
            passageiro: passageiro,
            plataforma: plataforma,
            atendente: atendente,
            observacoes: observacoes);
}