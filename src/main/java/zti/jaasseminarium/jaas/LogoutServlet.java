package zti.jaasseminarium.jaas;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate current HTTP session.
        // Will call JAAS LoginModule logout() method
        request.getSession().invalidate();

        // Redirect the user to the secure web page.
        // Since the user is now logged out the
        // authentication form will be shown
        response.sendRedirect(request.getContextPath());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
