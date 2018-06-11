<%@page import="model.bean.CardapioBean"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Realize seu Pedido</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Realize seu pedido <small>informe o Id da pizza desejada e a Quantidade</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Configuração 1</a>
                                    </li>
                                    <li><a href="#">Configuração 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br>
                        <form action="./Pedido" metod="post">
                            <input type="hidden" name="funcao1" id="funcao1" value="registraPedido">
                            <div>
                                <input type="hidden" name="UsuarioId" id="UsuarioId" value="<%= session.getAttribute("id") %>" />
                            </div><br>
                            <div>
                                <input type="text" name="PizzaId" id="PizzaId" class="form-control" placeholder="PizzaId" required="" />
                            </div>
                            <div><br>
                                <input type="text" name="Quantidade" id="Quantidade" class="form-control" placeholder="Quantidade" required="" />
                            </div><br>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <button type="submit" class="btn btn-success">Enviar</button>
                                <button class="btn btn-primary" type="reset">Limpar</button>
                                </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- /page content -->