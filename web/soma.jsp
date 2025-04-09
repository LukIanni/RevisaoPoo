<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soma de Números</title>
    </head>
    <body>
        <h1>Soma de Números</h1>
        
        <div><%@include file="WEB-INF/jspf/menu.jspf" %></div>

        <form method="post">
            <label for="numero">Digite um número inteiro positivo:</label>
            <input type="number" id="numero" name="numero" min="1" required>
            <input type="submit" value="Calcular Soma">
        </form>

        
        <hr>

        <%
            String numeroStr = request.getParameter("numero");
            if (numeroStr != null && !numeroStr.isEmpty()) {
                try {
                    int numero = Integer.parseInt(numeroStr);
                    long soma = 0; 

                    if (numero >= 1) {
                        for (int i = 1; i <= numero; i++) {
                            soma += i;
                        }
                        out.println("<h2>A soma dos números de 1 até " + numero + " é: " + soma + "</h2>");
                    } else {
                        out.println("<p style='color:red;'>Por favor, digite um número inteiro positivo maior ou igual a 1.</p>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Por favor, digite um número inteiro válido.</p>");
                }
            }
        %>
    </body>
</html>
