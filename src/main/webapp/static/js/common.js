function refreshPage() {
    window.location.reload();
}

jQuery(document).ready(function () {
    jQuery("body").keydown(function (e) {
        var ev = window.event || e;
        var code = ev.keyCode || ev.which;

        if (code == 116) {
            // 阻止默认的F5事件
            if (ev.preventDefault) {
                ev.preventDefault();
            } else {
                ev.keyCode = 0;
                ev.returnValue = false;
            }

            refreshPage();
            return false;
        }
        return true;
    });


    $("th input[type=checkbox]").on("click",function () {
         $("td.check input[type=checkbox]").prop("checked",$(this).is(":checked"))
    });

    $("tr").on("dblclick",function () {
        var tdCheckBox = $(this).find("td.check").find("input[type=checkbox]");
        if (tdCheckBox.size() > 0) {
            var checked = tdCheckBox.is(":checked");
            tdCheckBox.prop("checked", !checked);
        }
    });

    $(".tools a.btn").on("click", function () {
        if($(this).prop("href")) return;
        var baseUrl = $(this).data("baseurl");
        if(!baseUrl) return;

        var checkItemVal = $("tr td.check input:checked").val();

        if(checkItemVal){
                window.location.href = baseUrl.replace("{id}", checkItemVal);
        } else {
            alert("请选择一条记录.");
        }
    });
})
