<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
    <title>实验计划 编辑页面</title>
</head>
<body>

<div class="portlet box editBox">
    <div class="portlet-title"><span>实验项目基本信息</span></div>
    <div class="portlet-body form">
        <form>
            <div class="form-body">
            <div class="form-group">
                <label for="schoolYear" class="control-label">学年:</label>
                <div class="controls">
                    <select type="text" id="schoolYear" name="schoolYear" class="form-control required">
                        <option value="">请选择</option>
                        <option value="2018/2019">2018 -- 2019</option>
                        <option value="2019/2020">2019 -- 2020</option>
                        <option value="2020/2021">2020 -- 2021</option>
                        <option value="2021/2022">2021 -- 2022</option>
                        <option value="2022/2023">2022 -- 2023</option>
                        <option value="2023/2024">2023 -- 2024</option>
                        <option value="2024/2025">2024 -- 2025</option>
                    </select>

                </div>
            </div>

            <div class="form-group">
                <label for="semester" class="control-label">学期:</label>
                <div class="controls">
                    <select type="text" id="semester" name="semester" class="form-control required">
                        <option value="">请选择</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
            </div>
            <div class="form-actions">
                <a class="btn btn-primary" onclick="go('${ctx}/excel/report/table1');" title="导出 信息工程学院佐表1.xls">导出
                    信息工程学院佐表1.xls</a>
                <a class="btn btn-primary" onclick="go('${ctx}/excel/report/table2');" title="导出 信息工程学院佐表2.xls"/>导出
                信息工程学院佐表2.xls</a>
                <a class="btn btn-primary" onclick="go('${ctx}/excel/report/expireAppove');" title="导出 实验申请表"> 导出
                   实验申请表</a>
                <p class="help-block">(选择学年学期后，点击相应按钮导出.)</p>
            </div>
            </div>
        </form>
    </div>
</div>
        <mm:contentFooter/>
        <script>
            function go(h) {
                var schoolYear = $("#schoolYear").val();
                var semester = $("#semester").val();
                if (schoolYear == "") {
                    alert("请选择导出学年。");
                    return;
                }

                if (h.indexOf("table2") < 0 && semester == "") {
                    alert("请选择导出学期。");
                    return;
                }
                window.open(h + "?schoolYear=" + schoolYear + "&semester=" + semester);

            }
        </script>
</body>
</html>
