# Minha Biblioteca
Catálogo pessoal de livros — Desenvolvimento Mobile I, Unilavras.
Responsável pela adaptação: Adalbert Raczkovi Junior, matrícula 0015660.

## Origem
Adaptação do projeto Zerado, desenvolvido em colaboração por Luiz Ragi, Israel Messias e Adalbert. A base de telas, navegação, repositórios, widgets e organização foi reutilizada. Esta versão muda o domínio para livros, acrescenta autor, substitui plataformas por formatos e horas por páginas lidas, adapta situações e exemplos e usa tema azul. Isso não representa autoria exclusiva da base.

## Recursos
Lista/grade, estado vazio, busca por título/autor/gênero/formato, detalhe, formulário com título e autor obrigatórios, gênero, formato, situação, páginas lidas, nota e observações. Criação/edição por id; cancelamento com descarte; exclusão com desfazer; painel e sorteio de próxima leitura. Dados locais via shared_preferences, sem login/API.
Situações: Quero ler, Lendo, Concluído e Abandonado. Páginas lidas são um registro manual, não um percentual de progresso; não há total de páginas da edição.

## Executar
Use um Flutter compatível com o SDK Dart ^3.13.4 exigido pela base. Confirme com flutter --version; se incompatível, não reduza a restrição sem avaliar as APIs.
```sh
flutter pub get
dart format .
flutter analyze
flutter test
flutter run
flutter build apk --release
```
APK esperado, somente após build bem-sucedido: build/app/outputs/flutter-apk/app-release.apk.
A versão Android usa assinatura de debug de release conforme configuração original; adequada a teste acadêmico, não publicação em loja.

## Estado da validação
Código adaptado e referências locais conferidas. Não foi possível executar Flutter/Dart ou Android neste ambiente. Testes da adaptação estão escritos mas não foram executados; não há APK nem capturas reais. Resultados da base não comprovam esta versão.

## Publicação e entrega
Extraia o ZIP e publique o conteúdo desta pasta na raiz do repositório, incluindo .gitignore e o diretório .github. Exclua caches/build. A automação GitHub Actions tenta resolver dependências, analisar, testar e gerar APK; não pressupõe sucesso. Após publicar, abra Actions e confira os resultados e o artefato Android.
Após corrigir possíveis erros, identifique o commit com git rev-parse HEAD e informe URL/hash no PDF. Capture vazio, coleção, detalhe, formulário inválido, cadastro e edição; use o mesmo conteúdo em 390x844 e 840x900 pixels lógicos. Execute o APK em dispositivo/emulador. Revise teclado, rolagem, foco, rótulos, ampliação e contraste. O PDF atual documenta código e pendências e ainda não comprova entrega final.

## Fontes e recursos
Flutter/Dart; shared_preferences; flutter_localizations; cupertino_icons; Material Icons; Chakra Petch e Barlow (SIL OFL 1.1). Referências preservadas da base. Capas geradas em código, sem imagens de livros de terceiros.
