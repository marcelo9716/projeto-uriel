/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bean.ListaBean;
import model.factory.ConnectionFactory;


public class ListaDAO {
    private Connection con;
    
    public ListaDAO(){
        this.con = new ConnectionFactory().getConnection();
    }
    
    public List<ListaBean> listarPedido(int idUsuario) {
        List<ListaBean> listPedido= new ArrayList<>();
        String sql = "SELECT IdPedido, Sabor, Preco, Quantidade, NomeCliente FROM pedido INNER JOIN usuario ON (IdUsuario = UsuarioId) INNER JOIN cardapio ON (IdPizza = PizzaId) where = ? ";
        try {
            ResultSet rs;
            PreparedStatement ps = con.prepareStatement("SELECT IdPedido, Sabor, Preco, Quantidade, NomeCliente FROM pedido INNER JOIN usuario ON (IdUsuario = UsuarioId) INNER JOIN cardapio ON (IdPizza = PizzaId) where IdUsuario = ? ");
            
            ps.setInt(1, idUsuario);
            
            rs = ps.executeQuery();
            String a = "asdas";
            while (rs.next()) {
                ListaBean listaBean = new ListaBean(rs.getString("Sabor"), rs.getFloat("Preco"), rs.getInt("Quantidade"), rs.getString("NomeCliente"));
                listaBean.setIdPedido(rs.getInt("IdPedido"));
                listPedido.add(listaBean);
            }
            
            rs.close();
            ps.close();
            con.close();
            return listPedido;
        } catch (SQLException ex) {
            Logger.getLogger(ListaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
