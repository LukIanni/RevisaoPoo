<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%!
    public static List<Integer> gerarFibonacci(int n) {
        List<Integer> fibonacciList = new ArrayList<>();
        if (n <= 0) {
            return fibonacciList;
        }
        if (n == 1) {
            fibonacciList.add(0);
            return fibonacciList;
        }
        fibonacciList.add(0);
        fibonacciList.add(1);
        for (int i = 2; i < n; i++) {
            int nextFib = fibonacciList.get(i - 1) + fibonacciList.get(i - 2);
            fibonacciList.add(nextFib);
        }
        return fibonacciList;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Série de Fibonacci</title>
    </head>
    <body>
        <h1>Série de Fibonacci</h1>
        <div><%@include file="WEB-INF/jspf/menu.jspf" %></div>
        <br>
        <form method="post">
            <label for="indice">Digite o índice desejado (n >= 1):</label>
            <input type="number" id="indice" name="indice" min="1" required>
            <input type="submit" value="Gerar Fibonacci">
        </form>

        <hr>

        <%
            String indiceStr = request.getParameter("indice");
            if (indiceStr != null && !indiceStr.isEmpty()) {
                try {
                    int indice = Integer.parseInt(indiceStr);
                    List<Integer> fibonacciSeries = gerarFibonacci(indice);

                    if (!fibonacciSeries.isEmpty()) {
                        out.println("<h2>Série de Fibonacci até o índice " + indice + ":</h2>");
                        out.println("<p>");
                        for (int i = 0; i < fibonacciSeries.size(); i++) {
                            out.print(fibonacciSeries.get(i));
                            if (i < fibonacciSeries.size() - 1) {
                                out.print(", ");
                            }
                        }
                        out.println("</p>");
                    } else {
                        out.println("<p>Por favor, digite um índice maior ou igual a 1.</p>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Por favor, digite um número inteiro válido para o índice.</p>");
                }
            }
        %>
    </body>
</html>
