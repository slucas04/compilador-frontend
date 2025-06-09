import java.io.FileReader;
import java_cup.runtime.Symbol;

public class TestParser {
    public static void main(String[] args) throws Exception {
        System.out.println("=== Analise Sintatica (TestParser) ===");
        Scanner lexer = new Scanner(new FileReader("input.txt"));
        Parser parser = new Parser(lexer);
        Object result = parser.parse().value;
        System.out.println("Arvore sintatica: " + result);
    }
}