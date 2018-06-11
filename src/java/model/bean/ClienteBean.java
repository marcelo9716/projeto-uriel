package model.bean;

public class ClienteBean {
 
    int IdUsuario;
    String NomeCliente;
    String Telefone;
    String Endereco;
    String NomeUsuario;
    String Senha;

    public ClienteBean(String NomeCliente, String Telefone, String Endereco, String NomeUsuario, String Senha) {
        this.NomeCliente = NomeCliente;
        this.Telefone = Telefone;
        this.Endereco = Endereco;
        this.NomeUsuario = NomeUsuario;
        this.Senha = Senha;
    }

    public String getNomeCliente() {
        return NomeCliente;
    }

    public void setNomeCliente(String NomeCliente) {
        this.NomeCliente = NomeCliente;
    }

    public String getTelefone() {
        return Telefone;
    }

    public void setTelefone(String Telefone) {
        this.Telefone = Telefone;
    }

    public String getEndereco() {
        return Endereco;
    }

    public void setEndereco(String Endereco) {
        this.Endereco = Endereco;
    }
    
    public String getNomeUsuario() {
        return NomeUsuario;
    }

    public void setNomeUsuario(String NomeUsuario) {
        this.NomeUsuario = NomeUsuario;
    }
    
    public String getSenha() {
        return Senha;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }
    
    
    
}
