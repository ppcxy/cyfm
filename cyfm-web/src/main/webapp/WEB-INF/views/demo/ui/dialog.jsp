<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<html>
<head>
    <title>角色详情</title>
</head>
<body>
<div>
    <button class="btn btn-xs btn-default" onclick="$cy.waiting();setTimeout(function() {
        $cy.waitingOver();
    },10000);">加载10秒
    </button>


    <button class="btn btn-xs btn-default" onclick="$cy.waiting('加载中.');setTimeout(function() {
        $cy.waitingOver()
    },5000);">等待加载
    </button>


    <button class="btn btn-xs btn-default" onclick="$cy.info('这是一段提示信息.')">提示消息</button>
    <button class="btn btn-xs btn-default" onclick="$cy.success('这是一段成功消息.')">成功消息</button>
    <button class="btn btn-xs btn-default" onclick="$cy.warn('这是一段警告消息.')">警告消息</button>
    <button class="btn btn-xs btn-default" onclick="$cy.error('这是一段错误消息.')">错误消息</button>
    <button class="btn btn-xs btn-default" onclick="$cy.confirm({message:'这是一段确认信息.',yes:function() {
        alert('点击了确定');
    },no:function() {
        alert('点击了取消');
    }})">需要确认
    </button>


    <button class="btn btn-xs btn-default"
            onclick="$cy.tools.chooseUser({callback:function(show,results){alert(show)}})">用户选择控件
    </button>


    <button class="btn btn-xs btn-default" onclick="upload()">文件上传</button>
</div>
<div>
    <input type="text" class="" data-format="both">
</div>
<script>
    $cy.handleUniform();


    function upload() {
        //调用文件上传窗口,identity为使用模块,tag为tag,可以用来区分是哪里上传的
        $cy.tools.uploadFile({identity: "test", tag: "all", callback: callback})
    }

    /**
     * 上传文件回调函数
     * @param oper 操作类型
     * @param data 数据
     */
    function callback(oper, data) {
        console.log(oper, data)

        switch (oper) {
            case 'add':
                console.debug('add file', data)
                break;
            case 'delete':
                console.log('delete file', data)
                break;
        }
    }

</script>
</body>
</html>
