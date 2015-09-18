package tp3;

public class Calculatrice {

  public Calculatrice() {}

  public String execute(String s) {
    System.out.println(s+" "+firstSym(s)+" "+s.split(firstSym(s))[0]+" "+s.split(firstSym(s))[1]);
    return ""+banane(s.split(firstSym(s))[0],s.split(firstSym(s))[1],firstSym(s));
  }
  
  private boolean containSymbol(String s) {
    return s.contains("+") || s.contains("-") || s.contains("*");
  }
  
  private int banane(String s1, String s2, String sym) {
    int a,b;
    if (containSymbol(s2)) {
      b = banane(s2.split(firstSym(s2))[0],s2.split(firstSym(s2))[1],firstSym(s2));
    }else {
      b = Integer.parseInt(s2);
    }
    a = Integer.parseInt(s1);
    switch (sym) {
      case "\\+":
        return a+b;
      case "\\*":
        return a*b;
      case "\\-":
        return a-b;
      default:
        break;
    }
    return 0;
  }
  
  private String firstSym(String s) {
    for (int i = 0; i < s.length(); i++) {
      switch (s.charAt(i)) {
        case '+':
          return "\\+";
        case '*':
          return "\\*";
        case '-':
          return "\\-";
        default:
          break;
      }
    }return "";
  }

}
