class ReceitaModel {
  final int id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dtPublicacao;
  final DateTime? dtAtualizacao;

  ReceitaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dtPublicacao,
    this.dtAtualizacao,
  );

  
}
