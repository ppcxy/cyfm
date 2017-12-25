<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
  <title>设备 列表</title>
</head>

<body>
 <div class="tools search-toolbar">
   <div class="toolbar-right">
       <form class="form-search form-inline" action="#">
         <div class="form-group">
             <label>设备名称：</label> <input type="text" name="search.deviceName_like"   class="form-control input-small"  value="${param['search.deviceName_like']}">
             <button type="submit" class="btn btn-default" id="search_btn">查询</button>
         </div>
       </form>
   </div>
 </div>
<div class="listTableWrap">
    <table id="contentTable" data-tid="device" class="table table-list table-striped table-bordered table-hover table-condensed table-advance">
        <thead>
        <tr>
            <th class="check"><input type="checkbox"></th>
            <th>设备名称</th>
            <th>设备类型</th>
            <th>设备状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="device">
            <tr>
                <td class="check"><input type="checkbox" value="${device.id}"></td>
                <td>${device.deviceName}&nbsp;</td>
                <td>${device.deviceType}&nbsp;</td>
                <td>${device.deviceState}&nbsp;</td>
                <cy:listTableActions name="${device.deviceName}" id="${device.id}"/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
 <cy:pagination page="${page}" paginationSize="5"/>
</body>
</html>
