<%-- 
    Document   : tabela-price
    Created on : 12 de set de 2020, 21:02:56
    Author     : Isadora
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    int n;
    double i;
    double pv;
    try{
        n = Integer.parseInt(request.getParameter("n"));
        i = Double.parseDouble(request.getParameter("i"));
        pv = Double.parseDouble(request.getParameter("pv"));
    }catch (Exception ex){
        n=0;
        i=0.00;
        pv=0.00;
        
        
        if(request.getParameter("n") != null || request.getParameter("i") != null || request.getParameter("pv") != null)
            erro = "Número inválido como parâmetro";
            
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head-reference.jspf" %>
        <title>Tabela-PRICE</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1 class="container-fluid">Tabela-PRICE</h1>
        <h2 class="container-fluid">Cálculo de Armotização</h2>
        <div class="container-fluid">
            <form>
                Valor à pagar:     
                <input type="number" name="pv" step="0.01" min="0.00"/><br><br>
                Taxa de juros (%):    
                <input type="number" name="i" step="0.001" min="0.000"/><br><br>
                Número de parcelas:
                <input type="number" name="n"/><br><br>
                <input type="submit" value="Gerar"/>
            </form>
        </div>
        <hr/>
        <% if (request.getParameter("n") == null || request.getParameter("i") == null || request.getParameter("pv") == null){ %>
            <div class="container-fluid">Informe os dados</div>
        <% }else if(erro != null){ %>
            <div class="container-fluid"><%= erro %></div>
        <% }else{ %>
        <% double cj=0.00; %>
        <% double ca=0.00; %>
        <% double P;%>
        <% DecimalFormat f = new DecimalFormat("#,##0.00"); %>
        <% i = i/100;%>
        <% P = pv*((i)/(1-Math.pow((1+i), (-n))));%>     
        <table class="table table-bordered">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Mês</th>
                <th scope="col">Prestação</th>
                <th scope="col">Juros</th>
                <th scope="col">Amortização</th>
                <th scope="col">Saldo Devedor</th>
              </tr>
            </thead>
            <tbody>
              <% for(int k = 1; k<=n; k++){ %>    
              <% double j = pv*i; %>   
              <% cj = cj+j; %>   
              <% double a = P-j; %>
              <% ca = ca+a; %>
              <% pv = pv-a; %>   
              <tr>
                  <th scope="row"><%= k %></th>
                  <td style="background-color: #FAF0E6"><%= f.format(P) %></td>
                  <td><%= f.format(j) %></td>
                  <td style="background-color: #FAF0E6"><%= f.format(a) %></td>
                  <td><%= f.format(pv) %></td>
              </tr>
            </tbody>
            <%}%>
            <tr>
                  <th scope="row">  </th>
                  <td style="background-color: #FAF0E6">  </td>
                  <td>  </td>
                  <td style="background-color: #FAF0E6">  </td>
                  <td>  </td>   
            </tr> 
            <tr>
                  <th scope="row">Total</th>
                  <td style="background-color: #FAF0E6"><%= f.format(P*n) %></td>
                  <td><%= f.format(cj) %></td>
                  <td style="background-color: #FAF0E6"><%= f.format(ca) %></td>
                  <td>------------------</td> 
            </tr>
                  <%}%>
        </table>
        <p class="container-fluid"><a href="index.jsp">Voltar</a></p>
        <%@include file="WEB-INF/jspf/body-reference.jspf" %>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>