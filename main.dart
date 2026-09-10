// Avaliação Formativa I - Programação para Dispositivos Móveis
// Sistema de Emissão de Passagens SkyHorizon

// Exercício 1: Abstração e Classes de Apoio
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

// Exercício 2, 3, 4, 5, 6 e 7: Classe Passagem
class Passagem {
  String? _codigoLocalizador = '';
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Exercício 2: Construtor Não Nomeado
  Passagem() {}

  // Exercício 3: Construtores Nomeados
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

  // Exercício 4: Parâmetros Nomeados
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

  // Exercício 5: Encapsulamento (getter/setter tradicionais)
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

  // Exercício 6: Getters e Setters nativos do Dart
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? valor) {
    if (valor == null || valor.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = valor;
  }

  // Exercício 7: Métodos de negócio
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

// Exercício 9: Mixins
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

// Exercício 8 e 9: Herança + Mixins
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

  // Exercício 10: Sobrescrita Polimórfica
  @override
  void AtualizarPassagem() {
    print('Passagem de Primeira Classe atualizada com sucesso!');
    log('Atualização feita pelo atendente: ${atendente?.nome}');
    auditar('Verificação de segurança realizada para a Primeira Classe');
  }
}

// Exercício 10: Função main() demonstrando o funcionamento de tudo
void main() {
  // Passagem padrão (construtor não nomeado)
  Passagem passagemPadrao = Passagem();
  passagemPadrao.codigoLocalizador = 'VOO001';
  print('Código da passagem padrão: ${passagemPadrao.codigoLocalizador}');
  passagemPadrao.EmitirPassagem();
  passagemPadrao.CancelarPassagem();
  passagemPadrao.AtualizarPassagem();
  passagemPadrao.ConsultarPassagem('VOO001');

  print('---');

  // Passagem usando o construtor nomeado all() com parâmetros nomeados
  Passageiro passageiro1 = Passageiro()
    ..nome = 'Maria Silva'
    ..cpf = '123.456.789-00'
    ..rg = 'MG1234567'
    ..email = 'maria@email.com'
    ..celular = '31999999999';

  PlataformaVenda plataforma1 = PlataformaVenda()
    ..codigoCanal = 1
    ..nomeCanal = 'Site Oficial';

  Atendente atendente1 = Atendente()
    ..nome = 'Carlos Souza'
    ..matricula = 'A001'
    ..cargo = 'Atendente de Balcão'
    ..email = 'carlos@skyhorizon.com'
    ..celular = '31988888888'
    ..salario = 3500.0;

  Passagem passagemAll = Passagem.all(
    'VOO002',
    passageiro: passageiro1,
    plataforma: plataforma1,
    atendente: atendente1,
    observacoes: 'Passageiro solicitou refeição especial',
  );
  print('Código da passagem all(): ${passagemAll.codigoLocalizador}');
  print('Nome do passageiro: ${passagemAll.passageiro?.nome}');

  // Testando validação do setter (código inválido)
  passagemAll.codigoLocalizador = '';

  print('---');

  // PassagemPrimeiraClasse com construtor especializado
  PassagemPrimeiraClasse passagemVip = PassagemPrimeiraClasse(
    'VOO003',
    passageiro: passageiro1,
    plataforma: plataforma1,
    atendente: atendente1,
    observacoes: 'Cliente VIP',
    loungeAcesso: 'Lounge Diamante',
  );
  print('Código da passagem VIP: ${passagemVip.codigoLocalizador}');
  print('Lounge de acesso: ${passagemVip.loungeAcesso}');
  passagemVip.EmitirPassagem();
  passagemVip.AtualizarPassagem(); // chama a versão sobrescrita (polimorfismo)
}