<%--
  Created by IntelliJ IDEA.
  User: Eternity-Myth
  Date: 2018/5/9
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<html>
<head>
    <title>ũ������Ϣһ��</title>
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
<!-- ũ������ӵ�ģ̬�� -->
<div class="modal fade" id="cropsAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">ũ�������</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ũ������</label>
                        <div class="col-sm-10">
                            <input type="text" name="cropsname" class="form-control" id="cropsName_add_input"
                                   placeholder="Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ռ�����</label>
                        <div class="col-sm-10">
                            <input type="number" name="area" class="form-control" id="corpsArea_add_input"
                                   placeholder="Area">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">����</label>
                        <div class="col-sm-10">
                            <input type="number" name="profit" class="form-control" id="cropsProfit_add_input"
                                   placeholder="Profit">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">��ֲʱ��</label>
                        <div class="col-sm-10">
                            <input type="number" name="cropstime" class="form-control" id="cropsTime_add_input"
                                   placeholder="Time">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" id="crops_save_btn">����</button>
            </div>
        </div>
    </div>
</div>
<!-- ũ�����޸ĵ�ģ̬�� -->
<div class="modal fade" id="cropsUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">ũ������Ϣ�޸�</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Area</label>
                        <div class="col-sm-10">
                            <input type="number" name="area" class="form-control" id="area_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Profit</label>
                        <div class="col-sm-10">
                            <input type="number" name="profit" class="form-control" id="profit_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Time</label>
                        <div class="col-sm-10">
                            <input type="number" name="cropstime" class="form-control" id="cropsTime_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" id="crops_update_btn">����</button>
            </div>
        </div>
    </div>
