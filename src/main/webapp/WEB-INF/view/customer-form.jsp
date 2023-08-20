<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Save Customer</title>
</head>
<body>

<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <h3>Save Customer</h3>

    <form action="saveCustomer" modelAttribute = "customer" method="POST">

<%--        need to associate this data with customer id--%>
        <form:hidden path="customer.id"/>

        <table>
            <tbody>

            <tr>
                <td><label>First Name:</label></td>
                <td><form:input path="customer.firstName"/></td>
            </tr>

            <tr>
                <td><label>Last Name:</label></td>
                <td><form:input path="customer.lastName"/></td>
            </tr>

            <tr>
                <td><label>Email:</label></td>
                <td><form:input path="customer.email"/></td>
            </tr>

            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save" /></td>
            </tr>

            </tbody>
        </table>
    </form>

    <div style="clear: both;"></div>

    <p>
        <a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
    </p>

</div>

</body>
</html>
