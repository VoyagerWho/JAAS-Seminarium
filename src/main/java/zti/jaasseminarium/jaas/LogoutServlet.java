package zti.jaasseminarium.jaas;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate current HTTP session.
        // Will call JAAS LoginModule logout() method
        request.getSession().invalidate();

        // Clear Browser Cache
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        long timestamp = new Date().getTime();
        // Redirect the user to the secure web page.
        // Since the user is now logged out the
        // authentication form will be shown
        response.sendRedirect(request.getContextPath() +"?t=" +timestamp);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
