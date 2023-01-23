class ReceitaModel {
  final int? id;
  final String titulo;
  final String descricao;
  //final String imagem;
  final DateTime dtPublicacao;
  final DateTime? dtAtualizacao;

  ReceitaModel(
    this.id,
    this.titulo,
    this.descricao,
    //this.imagem,
    this.dtPublicacao,
    this.dtAtualizacao,
  );

  factory ReceitaModel.fromJson(Map map) {
    return ReceitaModel(
      map['id'] ?? '',
      map['titulo'],
      map['descricao'],
      //map['imagem'],
      DateTime.now(),
      map['dtAtualizacao'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map['dtAtualizacao'])
          : null,
    );
  }

  Map toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
    };
  }

  @override
  String toString() {
    return 'ReceitaModel(id: $id, titulo: $titulo, descricao: $descricao, dtPublicacao: $dtPublicacao, dtAtualizacao: $dtAtualizacao)';
  }
}
