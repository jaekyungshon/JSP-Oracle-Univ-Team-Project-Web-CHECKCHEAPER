/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.83
 * Generated at: 2023-12-05 10:17:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/login.jsp", Long.valueOf(1701505350300L));
    _jspx_dependants.put("/footer.jsp", Long.valueOf(1701496442334L));
    _jspx_dependants.put("/header.jsp", Long.valueOf(1701500352452L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>Login</title>\r\n");
      out.write("<!-- Bootstrap CDN -->\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.3.min.js\" integrity=\"sha256-\r\n");
      out.write("pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css\" integrity=\"sha384-\r\n");
      out.write("xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("integrity=\"sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct\"\r\n");
      out.write("crossorigin=\"anonymous\"></script>\r\n");
      out.write("<!-- CSS -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/login.css\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("	<div id=\"wrap\" style=\"margin-top:20px\">\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("<div class=\"jumbotron\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1 class=\"display-2\"><strong>Welcome to CheckCheaper</strong></h1>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"text-center\">\r\n");
      out.write("					<h3>If you want to use CheckCheaper, you should login!</h3>\r\n");
      out.write("					<br><br>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("		<section>\r\n");
      out.write("		<form action=\"login_process.jsp\" name=\"login_info\" method=\"get\">\r\n");
      out.write("			<div class=\"form-floating mb-3\">\r\n");
      out.write("			  <input type=\"text\" class=\"form-control\" name=\"i_id\" id=\"floatingInput\" placeholder=\"mbr0\">\r\n");
      out.write("			  <label for=\"floatingInput\">ID</label>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"form-floating\">\r\n");
      out.write("			  <input type=\"password\" class=\"form-control\" name=\"i_pw\" id=\"floatingPassword\" placeholder=\"Password\">\r\n");
      out.write("			  <label for=\"floatingPassword\">Password</label>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"form-floating\">\r\n");
      out.write("				<button type=\"submit\" class=\"btn btn-dark\">login</button>\r\n");
      out.write("			</div>\r\n");
      out.write("		</form>\r\n");
      out.write("		</section>\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("		");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("<footer class=\"container\">\r\n");
      out.write("	<p>\r\n");
      out.write("		<span>Agency: Hansung University DataBase Team-B</span><br>\r\n");
      out.write("		<span>Admin: 7조</span><br>\r\n");
      out.write("		<span>&copy;Copyright 2023. CheckCheaper. All Rights Reserved.</span>\r\n");
      out.write("	</p>\r\n");
      out.write("</footer>");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
