<h5>Welcome </h5>
<%

String name=request.getParameter("id");


%>

<h1><%=name %></h1>
<h1><%=request.getParameter("departmentId") %></h1>
<h1><%=request.getParameter("section") %></h1>
<h1><%=request.getParameter("subjectCode") %></h1>