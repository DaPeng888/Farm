<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/5/11
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="GBK">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ����3��meta��ǩ*����*������ǰ�棬�κ��������ݶ�*����*������� -->
    <meta name="description" content="ע��">
    <meta name="author" content="���Ĵ�">
    <title>ע��</title>

    <!-- ���°汾�� Bootstrap ���� CSS �ļ� -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrapValidator.min.css">
    <!-- Custom styles for this template -->

    <!-- ��ѡ�� Bootstrap �����ļ���һ�㲻�����룩 -->
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">-->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="row">
        <form id="signUpForm" name="form" class="form-horizontal col-sm-6 col-sm-offset-3"
              onsubmit="form.$valid && signUp()" role="form">
            <h2 style="text-align: center">ע��</h2>

            <div class="form-group" id="accountDiv">
                <label class="col-sm-2 control-label" for="inputAccount">�˺�</label>

                <div class="col-sm-10">
                    <input type="text" name="userName" maxlength="20" id="inputAccount"
                           class="form-control" required autofocus>
                </div>
            </div>

            <div class="form-group" id="emailDiv">
                <label class="col-sm-2 control-label" for="inputEmail">����</label>

                <div class="col-sm-10">
                    <input type="email" name="userEmail" maxlength="20" id="inputEmail"
                           class="form-control" required
                           autofocus>
                    <small id="userEmailMsg" class="help-block" data-bv-for="userEmail" data-bv-result="INVALID"
                           style="display: none">�����ѱ�ʹ��
                    </small>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="inputPassword">����</label>

                <div class="col-sm-10">
                    <input type="password" name="userPass" maxlength="16" id="inputPassword" class="form-control"
                           required>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="inputConfirmPassword">ȷ������</label>

                <div class="col-sm-10">
                    <input type="password" name="userConfirmPass" maxlength="16" minlength="6" id="inputConfirmPassword"
                           class="form-control"
                           required>
                </div>
            </div>

            <!--  ��֤��-->

            <div class="form-group">
                <div class="col-sm-9" align="middle">
                    <input type="text" class="form-control" name="code" size="8" ,maxlength="4" placeholder="��������֤��"/>
                    <img id="validateCodeImg" src="/user/validateCode"/>
                    <a href="" onclick="javascript:reloadValidateCode();"> ������,��һ��</a>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <button class="btn btn-md btn-primary btn-block" type="submit">ע��</button>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-sm-9 col-sm-offset-3">
                    <p>�����˺ţ�ǰ�� <a href="sign-in.jsp">��¼</a></p>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /container -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="lib/jquery-1.12.3.min.js"></script>
<!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
<script src="lib/bootstrap.min.js"></script>
<script src="lib/bootstrapValidator.min.js"></script>
<script src="js/sign.js"></script>
</body>
<script type="text/javascript">
    $(document).ready(function () {
    });
    ;
</script>
<%--ˢ�µĺ���--%>
<script>
    function reloadValidateCode() {
        $("#validateCodeImg").attr("src", "/user/validateCode" + new Date() + Math.floor(Math.random() * 24));
    }
</script>

</html>