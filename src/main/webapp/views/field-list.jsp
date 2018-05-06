<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/5/5
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>�˵���Ϣһ��</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/js/jquery-3.3.1.js"></script>
    <link
            href="${APP_PATH}/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/js/bootstrap.min.js"></script>
</head>
<body>
<%--���ʾҳ��--%>
<div class="container">
    <%--����--%>
    <div class="row">
        <div class="col-md-12">
            <h2>�˵���Ϣһ��</h2>
        </div>
    </div>
    <%--��ť--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">����</button>
            <button class="btn btn-danger">ɾ��</button>
        </div>
    </div>
    <%--��ʾ�������--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#ID</th>
                    <th>Area</th>
                    <th>Crops</th>
                    <th>����</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="field">
                    <tr>
                        <th>${field.id}</th>
                        <th>${field.area}</th>
                        <th>${field.crops}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                �༭
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                ɾ��
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--��ʾ��ҳ��Ϣ--%>
    <div class="row">
        <%--��ҳ������Ϣ--%>
        <div class="col-md-6">
            ��ǰ��${pageInfo.pageNum}ҳ����${pageInfo.pages}ҳ����${pageInfo.total}����¼
        </div>
        <%--��ҳ����Ϣ--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/field-list?pn=1">��ҳ</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/field-list?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num==pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/field-list?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/field-list?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH}/field-list?pn=${pageInfo.pages}">ĩҳ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
