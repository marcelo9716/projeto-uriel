package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bean.CardapioBean;
import model.factory.ConnectionFactory;

public class CardapioDAO {

    private Connection con;

    public CardapioDAO() {
        this.con = new ConnectionFactory().getConnection();
    }

    public List<CardapioBean> listar() {
        List<CardapioBean> listCardapio= new ArrayList<>();
        String sql = "SELECT * FROM Cardapio";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CardapioBean cardapioBean = new CardapioBean(rs.getString("Sabor"), rs.getFloat("Preco"), rs.getInt("TempoPreparo"));
                cardapioBean.setIdPizza(rs.getInt("IdPizza"));
                listCardapio.add(cardapioBean);
            }
            rs.close();
            ps.close();
            con.close();
            return listCardapio;
        } catch (SQLException ex) {
            Logger.getLogger(CardapioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
