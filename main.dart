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
}