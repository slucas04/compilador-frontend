import java.io.FileReader;
import java_cup.runtime.Symbol;

public class TestScanner {
    private static String nomeDoToken(int id) {
        switch (id) {
            case sym.EOF: return "EOF";
            case sym.error: return "error";
            case sym.LT: return "LT";
            case sym.GT: return "GT";
            case sym.NE: return "NE";
            case sym.IF: return "IF";
            case sym.ELSE: return "ELSE";
            case sym.WHILE: return "WHILE";
            case sym.RETURN: return "RETURN";
            case sym.ID: return "ID";
            case sym.INT_CONST: return "INT_CONST";
            case sym.FLOAT_CONST: return "FLOAT_CONST";
            case sym.PLUS: return "PLUS";
            case sym.MINUS: return "MINUS";
            case sym.TIMES: return "TIMES";
            case sym.DIVIDE: return "DIVIDE";
            case sym.EQ: return "EQ";
            case sym.ASSIGN: return "ASSIGN";
            case sym.SEMI: return "SEMI";
            case sym.COMMA: return "COMMA";
            case sym.LBRACE: return "LBRACE";
            case sym.RBRACE: return "RBRACE";
            case sym.LPAREN: return "LPAREN";
            case sym.RPAREN: return "RPAREN";
            case sym.INT: return "INT";
            case sym.FLOAT: return "FLOAT";
            case sym.VOID: return "VOID";
            default: return "TOKEN_" + id;
        }
    }

    public static void main(String[] args) throws Exception {
        System.out.println("=== Analise Lexica (TestScanner) ===");
        Scanner lexer = new Scanner(new FileReader("input.txt"));
        Symbol token;

        while ((token = lexer.next_token()) != null && token.sym != sym.EOF) {
            System.out.printf("Token %d (%s)%n", token.sym,
                token.value != null ? token.value : nomeDoToken(token.sym));
        }
    }
}