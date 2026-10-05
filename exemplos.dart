import '../models/livro.dart';
List<Livro> livrosDeExemplo() => [
  Livro.novo(titulo: 'Dom Casmurro', autor: 'Machado de Assis', formato: Formato.impresso, genero: 'Romance', status: StatusLivro.queroLer),
  Livro.novo(titulo: 'O Hobbit', autor: 'J. R. R. Tolkien', formato: Formato.ebook, genero: 'Fantasia', status: StatusLivro.lendo, paginas: 80),
  Livro.novo(titulo: 'A Metamorfose', autor: 'Franz Kafka', formato: Formato.bolso, genero: 'Outros', status: StatusLivro.concluido, paginas: 96, nota: 5),
];
