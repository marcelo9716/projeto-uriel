
package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.ClienteDAO;


@WebServlet(name = "Logar", urlPatterns = {"/Logar"})
public class Logar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doPost(request, response);
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
        try {
            
            ClienteDAO user = new ClienteDAO();
            
            
            String login = request.getParameter("user");
            String senha = request.getParameter("senha");

            HttpSession session = request.getSession();
            
            int controlLogin;
            controlLogin = user.autenticar(login, senha);
            
            if ( (controlLogin) > 0 ) {
                response.sendRedirect("Cardapio");
                session.setAttribute("id", controlLogin);
                session.setAttribute("usuario", login);
                session.setMaxInactiveInterval(60 * 5);

            } else {
                response.sendRedirect("login.jsp");
                session.invalidate();
            }
        } catch (NullPointerException e) {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // DICA: https://www.javatpoint.com/servlet-http-session-login-and-logout-example
}
