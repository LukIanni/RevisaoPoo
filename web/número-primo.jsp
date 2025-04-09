<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%!
    public static String verificar(int num) {
        if (num <= 1) {
            return num + " nao e um numero primo.";
        }
        List<Integer> divisores = new ArrayList<>();
        boolean ehPrimo = true;

        for (int i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                ehPrimo = false;
                divisores.add(i);
                if (i * i != num) { // Evita numeros duplicados
                    divisores.add(num / i);
                }
            }
        }

        if (ehPrimo && num > 1) {
            return num + " e um numero primo.";
        } else {
            divisores.add(1); // 1 e um divisor padrao
            if (num > 1) {
                divisores.add(num); // O proprio numero tambem e um divisor padrao
            }
            java.util.Collections.sort(divisores);
            return num + " nao e um numero primo seus sivisores sao: " + divisores;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificador de Número Primo</title>
    </head>
    <body>
        <h1>Verificador de Número Primo</h1>
        
        <div><%@include file="WEB-INF/jspf/menu.jspf" %></div>
        <form method="post">
            <label for="numero">Digite um número inteiro:</label>
            <input type="number" id="numero" name="numero" required>
            <input type="submit" value="Verificar">
        </form>

        <hr>

        <%
            String numeroStr = request.getParameter("numero");
            if (numeroStr != null && !numeroStr.isEmpty()) {
                try {
                    int verificar = Integer.parseInt(numeroStr);
                    out.println("<h2>Resultado: " + verificar(verificar) + "</h2>");

                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Por favor, digite um número inteiro válido.</p>");
                }
            }
        %>
    </body>
</html>