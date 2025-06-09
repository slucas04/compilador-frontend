# Compilador em Java com JFlex e Java CUP

Este projeto implementa um compilador simples com analisador léxico e sintático, utilizando **JFlex** e **Java CUP**. O código-fonte é escrito em Java e processa arquivos `input.txt` para geração de tokens e análise sintática.

## Requisitos

- [Java JDK](https://www.oracle.com/java/technologies/javase-downloads.html)
- [JFlex](https://www.jflex.de/)
- [Java CUP 11b](http://www2.cs.tum.edu/projects/cup/)
- Terminal ou prompt de comando

## Estrutura dos arquivos

- `Scanner.flex` — arquivo JFlex com definições léxicas
- `Parser.cup` — arquivo CUP com definições gramaticais
- `Main.java` — executa scanner e parser integrados
- `TestScanner.java` — executa apenas o scanner
- `TestParser.java` — executa apenas o parser
- `input.txt` — arquivo de entrada com código-fonte da linguagem
- `build.bat` — script de build automatizado (Windows)
- `java-cup-11b.jar` — biblioteca do Java CUP

## Compilação e Execução

Você pode compilar e executar de duas formas:

### 1. (Windows) Usando o script automático

Execute:

```bat
build.bat
```

Isso fará:

1. Gerar `Scanner.java` com JFlex
2. Gerar `Parser.java` e `sym.java` com Java CUP
3. Compilar os arquivos `.java`
4. Executar o `Main`

### 2. (Manual) Compilação passo a passo

#### Gerar o scanner (JFlex)

```bash
jflex Scanner.flex
```

#### Gerar o parser (Java CUP)

```bash
java -jar java-cup-11b.jar -parser Parser -symbols sym Parser.cup
```

#### Compilar os arquivos Java

```bash
javac -cp java-cup-11b.jar;. *.java    # Windows
javac -cp java-cup-11b.jar:. *.java    # Linux/macOS
```

#### Executar

```bash
java -cp java-cup-11b.jar;. Main       # Windows
java -cp java-cup-11b.jar:. Main       # Linux/macOS
```

Ou execute `TestScanner` ou `TestParser` separadamente, se desejar testar apenas o scanner ou o parser:

```bash
java -cp java-cup-11b.jar;. TestScanner    # Windows
java -cp java-cup-11b.jar:. TestParser     # Linux/macOS
```

## Exemplo de input.txt

```java simplificado
int x = 10;
float y = x + 2.5;
if (x < y) {
  return x;
} else {
  return y;
}
```

## Saída esperada

```
=== Analise Lexica ===
Token 24 (int)
Token 10 (x)
Token 17 (=)
Token 11 (10)
...

=== Analise Sintatica ===
Arvore sintatica: [int x = 10, float y = (x + 2.5), if((x < y)) { return x } else { return y }]
```

## Observações

- Os arquivos `Parser.java`, `sym.java` e `Scanner.java` são gerados automaticamente.
- Certifique-se de que os `.class` foram gerados com sucesso antes de executar.
