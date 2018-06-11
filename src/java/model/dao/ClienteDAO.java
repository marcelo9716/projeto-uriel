package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bean.ClienteBean;
import model.factory.ConnectionFactory;

public class ClienteDAO {

    private Connection con;

    public ClienteDAO() {
        this.con = new ConnectionFactory().getConnection();
    }

    public List<ClienteBean> buscarTodos() {
        List<ClienteBean> listCliente = new ArrayList<>();
        String sql = "select * from Usuario";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ClienteBean clientBean = new ClienteBean(rs.getString("NomeCliente"), rs.getString("Telefone"), rs.getString("Endereco"), rs.getString("NomeUsuario"), rs.getString("Senha"));
                listCliente.add(clientBean);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCliente;
    }

    public void cadastrar(ClienteBean cliente) {
        String sql = "insert into usuario(NomeCliente,Telefone, Endereco, NomeUsuario, Senha) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNomeCliente());
            ps.setString(2, cliente.getTelefone());
            ps.setString(3, cliente.getEndereco());
            ps.setString(4, cliente.getNomeUsuario());
            ps.setString(5, cliente.getSenha());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // VALIDAR LOGIN DO USUARIO
    public int autenticar(String NomeUsuario, String Senha) {
        String sql = "select * from usuario where NomeUsuario=? and Senha=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, NomeUsuario);
            ps.setString(2, Senha);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("IdUsuario");
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
