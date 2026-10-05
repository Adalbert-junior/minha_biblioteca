import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minha_biblioteca/app.dart';
import 'package:minha_biblioteca/data/repositorio.dart';
import 'package:minha_biblioteca/models/livro.dart';
import 'package:minha_biblioteca/state/acervo.dart';
import 'package:minha_biblioteca/state/modo_tema.dart';
import 'package:minha_biblioteca/widgets/livro_card.dart';

Finder campo(String rotulo) => find.byWidgetPredicate((w) => w is TextField && w.decoration?.labelText == rotulo);
Future<Acervo> montar(WidgetTester tester) async {
  final acervo = Acervo(RepositorioMemoria());
  await acervo.carregar();
  await tester.pumpWidget(BibliotecaApp(acervo: acervo, tema: ModoTema(persistir: false)));
  await tester.pumpAndSettle();
  return acervo;
}
Future<void> salvar(WidgetTester tester, String texto) async {
  final botao = find.text(texto);
  await tester.ensureVisible(botao);
  await tester.tap(botao);
  await tester.pumpAndSettle();
}
void main() {
  test('livro preserva autoria e identidade ao editar e serializar', () {
    final original = Livro.novo(titulo: 'Dom Casmurro', autor: 'Machado de Assis', formato: Formato.impresso, genero: 'Romance', status: StatusLivro.queroLer);
    final editado = original.copyWith(status: StatusLivro.lendo, paginas: 20);
    expect(editado.id, original.id);
    final recuperado = Livro.deJson(editado.paraJson());
    expect(recuperado.autor, 'Machado de Assis');
    expect(recuperado.paginas, 20);
  });
  testWidgets('vazio e validacao de titulo e autor', (tester) async {
    await montar(tester);
    expect(find.byType(LivroCard), findsNothing);
    await tester.tap(find.text('Novo livro')); await tester.pumpAndSettle();
    await salvar(tester, 'Adicionar');
    expect(find.text('Informe o título'), findsOneWidget);
    expect(find.text('Informe o autor'), findsOneWidget);
  });
  testWidgets('cadastro e edicao preservam um unico registro', (tester) async {
    final acervo = await montar(tester);
    await tester.tap(find.text('Novo livro')); await tester.pumpAndSettle();
    await tester.enterText(campo('Título do livro'), 'Dom Casmurro');
    await tester.ensureVisible(campo('Autor'));
    await tester.enterText(campo('Autor'), 'Machado de Assis');
    await salvar(tester, 'Adicionar');
    expect(acervo.todos.length, 1);
    expect(acervo.todos.single.autor, 'Machado de Assis');
    final id = acervo.todos.single.id;
    await tester.tap(find.byType(LivroCard)); await tester.pumpAndSettle();
    await salvar(tester, 'Editar livro');
    await tester.enterText(campo('Título do livro'), 'Memórias Póstumas');
    await salvar(tester, 'Salvar alterações');
    expect(acervo.todos.single.id, id);
    expect(find.byType(LivroCard), findsOneWidget);
    expect(find.textContaining('Memórias Póstumas'), findsWidgets);
  });
  for (final largura in [390.0, 840.0]) {
    testWidgets('colecao em largura $largura sem excecao de layout', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(largura, 900);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final acervo = await montar(tester);
      acervo.adicionar(Livro.novo(titulo: 'Um título de livro longo para conferir apresentação', autor: 'Autor de nome extenso', formato: Formato.impresso, genero: 'Romance', status: StatusLivro.queroLer));
      await tester.pumpAndSettle();
      expect(find.byType(LivroCard), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
