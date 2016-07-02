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


    $("th input[type=checkbox]").on("click", function () {
        $("td.check input[type=checkbox]").prop("checked", $(this).is(":checked"))
    });

    var beginCheck = undefined;

    $("body").keydown(function (e) {
        var ev = window.event || e;
        if (ev.shiftKey) {
            var check = $("tr:hover.selected").find("td.check input[type=checkbox]");
            if (check.size() != 0) {
                beginCheck = $("tr:hover.selected").find("td.check input[type=checkbox]");
            } else {
                beginCheck = "no";
            }

        }
    });

    $("tr td:not(.check):not(.action)").on("click", function (e) {
        var selectTR = $(this).parents("tr");
        if (beginCheck == 'no') {
            beginCheck = $("tr.selected").find("td.check input[type=checkbox]");
        }
        selectTR.addClass("selected").siblings().removeClass("selected");

        var tdCheckBox = selectTR.find("td.check").find("input[type=checkbox]");

        if (tdCheckBox.size() > 0) {
            var checked = tdCheckBox.is(":checked");

            var ev = window.event || e;
            if (ev.shiftKey) {
                var beginChecked = beginCheck.is(":checked")
                if (checked != beginChecked) {
                    tdCheckBox.prop("checked", !checked);
                    var beginIndex = beginCheck.parents("tr").index();
                    var endIndex = tdCheckBox.parents("tr").index();
                    if (beginIndex > endIndex) {
                        var tem = endIndex;
                        endIndex = beginIndex;
                        beginIndex = tem;
                    }
                    for (var i = beginIndex + 1; i <= endIndex; i++) {
                        $("tr").eq(i).find("td.check input[type=checkbox]").prop("checked", !checked);
                    }
                }
                beginCheck = undefined;
                return false
            }

            beginCheck = undefined

            if (ev.ctrlKey) {
                tdCheckBox.prop("checked", !checked);
                return false
            }

            tdCheckBox.prop("checked", !checked).parents("tr").siblings().find("td.check input[type=checkbox]").prop("checked", false);
            return false;
        }
    });

    $(".tools a.btn").on("click", function (e) {
        if ($(this).prop("href")) return;
        var baseUrl = $(this).data("baseurl");
        if (!baseUrl) return;

        var checkItemVal = $("tr td.check input:checked").val();

        if (checkItemVal) {
            window.location.href = baseUrl.replace("{id}", checkItemVal);
        } else {
            alert("请选择一条记录.");
        }
    });


    // 组建初始化
    $("[data-format]").each(function (index, obj) {
        var format = $(obj).data("format");
        var istime = true;
        if (format == 'both') {
            format = "YYYY-MM-DD hh:mm:ss";
        } else if (format == 'date') {
            format = 'YYYY-MM-DD';
            istime = false;
        } else if (format == 'time') {
            format = 'HH:mm:SS';
        } else {
            format = "YYYY-MM-DD hh:mm:ss";
        }

        laydate({
            elem: this,
            istime: istime,
            format: format,
            istoday: true,
            isclear: true, //是否显示清空
            issure: true,
            //festival: true
        });
    })
});

$.app = {
    waiting: function () {

    },
    handleUniform: function () {
        if (!$().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle, .md-check, .md-radiobtn, .make-switch, .icheck), input[type=radio]:not(.toggle, .md-check, .md-radiobtn, .star, .make-switch, .icheck)");
        if (test.size() > 0) {
            test.each(function () {
                if ($(this).parents(".checker").size() === 0) {
                    $(this).show();
                    $(this).uniform();
                }
            });
        }
    },

    initAutocomplete: function (config) {

        var defaultConfig = {
            minLength: 1,
            enterSearch: false,
            focus: function (event, ui) {
                jQuery(config.input).val(ui.item.label);
                return false;
            },
            renderItem: function (ul, item) {
                return jQuery("<li>")
                    .data("ui-autocomplete-item", item)
                    .append("<a>" + item.label + "</a>")
                    .appendTo(ul);
            }
        };

        config = jQuery.extend(true, defaultConfig, config);

        jQuery(config.input)
            .on("keydown", function (event) {
                //回车查询
                if (config.enterSearch && event.keyCode === $.ui.keyCode.ENTER) {
                    config.select(event, {item: {value: jQuery(this).val()}});
                }
            })
            .autocomplete({
                source: config.source,
                minLength: config.minLength,
                focus: config.focus,
                select: config.select
            }).data("ui-autocomplete")._renderItem = config.renderItem;
    }
}


//初始化页面
$(function () {
});
