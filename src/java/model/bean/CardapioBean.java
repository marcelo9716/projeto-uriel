package model.bean;

public class CardapioBean {
 
    private int IdPizza;
    String Sabor;
    float Preco;
    int TempoPreparo;

    public CardapioBean(String Sabor, float Preco, int TempoPreparo) {
        this.Sabor = Sabor;
        this.Preco = Preco;
        this.TempoPreparo = TempoPreparo;
    }

    public String getSabor() {
        return Sabor;
    }

    public void setSabor(String Sabor) {
        this.Sabor = Sabor;
    }

    public float getPreco() {
        return Preco;
    }

    public void setPreco(float Preco) {
        this.Preco = Preco;
    }

    public int getTempoPreparo() {
        return TempoPreparo;
    }

    public void setTempoPreparo(int TempoPreparo) {
        this.TempoPreparo = TempoPreparo;
    }

    public int getIdPizza() {
        return IdPizza;
    }

    public void setIdPizza(int IdPizza) {
        this.IdPizza = IdPizza;
    }
}
