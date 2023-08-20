<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.luv2code.springdemo.util.SortUtils" %>

<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>List Customers</title>

<%--reference our style sheet  --%>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/src/main/resources/css/style.css" />

</head>
<body>

<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">

    <div id="content">
<%--        add out html table here--%>

<%--        put new button: Add Customer--%>
    <input type="button" value="Add Customer"
    onclick="window.location.href = 'showFormForAdd'; return false;"
           class="add-button"
    />

    <form:form action="search" method="GET">
        Search Customer: <input type="text" name="theSearchName"/>
        <input type="submit" value="Search" class="add-button"/>
    </form:form>

        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

<%--            loop over and print our customers--%>

            <c:forEach var="tempCustomer" items="${customers}">

<%--                Contract an "update" link with customer id--%>

                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>


<%--                Contact an "delete" link with customer id--%>

                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>

                    <td>
<%--                        display the update link--%>
                        <a href="${updateLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                        onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
</body>
</html>
