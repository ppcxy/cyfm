jQuery(document).ready(function () {

    jQuery("body").keydown(function (event) {
        var ev = window.event || event;
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

    $("form.form-search :input").change(function () {
        $("form.form-search button[type=submit]").addClass("blue");
    })
});

$cy = {
    flushPolling: function () {
        console.log("获取系统消息")
    },
    initNotice: function () {
        var pollingUrl = ctx + "/polling";

        var longPolling = function (url, callback, auto) {
            $.ajax({
                url: url,
                async: true,
                cache: false,
                global: false,
                timeout: 30 * 1000,
                dataType: "json",
                success: function (data, status, request) {
                    //console.log(data)
                    callback(data);
                    data = null;
                    status = null;
                    request = null;
                    if (auto) {
                        setTimeout(
                            function () {
                                longPolling(url, callback, auto);
                            },
                            1000
                        );
                    }
                },
                error: function (xmlHR, textStatus, errorThrown) {
                    xmlHR = null;
                    textStatus = null;
                    errorThrown = null;
                    if (auto) {
                        setTimeout(
                            function () {
                                longPolling(url, callback, true);
                            },
                            8 * 1000
                        );
                    }
                }
            });
        };


        $cy.flushPolling = function () {
            //console.log("lc");
            longPolling(pollingUrl + "?flush=true", function (data) {
                $("#notice_count").text(data.unreadNotificationsCount);

                longPolling(pollingUrl, function (data) {
                    console.debug("长轮训获取推送...");
                    if (data) {
                        $("#notice_count").text(data.unreadNotificationsCount);
                    }
                }, true);
            }, false)
        };

        $cy.flushPolling();

    },
    refreshPage: function () {
        window.location.href=window.location.href;
    },
    place: {
        appendUrl: function (title, url, param) {
            var item = $("<li><a target='rightFrame' href='" + url + '?' + param + "'>" + title + "</a></li>");

            var exist = false;
            $(".placeul", top.document).find("a").each(function (i, o) {
                if (o.href.indexOf(url.substring(0, url.length - 1)) != -1) {
                    $(o).parent("li").nextAll().remove();
                    if (param) {
                        $(o).attr("href", url + '?' + param)
                    }
                    exist = true;
                    return true;
                }
            });
            if (exist) {
                return;
            }

            $(".placeul", top.document).append(item);
        },
        append: function (item) {
            $(".placeul", top.document).append(item);
        },
        back: function () {
            $(".placeul li:not(.default):last", top.document).remove()
        },
        change: function (item) {
            $(".placeul", top.document).append(item);
        },
        clean: function () {
            $(".placeul li:not(.default)", top.document).remove()
        },
        preUrl: function () {
            return $(".placeul li:not(.default):last", top.document).prev().find("a").attr("href");
        }
    },
    urlTools: {
        resetSortUrl: function (url) {
            if (!url) {
                url = currentUrl;
            }

            window.location.href = $cy.urlTools.removePageParam($cy.urlTools.removeSortParam(url));
        },
        resetSearchParamUrl: function (url, form) {
            if (!url) {
                url = currentUrl;
            }

            if (!form) {
                form = $("form.form-search")
            }
            window.location.href = $cy.urlTools.removePageParam($cy.urlTools.removeSearchParam(url, form));
        },
        findSortParam: function (url) {
            var sortParam = '';
            if (!url) {
                url = window.location.href;
            }
            var results = url.match(/\w*(sort.*=((asc)|(desc)))/);
            if (results) {
                sortParam = results[1];
            }

            return sortParam;
        },
        removePageParam: function (pageURL) {
            pageURL = pageURL.replace(/&\w*page.pn=\d+/gi, '');
            pageURL = pageURL.replace(/\?\w*page.pn=\d+&/gi, '?');
            pageURL = pageURL.replace(/\?\w*page.pn=\d+/gi, '');
            pageURL = pageURL.replace(/&\w*page.size=\d+/gi, '');
            pageURL = pageURL.replace(/\?\w*page.size=\d+&/gi, '?');
            pageURL = pageURL.replace(/\?\w*page.size=\d+/gi, '');
            return pageURL;
        }
        ,
        removeSortParam: function (sortURL) {
            sortURL = sortURL.replace(/&\w*sort.*=((asc)|(desc))/gi, '');
            sortURL = sortURL.replace(/\?\w*sort.*=((asc)|(desc))&/gi, '?');
            sortURL = sortURL.replace(/\?\w*sort.*=((asc)|(desc))/gi, '');
            return sortURL;
        },
        removeSearchParam: function (url, form) {
            $.each(form.serializeArray(), function () {
                var name = this.name;
                url = url.replace(new RegExp(name + "=.*?\&", "g"), '');
                url = url.replace(new RegExp("[\&\?]" + name + "=.*$", "g"), '');
            });
            return url;
        },
        removeBackURLParam: function (url) {
            url = url.replace(new RegExp("BackURL=.*?\&", "g"), '');
            url = url.replace(new RegExp("[\&\?]BackURL=.*$", "g"), '');
            return url;
        },
        formatUrlPrefix: function (urlPrefix, $table) { //格式化url前缀，默认清除url ? 后边的

            if (!urlPrefix) {
                urlPrefix = $table.data("prefix-url");
            }

            if (!urlPrefix) {
                urlPrefix = currentUrl;
            }

            if (urlPrefix.indexOf("?") >= 0) {
                return urlPrefix.substr(0, urlPrefix.indexOf("?"));
            }
            return urlPrefix;
        },
        encodeBackURL: function (backUrl) {
            if (!backUrl) {
                var $form = $('form.form-search');
                var backUrlPrefix = $cy.urlTools.removeSearchParam($cy.urlTools.removeBackURLParam(currentUrl), $form);
                backUrl = backUrlPrefix + (backUrlPrefix.indexOf("?") > 0 ? "&" : "?") + $form.serialize()

            }
            return encodeURIComponent(backUrl);
        }
    },
    tools: {
        chooseUser: function (option) {

            var defalutOption = {
                width: '600px',
                height: '500px',
                multi: false,
                okBtn: "确定",
                cancelBtn: "取消",
                callback: $.noop
            };

            defalutOption = jQuery.extend(defalutOption, option);

            //iframe窗
            top.layer.open({
                id: 'user_choose',
                type: 2,
                title: '用户选择器',
                shadeClose: true,
                shade: 0.3,
                maxmin: true, //开启最大化最小化按钮
                area: [defalutOption.width, defalutOption.height],
                content: _ctx + '/sys/common/userChoose'
                , btn: [defalutOption.okBtn, defalutOption.cancelBtn]
                , btn1: function (index, layero) {
                    var results = undefined;

                    if (defalutOption.multi) {
                        results = top.$cy.table.getAllSelectedCheckbox($("table", $("#user_choose iframe", top.document)[0].contentWindow.document))
                    } else {
                        results = top.$cy.table.getFirstSelectedCheckbox($("table", $("#user_choose iframe", top.document)[0].contentWindow.document))
                    }

                    if (results.size() === 0) {
                        top.$cy.warn("请选择用户后确认...")
                    } else {
                        defalutOption.callback(results.eq(0).data("show"), results);
                        top.layer.close(index)
                    }
                }
            });
        },

        uploadFile: function (option) {

            var defalutOption = {
                width: '750px',
                height: '550px',
                multi: false,
                okBtn: '关闭',
                callback: $.noop,
                identity: "common",
                tag: 'all'
            };

            defalutOption = jQuery.extend(defalutOption, option);

            //iframe窗
            top.layer.open({
                id: 'file_upload_dialog',
                type: 2,
                title: '文件上传',
                shadeClose: false,
                shade: 0.3,
                maxmin: false, //开启最大化最小化按钮
                area: [defalutOption.width, defalutOption.height],
                content: _ctx + '/filestore/upload?identity=' + defalutOption.identity + '&tag=' + defalutOption.tag
                , btn: [defalutOption.okBtn]
                , success: function (layero, index) {
                    //获取frame,并且传入参数
                    var childFrameWindow = top.layer.getChildFrameWindow(index)
                    childFrameWindow.param = {
                        parentWindow: window,
                        callback: defalutOption.callback
                    }
                }
            });
        }
    },
    waiting: function (message, timeout) {
        if (message) {
            layer.msg(message, {icon: 16, shade: [0.6, '#000']});
        } else {
            layer.load('', {
                shade: [0.4, '#fff'] //0.1透明度的白色背景
                , time: timeout ? timeout : 10000
            });
        }

    },
    waitingOver: function () {
        layer.closeAll('loading');
        layer.closeAll('dialog');
        layer.closeAll('tips');
    },
    closeme: function (nosync) {
        var index = parent.layer.getFrameIndex(window.name);
        //先得到当前iframe层的索引,然后是否异步执行,异步执行是避免影所在控件原来的行为
        if (!nosync) {
            setTimeout(
                function () {
                    parent.layer.close(index)
                }, 100);
        } else {
            parent.layer.close(index)
        }

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
        opts = $.extend({
            'title': '确认操作',
            'message': '确定执行操作?',
            width: 'auto',
            height: 'auto',
            async: false
        }, options);
        layer.confirm(opts.message, {
            area: [opts.width, opts.height]
            , title: opts.title
            , icon: 3
            , btn: ['确定', '取消'] //按钮
        }, function (index, layero) {
            if (opts.yes) {
                opts.yes();
            }
            layer.close(index);
        }, function () {
            if (opts.no) {
                opts.no();
            }
        });
    },
    handleUniform: function () {
        if (!$().uniform) {
            return;
        }
        var test = $('input[type=checkbox]:not(.toggle, .md-check, .md-radiobtn, .make-switch, .icheck), input[type=radio]:not(.toggle, .md-check, .md-radiobtn, .star, .make-switch, .icheck)');
        if (test.size() > 0) {
            test.each(function () {
                if ($(this).parents('.checker').size() === 0) {
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
                return jQuery('<li>')
                    .data('ui-autocomplete-item', item)
                    .append('<a>' + item.label + '</a>')
                    .appendTo(ul);
            }
        };

        config = jQuery.extend(true, defaultConfig, config);

        jQuery(config.input)
            .on('keydown', function (e) {
                var ev = window.event || e;
                //回车查询
                if (config.enterSearch && ev.keyCode === $.ui.keyCode.ENTER) {
                    config.select(ev, {item: {value: jQuery(this).val()}});
                }
            })
            .autocomplete({
                source: config.source,
                minLength: config.minLength,
                focus: config.focus,
                select: config.select
            }).data('ui-autocomplete')._renderItem = config.renderItem;
    },

    initDatePick: function () {
        // 时间组建初始化
        $('[data-format]').each(function (index, obj) {
            var format = $(obj).data('format');
            var type = 'datetime';
            var istime = true;
            if (format == 'both') {
                format = 'yyyy-MM-dd HH:mm:ss';
            } else if (format == 'date') {
                format = 'yyyy-MM-dd';
                type = 'date';
            } else if (format == 'time') {
                format = 'HH:mm:ss';
                type = 'time';
            } else {
                format = 'yyyy-MM-dd HH:mm:ss';
            }

            laydate.render({
                elem: this,
                type: type,
                format: format,
                istoday: true,
                isclear: true, //是否显示清空
                issure: true
                //festival: true
            });
        })
    },
    toolbar: {
        addMore: function (options) {
            var $toolsMore = $('.toolbar .more');
            if ($toolsMore.is(':hidden')) {
                $toolsMore.removeClass('hidden');
            }

            var $toolsMoreList = $toolsMore.find('.more_list');

            var opts = $.extend({
                classText: '',
                href: 'javascript:;',
                text: '未命名',
                icon: ''
            }, options);

            $('<li><a class=" + opts.classText + " href="' + opts.href + '">' + opts.text + '</a></li>').insertBefore($toolsMoreList, null)

        }
    },
    table: {
        getFirstSelectedCheckbox: function ($table) {
            var checkbox = $table.find('td.check input[type=checkbox]:checked');//:first
            if (!checkbox.length) {

                //表示不选中 不可以用，此时没必要弹窗
                if (jQuery(this).hasClass('.no-disable') == false) {
                    return checkbox;
                }

                $cy.warn('请先选择要操作的数据！');
            }
            if (checkbox.size() > 1) {
                $cy.warn('只能选择一条记录进行操作！');
                return [];
            }
            return checkbox;
        },
        getAllSelectedCheckbox: function ($table) {
            var checkbox = $table.find('td.check input[type=checkbox]:checked');
            if (!checkbox.length) {

                //表示不选中 不可以用，此时没必要弹窗
                if (jQuery(this).hasClass('.no-disable') == false) {
                    return checkbox;
                }

                $cy.warn('请先选择要操作的数据！');
            }
            return checkbox;
        },
        /*getAllSelectedCheckbox: function (table) {
            if (!table) {
                table = 'table.table-list';
            }
            var checkboxArray = new Array();
            $(table).find('td.check input[type=checkbox]:checked').each(function (index, item) {
                checkboxArray.push(item);
            });
            return checkboxArray;
        },*/
        init: function () {
            var $table = $('table.table-list');

            if ($table.size() == 0) return;

            //给table添加按钮和注册resize table
            if ($table.find('td.action').size() > 0 && $table.find('th.action').size() == 0) {
                $('table thead tr').append('<th class="action">操作</th>');
            }

            new TableDragSortResize(document.getElementById('contentTable'), {
                cidAttrName: 'data-tid',
                sort: {
                    callback: function (cell, type, event) {
                        var ev = window.event || event;

                        var sortName = $(cell).data('sort');
                        if (sortName) {


                            var softType = type == 'sort-down' ? 'desc' : 'asc';

                            var currentSortParam = '';

                            if ((ev.ctrlKey || ev.metaKey)) {
                                currentSortParam = $cy.urlTools.findSortParam().replace('sort.' + sortName + '=' + (softType == 'desc' ? 'asc' : 'desc'), '');
                            }

                            var sortParam = '?sort.' + sortName + '=' + softType + (currentSortParam.indexOf('sort') >= 0 ? ('&' + currentSortParam) : '');
                            window.location.href = (sortParam + '&' + $('form.form-search').serialize())
                        }
                    },
                    localEnable: false
                }
            });

            var sortURL = currentUrl;
            $('#contentTable').find('[data-sort]').each(function () {
                var th = jQuery(this);
                var sortPropertyName = 'sort.' + th.data('sort');

                var matchResult = sortURL.match(new RegExp(sortPropertyName + '=(asc|desc)', 'gi'));
                var order = null;

                if (matchResult) {
                    order = RegExp.$1;

                    if (order == 'asc') {
                        th.addClass('sort-up')
                    } else if (order == 'desc') {
                        th.addClass('sort-down')
                    }
                }

            });

            //Table init 开始
            $('th input[type=checkbox]').on('click', function () {
                $('td.check input[type=checkbox]').prop('checked', $(this).is(':checked'))
            });

            var beginCheck = undefined;

            $('body').keydown(function (event) {
                var ev = window.event || event;
                if (ev.shiftKey) {
                    var $tr = $('tr:hover.selected');

                    var check = $tr.find('td.check input[type=checkbox]');
                    if (check.size() != 0) {
                        beginCheck = $tr.find('td.check input[type=checkbox]');
                    } else {
                        beginCheck = 'no';
                    }

                }
            });

            //如果没有数据自动添加无数据提示行
            if ($('table.table-list tbody tr').size() == 0) {
                $('<tr></tr>').append($('<td align="center">暂无可查看数据</td>').attr('colspan', $('table.table-list thead th').size())).appendTo('table.table-list tbody');
                return;
            }

            $('table.table-list tr td:not(.check):not(.action)').on('click', function (event) {
                var $current = $(this);
                setTimeout(function () {
                    var selectTR = $current.parents('tr');
                    if (beginCheck == 'no') {
                        beginCheck = $('tr.selected').find('td.check input[type=checkbox]');
                    }
                    selectTR.addClass('selected').siblings().removeClass('selected');

                    var tdCheckBox = selectTR.find('td.check').find('input[type=checkbox]');

                    if (tdCheckBox.size() > 0) {
                        var checked = tdCheckBox.is(':checked');

                        var ev = window.event || event;
                        if (ev.shiftKey) {
                            var beginChecked = beginCheck.is(':checked');
                            if (checked != beginChecked) {
                                tdCheckBox.prop('checked', !checked);
                                var beginIndex = beginCheck.parents('tr').index();
                                var endIndex = tdCheckBox.parents('tr').index();
                                if (beginIndex > endIndex) {
                                    var tem = endIndex;
                                    endIndex = beginIndex;
                                    beginIndex = tem;
                                }
                                for (var i = beginIndex + 1; i <= endIndex; i++) {
                                    $('tr').eq(i).find('td.check input[type=checkbox]').prop('checked', !checked);
                                }
                            }
                            beginCheck = undefined;
                            return false
                        }

                        beginCheck = undefined;

                        if (ev.ctrlKey) {
                            tdCheckBox.prop('checked', !checked);
                            return false
                        }

                        tdCheckBox.prop('checked', !checked).parents('tr').siblings().find('td.check input[type=checkbox]').prop('checked', false);
                        return false;
                    }
                }, 50)

            }).on('dblclick', function (event) {
                //如果存在修改按钮,则双击条进入修改页面
                var updateUrl = $('.btn.update').data('baseurl');
                if (updateUrl) {
                    var selectTR = $(this).parents('tr');
                    var tdCheckBox = selectTR.find('td.check').find('input[type=checkbox]');

                    window.location.href = updateUrl.replace('{id}', tdCheckBox.val())
                }

            });

            $('.tools a.btn:not(.custom)').on('click', function (event) {
                if ($(this).prop('href')) return;
                var baseUrl = $(this).data('baseurl');
                if (!baseUrl) return;

                var $tr = $('tr td.check input:checked');

                var checkItemVal = $tr.val();

                if (checkItemVal) {
                    if ($(this).hasClass('delete')) {
                        if ($(this).hasClass('batch')) {
                            checkItemVal = '';
                            $tr.each(function () {
                                checkItemVal = checkItemVal + $(this).val() + ',';
                            });
                            checkItemVal = checkItemVal.substring(0, checkItemVal.length - 1);
                        }

                        $cy.confirm({
                            message: '将要执行删除数据操作,是否继续?', yes: function () {
                                window.location.href = baseUrl.replace('{id}', checkItemVal) + (baseUrl.indexOf('?') > 0 ? '&' : '?') + 'BackURL=' + $cy.urlTools.encodeBackURL();
                            }
                        });

                        return false;
                    }

                    window.location.href = baseUrl.replace('{id}', checkItemVal) + (baseUrl.indexOf('?') > 0 ? '&' : '?') + 'BackURL=' + $cy.urlTools.encodeBackURL();
                } else {
                    $cy.warn('请选择一条记录.');
                }
            });

            $('.action a.deleteRow').click(function () {
                var deleteAction = this;
                $cy.confirm({
                    message: '将要执行删除数据操作,是否继续?', yes: function () {
                        window.location.href = deleteAction.href;
                    }
                });
                return false;
            });
            //Table init 结束

        }
    },
    validate: {
        submiting: false,
        validFiledTips: {},
        init: function () {
            var validFiledTips = $cy.validate.validFiledTips;
            var submiting = $cy.validate.submiting;
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
                    submiting = true;
                    $cy.waiting();
                    form.submit();
                }
                , success: function (label, element) {
                    var fieldName = element.name;

                    if (validFiledTips[fieldName]) {
                        layer.close(validFiledTips[fieldName]);
                        validFiledTips[fieldName] = undefined;
                    }
                    $(element).removeClass('has-error').addClass('has-success');
                }
                , errorPlacement: function (error, element) {
                    if ($(error).html() == '') {
                        return true;
                    }
                    var point = 1;
                    var target = element;

                    var fieldName = element[0].name;

                    //如果存在label,则显示在label右侧.
                    var fieldLabel = $('label[for="' + fieldName + '"]');
                    if (fieldLabel.size() > 0) {
                        point = 2;
                        target = fieldLabel;
                    }

                    if (validFiledTips[fieldName]) {
                        $('#error-tips-' + fieldName).find('.error').html($(error).html());
                    } else {
                        validFiledTips[fieldName] = layer.tips($('<div></div>').append(error).html(), target, {
                            id: 'error-tips-' + fieldName
                            , tipsMore: true
                            , tips: [point, '#F24100']
                            , time: 0
                            , area: ['auto', '30px']
                            , topRevised: -6
                        });

                        $(element).removeClass('has-success').addClass('has-error');
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
                        $('div.error').hide();
                    }
                }
            });
        }
    }
};

//需要直接初始化的.
if ($.validator) {
    $cy.validate.init();
}

window.onbeforeunload = function () {
    if (!$cy.validate.submiting) {
        setTimeout(function () {
            //TODO 暂时不处理
            $cy.waiting();
        }, 100);
    }
};

urlPrefix = currentUrl = window.location.href;
urlSuffix = '';
if (currentUrl.indexOf('?') > 0) {
    urlPrefix = currentUrl.substring(0, currentUrl.indexOf('?'));
    urlSuffix = currentUrl.substring(currentUrl.indexOf('?') + 1);
}

//初始化页面
$(function () {
    var nowtime = $('.nowtime');
    //时间
    if (nowtime[0]) {
        var set = setInterval(function () {
            nowtime.html(laydate.now(0, 'yyyy年MM月dd日 HH:mm:ss'));
        }, 1000);
    }

    $cy.initDatePick();
    $cy.table.init();
    // $cy.handleUniform();

    var isFrame = top != window;
    var rdow = top.document.getElementById('rightFrame') ? top.document.getElementById('rightFrame').contentWindow : top;
    var rdoc = rdow.document;

    $('body').on('keydown', function (event) {
        var ev = window.event || event;
        // console.log(ev.keyCode, ev.key)

        var focusInput = $(':input:focus').size() > 0;


        //无焦点输入框状态按e进入选中行编辑界面
        if (!focusInput && (ev.key == 'e' || ev.keyCode == 13)) {
            if ($('.btn.update', rdoc).size() > 0) {
                //如果存在修改按钮,则点击按钮
                $('.btn.update', rdoc).click();
                return false;
            }
            return true;
        }

        //无焦点状态输入框s 活ctrl+回车 活cmd+回车 提交表单
        if ((ev.ctrlKey || ev.metaKey) && (ev.keyCode == 13 || ev.key == 's' || ev.key == 'S')) {
            if ($('#inputForm', rdoc).size() > 0) {
                $('#inputForm', rdoc).submit();
                return false;
            }
            return true;
        }

        if (!focusInput && (ev.key == 'Backspace' || ev.key == 'z')) {
            if ($cy.place.preUrl() != '/') {
                if (isFrame) {
                    //无焦点状态输入框 'Backspace' 返回上一层
                    rdow.location.href = $cy.place.preUrl();
                    return false;
                }
            }
            return true;
        }

        //shift+d 删除选中行
        if (ev.shiftKey && (ev.key == 'D' || ev.key == 'd')) {
            $('.btn.delete', rdoc).click();
            return true;
        }

        var $table = $('#contentTable', rdoc);
        var checkbox = rdow.$cy.table.getFirstSelectedCheckbox($table);

        //上下切换选中table行
        if (!focusInput && (ev.keyCode == 38)) {
            if ($('#contentTable', rdoc).size() > 0) {
                if (checkbox.size() > 0) {
                    checkbox.parents('tr').prev().find('td').eq(2).click()
                } else {
                    $('#contentTable tbody tr:last', rdoc).find('input[type=checkbox]').attr('checked', true);
                }
                return false;
            }
            return true;
        }
        //上下切换选中table行
        if (!focusInput && (ev.keyCode == 40)) {
            if ($('#contentTable', rdoc).size() > 0) {
                if (checkbox.size() > 0) {
                    checkbox.parents('tr').next().find('td').eq(2).click()
                } else {
                    $('#contentTable tbody tr:first', rdoc).find('input[type=checkbox]').attr('checked', true);
                }
                return false;
            }

            return true;
        }


        //空格快速关闭提示框
        if (!focusInput && (ev.keyCode == 32)) {
            var $btn = $('.layui-layer[type=dialog]:last .layui-layer-btn', top.document).children('a,input,button').eq(0);

            if ($btn.size() <= 0) {
                $btn = $('.layui-layer[type=dialog]:last .layui-layer-btn', rdoc).children('a,input,button').eq(0);
            }

            if ($btn.size() > 0) {
                $btn.click();
                return false;
            }

            return true;
        }

    });

    setTimeout(function () {
        var $i = $('input:visible:not([readonly],[disabled])', rdoc).eq(0);
        var v = $i.val();
        $i.val('xxxxxx').focus().val(v).blur();
    }, 200);

    if (window == top) {
        setTimeout(function () {
            //TODO 暂时不处理
            $cy.waitingOver();
        }, 800);
    }

});
