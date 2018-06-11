<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp"%>
    </head>
    <%

        try {
            String user = (String) session.getAttribute("user");
            
        } catch (NullPointerException e) {
            session.setAttribute("user", "");
            
        }
    %>
    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="./Cliente" method="post">
                            <input type="hidden" name="funcao" id="funcao" value="cadastrar" />
                            Bem-Vindo à Gonçalves Pizzaria!<br>
                            Cadastre-se!
                            <div>
                                <input type="text" name="NomeCliente" id="NomeCliente" class="form-control" placeholder="Cliente" required="" />
                            </div>
                            <div>
                                <input type="text" name="Telefone" id="Telefone" class="form-control" placeholder="Telefone" required="" />
                            </div>
                            <div>
                                <input type="text" name="Endereco" id="Endereco" class="form-control" placeholder="Endereco" required="" />
                            </div>
                            <div>
                                <input type="text" name="NomeUsuario" id="NomeUsuario" class="form-control" placeholder="NomeUsuario" required="" />
                            </div>
                            <div>
                                <input type="password" name="senha" id="Senha" class="form-control" placeholder="Senha" required="" />
                            </div>
                            <div>
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">Limpar</button>
                                    <button type="submit" class="btn btn-success">Enviar</button>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><img src="images/logo.png"></h1>
                                    <p>Sistema JSP! Criado por grupo...</p>
                                </div>


                            </div>
                        </form>
                        <%session.setAttribute("user", "NomeUsuario");%>
                    </section>
                </div>

            </div>
        </div>
    </body>
</html>
