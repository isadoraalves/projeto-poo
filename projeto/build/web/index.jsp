<%-- 
    Document   : index
    Created on : 11 de set de 2020, 15:21:28
    Author     : Isadora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head-reference.jspf" %>
        <title>Calculo de Armotização - JSP</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container-fluid">
            <h1>Cálculo de Amortização</h1>
            <p>Projeto realizado por: Ananda Hike, Isadora Alves e Luciano Rodrigues</p>
            <p>Este projeto tem como objetivo mostrar 3 métodos de cáulculo de amortização:</p>
            <p>
                SAC - Sistema de Amortização Constante<br>
                SAA - Sistema de Amortização Americana<br>
                Tabela-PRICE
            </p>
            <p>Através da entrada de dados fornecidos pelo usuário será gerado uma tabela que mostrará as seguintes informações: </p>
            <p>Quantidade de parcelas a serem pagas<br>
                Valor das parcelas<br>
                Valor da Armotização<br>
                Valor do juros<br>
                Valor do saldo devedor
            </p>
        </div>  
        <%@include file="WEB-INF/jspf/body-reference.jspf" %>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>