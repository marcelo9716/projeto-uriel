<%@page import="model.bean.ListaBean"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Ultimos Pedidos</h3>
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"/>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
   $(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
    </script>
        <div class="clearfix"></div>
        
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Ultimos Pedidos Realizados&nbsp;&nbsp;</small></h2>
                        <button id="exportButton" class="btn btn-lg btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Baixe um PDF</button>
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
                        <table id="exportTable" class="table table-hover">
                            <thead>
                                <tr>
                                <th>ID_Pedido</th>
                                <th>Sabor</th>
                                <th>Preco</th>
                                <th>Quantidade</th>
                                <th>Nome_Cliente</th>
                                <tr/>
                            </thead>    
                            <tbody>
                            
                            <%
                                List<ListaBean> listagem = (List<ListaBean>) request.getAttribute("listapedido");
                            %>
                            
                            <% for(ListaBean linha : listagem){ %>
                            
                            <tr> 
                                <td> <%=linha.getIdPedido()%></td>
                                <td> <%=linha.getSabor()%></td>
                                <td> <%=linha.getPreco()%></td>
                                <td> <%=linha.getQuantidade()%></td>
                                <td> <%=linha.getNomeCliente()%></td>
                            </tr>
                           <% } %>
                            </tbody>

                        </table>
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- /page content -->

<!-- you need to include the shieldui css and js assets in order for the components to work -->
<link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        $("#exportButton").click(function () {
            // parse the HTML table element having an id=exportTable
            var dataSource = shield.DataSource.create({
                data: "#exportTable",
                schema: {
                    type: "table",
                    fields: {
                        ID_Pedido: { type: Number},
                        Sabor: { type: String },
                        Preco: { type: String },
                        Quantidade: { type: Number},
                        Nome_Cliente: { type: String }
                    }
                }
            });

            // when parsing is done, export the data to PDF
            dataSource.read().then(function (data) {
                var pdf = new shield.exp.PDFDocument({
                    author: "ANewTest",
                    created: new Date()
                });

                pdf.addPage("a4", "portrait");

                pdf.table(
                    50,
                    50,
                    data,
                    [
                        { field: "ID_Pedido", title: "ID Pedido", width: 100},
                        { field: "Sabor", title: "Sabor", width: 100 },
                        { field: "Preco", title: "Preco", width: 50 },
                        { field: "Quantidade", title: "Quantidade", width: 100 },
                        { field: "Nome_Cliente", title: "Nome Cliente", width: 100 }
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "RelatórioPDF"
                });
            });
        });
    });
</script>

