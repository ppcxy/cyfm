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

            $cy.refreshPage();
            return false;
        }
        return true;
    });
});

$cy = {
    refreshPage: function () {
        window.location.reload();
    },
    waiting: function (message) {
        if (message) {
            layer.msg(message, {icon: 16, shade: [0.6, '#000']});
        } else {
            layer.load('', {
                shade: [0.4, '#fff'] //0.1透明度的白色背景
                , time: 20000
            });
        }

    },
    waitingOver: function () {
        layer.closeAll('loading');
        layer.closeAll('dialog');
        layer.closeAll('tips');
    },
    info: function (message, callback) {
        layer.alert(message, {
            skin: 'layui-layer-lan'
            , title: '消息(3秒后自动关闭)'
            , content: message
            , time: 3000
            , closeBtn: 0
            , shift: 5 //动画类型
        }, callback);
    },
    warn: function (message, callback) {
        layer.alert(message, {
            skin: 'layui-layer-lan'
            , title: '警告(5秒后自动关闭)'
            , content: message
            , time: 5000
            , icon: 0
            , closeBtn: 0
            , shift: 5 //动画类型
        }, callback);
    },
    success: function (message, callback) {
        layer.alert(message, {
            skin: 'layui-layer-lan'
            , title: '成功消息(3秒后自动关闭)'
            , content: message
            , time: 3000
            , icon: 1
            , shift: 5 //动画类型
            , closeBtn: 0
        }, callback);
    },
    error: function (message, callback) {
        layer.alert(message, {
            skin: 'layui-layer-lan'
            , title: '错误消息'
            , content: message
            , icon: 2
            , closeBtn: 0
            , shift: 5 //动画类型
        }, callback);
    },
    confirm: function (options) {
        var options = $.extend({
            "title": "确认操作",
            "message": "确定执行操作?",
            width: "auto",
            height: "auto",
            async: false
        }, options);
        layer.confirm(options.message, {
            area: [options.width, options.height]
            , title: options.title
            , icon: 3
            , btn: ['确定', '取消'] //按钮
        }, function (index, layero) {
            if (options.yes) {
                options.yes();
            }
            layer.close(index);
        }, function () {
            if (options.no) {
                options.no();
            }
        });
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
    },

    initDatePick: function () {
        // 时间组建初始化
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
    },
    initCustomTable: function () {
        if ($("table.table-list").size() == 0) return;
        //Table init 开始
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
                if ($(this).hasClass("delete")) {
                    $cy.confirm({
                        message: "将要执行删除数据操作,是否继续?", yes: function () {
                            window.location.href = baseUrl.replace("{id}", checkItemVal);
                        }
                    });
                    return false;
                }

                window.location.href = baseUrl.replace("{id}", checkItemVal);
            } else {
                $cy.warn("请选择一条记录.");
            }
        });

        $(".action a.deleteRow").click(function () {
            var deleteAction = this;
            $cy.confirm({
                message: "将要执行删除数据操作,是否继续?", yes: function () {
                    window.location.href = deleteAction.href;
                }
            })
            return false;
        });

        //给table添加按钮和注册resize table
        if ($("table").find("td.action").size() > 0 && $("table").find("table thead tr").size() == 0) {
            $('table thead tr').append('<th class="action">操作</th>');
        }
        new TableDragSortResize(document.getElementById('contentTable'), {cidAttrName: "data-tid"});
        //Table init 结束

    },
    validate :{
        validFiledTips : {},
        init: function () {
            var validFiledTips = $cy.validate.validFiledTips;
            $.validator.setDefaults({
                focusInvalid: true
                , focusCleanup: true
                , onclick: function (element) {
                    $(element).valid();
                }
                , onfocusin: function (element) {
                    $(element).valid();
                }
                , submitHandler: function (form) {
                    $cy.waiting();
                    form.submit();
                }
                , success: function (label, element) {
                    var fieldName = element.name;

                    if (validFiledTips[fieldName]) {
                        layer.close(validFiledTips[fieldName]);
                        validFiledTips[fieldName] = undefined;
                    }
                    $(element).removeClass("has-error").addClass("has-success");
                }
                , errorPlacement: function (error, element) {
                    if ($(error).html()==""){
                        return true;
                    }
                    var point = 1;
                    var target = element;

                    var fieldName = element[0].name;

                    //如果存在label,则显示在label右侧.
                    var fieldLabel = $("label[for='" + fieldName + "']");
                    if (fieldLabel.size() > 0) {
                        point = 2;
                        target = fieldLabel;
                    }

                    if (validFiledTips[fieldName]) {
                        $("#error-tips-" + fieldName).find(".error").html($(error).html());
                    } else {
                        var index = layer.tips($('<div></div>').append(error).html(), target, {
                            id: "error-tips-" + fieldName
                            , tipsMore: true
                            , tips: [point, '#F24100']
                            , time: 0
                        });
                        validFiledTips[fieldName] = index;
                        console.log(fieldName+" "+index)
                        $(element).removeClass("has-success").addClass("has-error");
                    }

                },
                invalidHandler: function (event, validator) {
                    // 'this' refers to the form
                    var errors = validator.numberOfInvalids();
                    if (errors) {
                        var message = errors == 1
                            ? '有一项表单验证未通过.'
                            : '有 ' + errors + ' 项表单验证未通过. 请处理后提交.';
                        $cy.warn(message);
                    } else {
                        $("div.error").hide();
                    }
                }
            });
        }
    }
}

//需要直接初始化的.
$cy.validate.init();

//初始化页面
$(function () {
    $cy.initDatePick();
    $cy.initCustomTable();

    window.onbeforeunload = function () {
        $cy.waiting();
    };
});
