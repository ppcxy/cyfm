<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf"%>
<html>
<head>
	<title>excel模板上传</title>
	<style>
        a.input {
            background:#3091d1;
            text-align:center;
            display:inline-block;/*具有行内元素的视觉，块级元素的属性 宽高*/
            overflow:hidden;/*去掉的话，输入框也可以点击*/
            position:relative;/*相对定位，为 #file 的绝对定位准备*/
            top:10px;
        }
        a.input:hover {
            background:#31b0d5;
            color: #ffffff;
        }
        a{
            text-decoration:none;
            color:#FFF;
        }
        #file {
            opacity:0;/*设置此控件透明度为零，即完全透明*/
            filter:alpha(opacity=0);/*设置此控件透明度为零，即完全透明针对IE*/
            font-size:100px;
            position:absolute;/*绝对定位，相对于 .input */
            top:0;
            right:0;
        }

        form {
            padding: 10px;
        }
	</style>
</head>
<body>
<div class="portlet box">
	<div class="portlet-body form">
		<form:form id="editForm" method="post" commandName="m" enctype="multipart/form-data">
			<div class="form-group">
				<div class="input-group color colorpicker-default" data-color="{{config.table.borderColor}}" data-color-format="rgba">
					<input type="text" placeholder="请点击选择文件按钮，上传 Excel 文件。" class="form-control input-xs" id="file_name" readonly="readonly" value="" />
					<span class="input-group-btn">
                        <a href="javascript:void(0);" class="btn green">选择文件
                            <input id="file" type="file" name="file" class="custom-file-input"/>
                            <input id="title" type="hidden" name="title" value="${title}"/>
                        </a>
                         <button type="submit" class="btn btn-primary">
                             确定导入
                        </button>
                    </span>
				</div>

			</div>
		</form:form>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#file").change(function(){  // 当 id 为 file 的对象发生变化时
				$("#file_name").val($("#file").val().substring($("#file").val().lastIndexOf("\\")+1));  //将 #file 的值赋给 #file_name
				// var fileSize = this.files[0].size;
				// var size = fileSize / 1024 / 1024;
				// if (size > 5) {
				//     alert("附件不能大于5M,请将文件压缩后重新上传！");
				//     this.value="";
				//     return false;
				// }else{
				//
				// }
			})
		});

	</script>
</div>
</body>
</html>
