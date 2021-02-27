/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sun.corba.se.impl.ior.GenericTaggedComponent;
import model.userInfo;
/**
 *
 * @author Minh Hoang
 */

import javax.servlet.http.HttpServletRequest;
@WebFilter(urlPatterns = "/admin/*")
public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resq= (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object obj=session.getAttribute("account");
		userInfo user=(userInfo) obj;
		
		if(user != null && user.getRole() ==1 ) {
			chain.doFilter(request, response);
			return; //
		}else {
			resq.sendRedirect(req.getContextPath()+ "/logout");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}
	

}