/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;


public class PedidoBean {
    
    private int IdPedido;
    String UsuarioId;
    String PizzaId;
    String Quantidade;
    
    public PedidoBean(String UsuarioId, String PizzaId, String Quantidade){
        this.UsuarioId = UsuarioId;
        this.PizzaId = PizzaId;
        this.Quantidade = Quantidade;
    }

    public String getUsuarioId() {
        return UsuarioId;
    }

    public void setUsuarioId(String UsuarioId) {
        this.UsuarioId = UsuarioId;
    }

    public String getPizzaId() {
        return PizzaId;
    }

    public void setPizzaId(String PizzaId) {
        this.PizzaId = PizzaId;
    }

    public String getQuantidade() {
        return Quantidade;
    }

    public void setQuantidade(String Quantidade) {
        this.Quantidade = Quantidade;
    }
    
    
    
}
