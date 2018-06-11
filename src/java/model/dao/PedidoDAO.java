/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bean.PedidoBean;
import model.factory.ConnectionFactory;


public class PedidoDAO {
    private Connection con;
    
    public PedidoDAO(){
        this.con = new ConnectionFactory().getConnection();
    }
    
    public void registraPedido(PedidoBean pedido) {
        String sql = "insert into pedido(UsuarioId, PizzaId, Quantidade) values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pedido.getUsuarioId());
            ps.setString(2, pedido.getPizzaId());
            ps.setString(3, pedido.getQuantidade());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