</div>
<%--���ʾҳ��--%>
<div class="container">
    <%--����--%>
    <div class="row">
        <div class="col-md-12">
            <h2>ũ������Ϣһ��</h2>
        </div>
    </div>
    <%--��ť--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="crops_add_modal_btn">����</button>
            <button class="btn btn-danger" id="crops_delete_all_btn">ɾ��</button>
        </div>
    </div>
    <%--��ʾ�������--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="crops_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#ID</th>
                    <th>Name</th>
                    <th>Area����/Ķ��</th>
                    <th>Profit��Ԫ/Ķ��</th>
                    <th>Time���£�</th>
                    <th>����</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- ��ʾ��ҳ��Ϣ -->
    <div class="row">
        <!--��ҳ������Ϣ  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- ��ҳ����Ϣ -->
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
<script type="text/javascript">

    var totalPages, currentPage;
    //1��ҳ���������Ժ�ֱ��ȥ����ajax����,Ҫ����ҳ����
    $(function () {
        //ȥ��ҳ
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/crops-list",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1����������ʾũ��������
                build_crops_table(result);
                //2����������ʾ��ҳ��Ϣ
                build_page_info(result);
                //3��������ʾ��ҳ������
                build_page_nav(result);
            }
        });
    }

    function build_crops_table(result) {
        //���table���
        $("#crops_table tbody").empty();
        var crops = result.extend.pageInfo.list;
        $.each(crops, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var cropsIdTd = $("<td></td>").append(item.id);
            var cropsNameTd = $("<td></td>").append(item.cropsname);
            var cropsAreaTd = $("<td></td>").append(item.area);
            var cropsProfitTd = $("<td></td>").append(item.profit);
            var cropsTimeTd = $("<td></td>").append(item.cropstime);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("�༭");
            //Ϊ�༭��ť���һ���Զ�������ԣ�����ʾ��ǰũ����id
            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("ɾ��");
            //Ϊɾ����ť���һ���Զ������������ʾ��ǰɾ����ũ����id
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //append����ִ������Ժ��Ƿ���ԭ����Ԫ��
            $("<tr></tr>").append(checkBoxTd)
                .append(cropsIdTd)
                .append(cropsNameTd)
                .append(cropsAreaTd)
                .append(cropsProfitTd)
                .append(cropsTimeTd)
                .append(btnTd)
                .appendTo("#crops_table tbody");
        });
    }

    //������ʾ��ҳ��Ϣ
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("��ǰ" + result.extend.pageInfo.pageNum + "ҳ,��" +
            result.extend.pageInfo.pages + "ҳ,��" +
            result.extend.pageInfo.total + "����¼");
        totalPages = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //������ʾ��ҳ���������ҳҪ��ȥ��һҳ....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //����Ԫ��
        var firstPageLi = $("<li></li>").append($("<a></a>").append("��ҳ").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //ΪԪ����ӵ����ҳ���¼�
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("ĩҳ").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }


        //�����ҳ��ǰһҳ ����ʾ
        ul.append(firstPageLi).append(prePageLi);
        //1,2��3������ul�����ҳ����ʾ
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //�����һҳ��ĩҳ ����ʾ
        ul.append(nextPageLi).append(lastPageLi);

        //��ul���뵽nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $("#crops_add_modal_btn").click(function () {
        $("#cropsAddModal").modal({
            backdrop: "static"
        });
    });

    $("#crops_save_btn").click(function () {
        // 1��ģ̬������д�ı������ύ�����������б���
        // 2������ajax���󱣴�ũ������Ϣ
        $.ajax({
            url: "${APP_PATH}/crops",
            type: "POST",
            data: $("#cropsAddModal form").serialize(),
            success: function (result) {
                //ũ������Ϣ����ɹ�
                //1���ر�ģ̬��
                $("#cropsAddModal").modal('hide');
                //2���������һҳ����ʾ�ղű��������
                //����ajax������ʾ���һҳ���ݼ���
                to_page(totalPages);
            }
        });
    });

    //����ɾ��
    $(document).on("click", ".delete_btn", function () {
        //1�������Ƿ�ȷ��ɾ���Ի���
        var cropsId = $(this).attr("del-id");
        if (confirm("ȷ��ɾ����")) {
            //ȷ�ϣ�����ajax����ɾ������
            $.ajax({
                url: "${APP_PATH}/crops/" + cropsId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //�ص���ҳ
                    to_page(currentPage);
                }
            });
        }
    });

    //���ȫѡ/ȫ��ѡ����
    $("#check_all").click(function () {
        //attr��ȡchecked��undefined;
        //������Щdomԭ�������ԣ�attr��ȡ�Զ������Ե�ֵ��
        //prop�޸ĺͶ�ȡdomԭ�����Ե�ֵ
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //check_item
    $(document).on("click", ".check_item", function () {
        //�жϵ�ǰѡ���е�Ԫ���Ƿ��ҳ����Ԫ��
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //���ȫ��ɾ����������ɾ��
    $("#crops_delete_all_btn").click(function () {
        //
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            //��װ�˵�id�ַ���
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //ȥ��ɾ����id�����-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("ȷ��ɾ����")) {
            //����ajax����ɾ��
            $.ajax({
                url: "${APP_PATH}/crops/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //�ص���ǰҳ��
                    to_page(currentPage);
                }
            });
        }
    });

    //1�������ǰ�ť����֮ǰ�Ͱ���click�����԰󶨲��ϡ�
    //1���������ڴ�����ť��ʱ��󶨡�    2�����󶨵��.live()
    //jquery�°�û��live��ʹ��on�������
    $(document).on("click", ".edit_btn", function () {
        //3���Ѳ˵ص�id���ݸ�ģ̬��ĸ��°�ť
        $("#crops_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#cropsUpdateModal").modal({
            backdrop: "static"
        });
        $("#crops_update_btn").click(function () {
            //����ajax���󱣴���µĲ˵�����
            $.ajax({
                url: "${APP_PATH}/crops/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#cropsUpdateModal form").serialize(),
                success: function (result) {
                    //alert(result.msg);
                    //1���رնԻ���
                    $("#cropsUpdateModal").modal("hide");
                    //2���ص���ҳ��
                    to_page(currentPage);
                }
            });
        });
    });
</script>
</body>
</html>
