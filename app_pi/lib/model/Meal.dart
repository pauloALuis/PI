class Meal {
  String _idMeal;
  String _nomePrato;
  String _tipoRefeicao;
  String _sobremesa;
  DateTime _data;
  String _bebida;
  String _sopa;
  String _acompanhamento;
  String _urlpic;
  int _qntDisponivel;




  Meal(
      this._nomePrato,
      this._sopa,
      this._sobremesa,
      this._bebida,
      this._acompanhamento,
      this._urlpic,
      this._tipoRefeicao,
      this._qntDisponivel,
      this._data,
      this._idMeal
    );


  @override
  String toString() {
    return 'Refeicao{idMeal: $_idMeal,_nomePrato: $_nomePrato, _tipoRefeicao: $_tipoRefeicao, '
        '_sobremesa: $_sobremesa, _data: $_data, _bebida: $_bebida, '
        '_sopa: $_sopa, _acompanhamento: $_acompanhamento, _urlpic: $_urlpic,'
        ' _qntDisponivel: $_qntDisponivel}';
  }
  String get idMeal => _idMeal;

  set idMeal(String value) {
    _idMeal = value;
  }
  String get tipoRefeicao => _tipoRefeicao;

  set tipoRefeicao(String value) {
    _tipoRefeicao = value;
  }

  String get nomePrato => _nomePrato;

  set nomePrato(String value) => _nomePrato = value;

  String get sobremesa => _sobremesa;

  set sobremesa(String value) {
    _sobremesa = value;
  }

  DateTime get data => _data;

  set data(DateTime value) {
    _data = value;
  }

  String get bebida => _bebida;

  set bebida(String value) {
    _bebida = value;
  }

  String get sopa => _sopa;

  set sopa(String value) {
    _sopa = value;
  }

  String get acompanhamento => _acompanhamento;

  set acompanhamento(String value) {
    _acompanhamento = value;
  }

  String get urlpic => _urlpic;//urlpic

  set urlpic(String value) {
    _urlpic = value;
  }

  int get qntDisponivel => _qntDisponivel;

  set qntDisponivel(int value) {
    _qntDisponivel = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Meal &&
              runtimeType == other.runtimeType &&
              _nomePrato == other._nomePrato &&
              _tipoRefeicao == other._tipoRefeicao &&
              _sobremesa == other._sobremesa &&
              _bebida == other._bebida &&
              _sopa == other._sopa &&
              _acompanhamento == other._acompanhamento &&
              _urlpic == other._urlpic &&
              _qntDisponivel == other._qntDisponivel;

  @override
  int get hashCode =>
      _nomePrato.hashCode ^
      _tipoRefeicao.hashCode ^
      _sobremesa.hashCode ^
      _bebida.hashCode ^
      _sopa.hashCode ^
      _acompanhamento.hashCode ^
      _urlpic.hashCode ^
      _qntDisponivel.hashCode;



}