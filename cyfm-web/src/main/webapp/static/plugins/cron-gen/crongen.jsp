<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jspf" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Cron表达式生成器</title>
    <link href="${ctx}/static/plugins/cron-gen/cron/themes/bootstrap/easyui.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/cron-gen/cron/themes/icon.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/plugins/cron-gen/cron/icon.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .line {
            height: 25px;
            line-height: 25px;
            margin: 3px;
        }

        .imp {
            padding-left: 25px;
        }

        .col {
            width: 95px;
        }

        ul {
            list-style: none;
            padding-left: 10px;
        }

        li {
            height: 20px;
        }
        .corn-preview td{
            padding: 3px;
        }
        .imp label{
            width: 40px;
        }
        .numberspinner {
            padding-left: 5px !important;
        }
        .line label{
            line-height: 25px;
            vertical-align:middle
        }
    </style>
    <script>
        _ctx = "${ctx}"
    </script>
    <script src="${ctx}/static/plugins/cron-gen/cron/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/plugins/cron-gen/cron/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/plugins/cron-gen/cron/cron.js" type="text/javascript"></script>
</head>
<body>
<div class="easyui-layout" style="visibility: hidden;height:350px; border: 1px rgb(202, 196, 196) solid;
            border-radius: 5px;">
    <div class="col-xs-8" style="height: 100%;padding-left: 0px;padding-right: 0px;">
        <div class="easyui-tabs" data-options="fit:true,border:false">
            <div title="秒">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="second" onclick="everyTime(this)">
                        每秒 允许的通配符[, - * /]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="second" onclick="cycle(this)">
                        周期从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:58" value="1"
                               id="secondStart_0">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:59" value="2"
                               id="secondEnd_0">
                        秒
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="second" onclick="startOn(this)">
                        从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:0,max:59" value="0"
                               id="secondStart_1">
                        秒开始,每
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:59" value="1"
                               id="secondEnd_1">
                        秒执行一次
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="second" id="sencond_appoint">
                        指定
                    </label>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="0"> 00</label>
                        <label><input type="checkbox" value="1"> 01</label>
                        <label><input type="checkbox" value="2"> 02</label>
                        <label><input type="checkbox" value="3"> 03</label>
                        <label><input type="checkbox" value="4"> 04</label>
                        <label><input type="checkbox" value="5"> 05</label>
                        <label><input type="checkbox" value="6"> 06</label>
                        <label><input type="checkbox" value="7"> 07</label>
                        <label><input type="checkbox" value="8"> 08</label>
                        <label><input type="checkbox" value="9"> 09</label>
                    </div>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="10"> 10</label>
                        <label><input type="checkbox" value="11"> 11</label>
                        <label><input type="checkbox" value="12"> 12</label>
                        <label><input type="checkbox" value="13"> 13</label>
                        <label><input type="checkbox" value="14"> 14</label>
                        <label><input type="checkbox" value="15"> 15</label>
                        <label><input type="checkbox" value="16"> 16</label>
                        <label><input type="checkbox" value="17"> 17</label>
                        <label><input type="checkbox" value="18"> 18</label>
                        <label><input type="checkbox" value="19"> 19</label>
                    </div>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="20"> 20</label>
                        <label><input type="checkbox" value="21"> 21</label>
                        <label><input type="checkbox" value="22"> 22</label>
                        <label><input type="checkbox" value="23"> 23</label>
                        <label><input type="checkbox" value="24"> 24</label>
                        <label><input type="checkbox" value="25"> 25</label>
                        <label><input type="checkbox" value="26"> 26</label>
                        <label><input type="checkbox" value="27"> 27</label>
                        <label><input type="checkbox" value="28"> 28</label>
                        <label><input type="checkbox" value="29"> 29</label>
                    </div>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="30"> 30</label>
                        <label><input type="checkbox" value="31"> 31</label>
                        <label><input type="checkbox" value="32"> 32</label>
                        <label><input type="checkbox" value="33"> 33</label>
                        <label><input type="checkbox" value="34"> 34</label>
                        <label><input type="checkbox" value="35"> 35</label>
                        <label><input type="checkbox" value="36"> 36</label>
                        <label><input type="checkbox" value="37"> 37</label>
                        <label><input type="checkbox" value="38"> 38</label>
                        <label><input type="checkbox" value="39"> 39</label>
                    </div>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="40"> 40</label>
                        <label><input type="checkbox" value="41"> 41</label>
                        <label><input type="checkbox" value="42"> 42</label>
                        <label><input type="checkbox" value="43"> 43</label>
                        <label><input type="checkbox" value="44"> 44</label>
                        <label><input type="checkbox" value="45"> 45</label>
                        <label><input type="checkbox" value="46"> 46</label>
                        <label><input type="checkbox" value="47"> 47</label>
                        <label><input type="checkbox" value="48"> 48</label>
                        <label><input type="checkbox" value="49"> 49</label>
                    </div>
                    <div class="imp secondList">
                        <label><input type="checkbox" value="50"> 50</label>
                        <label><input type="checkbox" value="51"> 51</label>
                        <label><input type="checkbox" value="52"> 52</label>
                        <label><input type="checkbox" value="53"> 53</label>
                        <label><input type="checkbox" value="54"> 54</label>
                        <label><input type="checkbox" value="55"> 55</label>
                        <label><input type="checkbox" value="56"> 56</label>
                        <label><input type="checkbox" value="57"> 57</label>
                        <label><input type="checkbox" value="58"> 58</label>
                        <label><input type="checkbox" value="59"> 59</label>
                    </div>
                </div>
            </div>
            <div title="分钟">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="min" onclick="everyTime(this)">
                        分钟 允许的通配符[, - * /]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="min" onclick="cycle(this)">
                        周期从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:58" value="1"
                               id="minStart_0">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:59" value="2"
                               id="minEnd_0">
                        分钟
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="min" onclick="startOn(this)">
                        从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:0,max:59" value="0"
                               id="minStart_1">
                        分钟开始,每
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:59" value="1"
                               id="minEnd_1">
                        分钟执行一次
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="min" id="min_appoint">
                        指定
                    </label>
                    <div class="imp minList">
                        <label><input type="checkbox" value="0"> 00</label>
                        <label><input type="checkbox" value="1"> 01</label>
                        <label><input type="checkbox" value="2"> 02</label>
                        <label><input type="checkbox" value="3"> 03</label>
                        <label><input type="checkbox" value="4"> 04</label>
                        <label><input type="checkbox" value="5"> 05</label>
                        <label><input type="checkbox" value="6"> 06</label>
                        <label><input type="checkbox" value="7"> 07</label>
                        <label><input type="checkbox" value="8"> 08</label>
                        <label><input type="checkbox" value="9"> 09</label>
                    </div>
                    <div class="imp minList">
                        <label><input type="checkbox" value="10"> 10</label>
                        <label><input type="checkbox" value="11"> 11</label>
                        <label><input type="checkbox" value="12"> 12</label>
                        <label><input type="checkbox" value="13"> 13</label>
                        <label><input type="checkbox" value="14"> 14</label>
                        <label><input type="checkbox" value="15"> 15</label>
                        <label><input type="checkbox" value="16"> 16</label>
                        <label><input type="checkbox" value="17"> 17</label>
                        <label><input type="checkbox" value="18"> 18</label>
                        <label><input type="checkbox" value="19"> 19</label>
                    </div>
                    <div class="imp minList">
                        <label><input type="checkbox" value="20"> 20</label>
                        <label><input type="checkbox" value="21"> 21</label>
                        <label><input type="checkbox" value="22"> 22</label>
                        <label><input type="checkbox" value="23"> 23</label>
                        <label><input type="checkbox" value="24"> 24</label>
                        <label><input type="checkbox" value="25"> 25</label>
                        <label><input type="checkbox" value="26"> 26</label>
                        <label><input type="checkbox" value="27"> 27</label>
                        <label><input type="checkbox" value="28"> 28</label>
                        <label><input type="checkbox" value="29"> 29</label>
                    </div>
                    <div class="imp minList">
                        <label><input type="checkbox" value="30"> 30</label>
                        <label><input type="checkbox" value="31"> 31</label>
                        <label><input type="checkbox" value="32"> 32</label>
                        <label><input type="checkbox" value="33"> 33</label>
                        <label><input type="checkbox" value="34"> 34</label>
                        <label><input type="checkbox" value="35"> 35</label>
                        <label><input type="checkbox" value="36"> 36</label>
                        <label><input type="checkbox" value="37"> 37</label>
                        <label><input type="checkbox" value="38"> 38</label>
                        <label><input type="checkbox" value="39"> 39</label>
                    </div>
                    <div class="imp minList">
                        <label><input type="checkbox" value="40"> 40</label>
                        <label><input type="checkbox" value="41"> 41</label>
                        <label><input type="checkbox" value="42"> 42</label>
                        <label><input type="checkbox" value="43"> 43</label>
                        <label><input type="checkbox" value="44"> 44</label>
                        <label><input type="checkbox" value="45"> 45</label>
                        <label><input type="checkbox" value="46"> 46</label>
                        <label><input type="checkbox" value="47"> 47</label>
                        <label><input type="checkbox" value="48"> 48</label>
                        <label><input type="checkbox" value="49"> 49</label>
                    </div>
                    <div class="imp minList">
                        <label><input type="checkbox" value="50"> 50</label>
                        <label><input type="checkbox" value="51"> 51</label>
                        <label><input type="checkbox" value="52"> 52</label>
                        <label><input type="checkbox" value="53"> 53</label>
                        <label><input type="checkbox" value="54"> 54</label>
                        <label><input type="checkbox" value="55"> 55</label>
                        <label><input type="checkbox" value="56"> 56</label>
                        <label><input type="checkbox" value="57"> 57</label>
                        <label><input type="checkbox" value="58"> 58</label>
                        <label><input type="checkbox" value="59"> 59</label>
                    </div>
                </div>

            </div>
            <div title="小时">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="hour" onclick="everyTime(this)">
                        小时 允许的通配符[, - * /]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="hour" onclick="cycle(this)">
                        周期从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:0,max:23" value="0"
                               id="hourStart_0">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:23" value="2"
                               id="hourEnd_0">
                        小时
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="hour" onclick="startOn(this)">
                        从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:0,max:23" value="0"
                               id="hourStart_1">
                        小时开始,每
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:23" value="1"
                               id="hourEnd_1">
                        小时执行一次
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="hour" id="hour_appoint">
                        指定
                    </label>
                    <div>
                        <div class="imp hourList">
                            <label><input type="checkbox" value="0"> 00</label>
                            <label><input type="checkbox" value="1"> 01</label>
                            <label><input type="checkbox" value="2"> 02</label>
                            <label><input type="checkbox" value="3"> 03</label>
                            <label><input type="checkbox" value="4"> 04</label>
                            <label><input type="checkbox" value="5"> 05</label>
                        </div>
                        <div class="imp hourList">
                            <label><input type="checkbox" value="6"> 06</label>
                            <label><input type="checkbox" value="7"> 07</label>
                            <label><input type="checkbox" value="8"> 08</label>
                            <label><input type="checkbox" value="9"> 09</label>
                            <label><input type="checkbox" value="10"> 10</label>
                            <label><input type="checkbox" value="11"> 11</label>
                        </div>
                        <div class="imp hourList">
                            <label><input type="checkbox" value="12"> 12</label>
                            <label><input type="checkbox" value="13"> 13</label>
                            <label><input type="checkbox" value="14"> 14</label>
                            <label><input type="checkbox" value="15"> 15</label>
                            <label><input type="checkbox" value="16"> 16</label>
                            <label><input type="checkbox" value="17"> 17</label>
                        </div>
                        <div class="imp hourList">
                            <label><input type="checkbox" value="18"> 18</label>
                            <label><input type="checkbox" value="19"> 19</label>
                            <label><input type="checkbox" value="20"> 20</label>
                            <label><input type="checkbox" value="21"> 21</label>
                            <label><input type="checkbox" value="22"> 22</label>
                            <label><input type="checkbox" value="23"> 23</label>
                        </div>
                    </div>
                </div>
            </div>
            <div title="日">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="day" value="1" onclick="everyTime(this)">
                        日 允许的通配符[, - * / L W]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="day" value="0" onclick="unAppoint(this)">
                        不指定
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="day" onclick="cycle(this)">
                        周期从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:31" value="1"
                               id="dayStart_0">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:31" value="2"
                               id="dayEnd_0">
                        日
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="day" onclick="startOn(this)">
                        从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:31" value="1"
                               id="dayStart_1">
                        日开始,每
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:31" value="1"
                               id="dayEnd_1">
                        天执行一次
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="day" onclick="workDay(this)">
                        每月
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:31" value="1"
                               id="dayStart_2">
                        号最近的那个工作日
                        <input type="radio" name="day" onclick="lastDay(this)">
                        本月最后一天
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="day" id="day_appoint">
                        指定
                    </label>
                    <div class="imp dayList">
                        <label><input type="checkbox" value="1"> 1</label>
                        <label><input type="checkbox" value="2"> 2</label>
                        <label><input type="checkbox" value="3"> 3</label>
                        <label><input type="checkbox" value="4"> 4</label>
                        <label><input type="checkbox" value="5"> 5</label>
                        <label><input type="checkbox" value="6"> 6</label>
                        <label><input type="checkbox" value="7"> 7</label>
                        <label><input type="checkbox" value="8"> 8</label>
                        <label><input type="checkbox" value="9"> 9</label>
                        <label><input type="checkbox" value="10"> 10</label>
                    </div>
                    <div class="imp dayList">
                        <label><input type="checkbox" value="11"> 11</label>
                        <label><input type="checkbox" value="12"> 12</label>
                        <label><input type="checkbox" value="13"> 13</label>
                        <label><input type="checkbox" value="14"> 14</label>
                        <label><input type="checkbox" value="15"> 15</label>
                        <label><input type="checkbox" value="16"> 16</label>
                        <label><input type="checkbox" value="17"> 17</label>
                        <label><input type="checkbox" value="18"> 18</label>
                        <label><input type="checkbox" value="19"> 19</label>
                        <label><input type="checkbox" value="20"> 20</label>
                    </div>
                    <div class="imp dayList">
                        <label><input type="checkbox" value="21"> 21</label>
                        <label><input type="checkbox" value="22"> 22</label>
                        <label><input type="checkbox" value="23"> 23</label>
                        <label><input type="checkbox" value="24"> 24</label>
                        <label><input type="checkbox" value="25"> 25</label>
                        <label><input type="checkbox" value="26"> 26</label>
                        <label><input type="checkbox" value="27"> 27</label>
                        <label><input type="checkbox" value="28"> 28</label>
                        <label><input type="checkbox" value="29"> 29</label>
                        <label><input type="checkbox" value="30"> 30</label>
                    </div>
                    <div class="imp dayList">
                        <label><input type="checkbox" value="31"> 31</label>
                    </div>
                </div>
            </div>
            <div title="月">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="mouth" onclick="everyTime(this)">
                        月 允许的通配符[, - * /]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio"  value="0" name="mouth" onclick="unAppoint(this)">
                        不指定
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="mouth" onclick="cycle(this)">
                        周期从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:12" value="1"
                               id="mouthStart_0">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:12" value="2"
                               id="mouthEnd_0">
                        月
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="mouth" onclick="startOn(this)">
                        从
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:12" value="1"
                               id="mouthStart_1">
                        日开始,每
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:12" value="1"
                               id="mouthEnd_1">
                        月执行一次
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="mouth" id="mouth_appoint">
                        指定
                    </label>
                    <div class="imp mouthList">
                        <label><input type="checkbox" value="1"> 1</label>
                        <label><input type="checkbox" value="2"> 2</label>
                        <label><input type="checkbox" value="3"> 3</label>
                        <label><input type="checkbox" value="4"> 4</label>
                        <label><input type="checkbox" value="5"> 5</label>
                        <label><input type="checkbox" value="6"> 6</label>
                    </div>
                    <div class="imp hourList">
                        <label><input type="checkbox" value="7"> 7</label>
                        <label><input type="checkbox" value="8"> 8</label>
                        <label><input type="checkbox" value="9"> 9</label>
                        <label><input type="checkbox" value="10"> 10</label>
                        <label><input type="checkbox" value="11"> 11</label>
                        <label><input type="checkbox" value="12"> 12</label>
                    </div>
                </div>
            </div>
            <div title="周">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="week" value="1" onclick="everyTime(this)">
                        周 允许的通配符[, - * / L #]
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="week" value="0" onclick="unAppoint(this)">
                        不指定
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="week" onclick="startOn(this)">
                        周期 从星期
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:7"
                               id="weekStart_0" value="1">
                        -
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:2,max:7" value="2"
                               id="weekEnd_0">
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="week" onclick="weekOfDay(this)">
                        第
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:4" value="1"
                               id="weekStart_1">
                        周 的星期
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:7"
                               id="weekEnd_1" value="1">
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="week" onclick="lastWeek(this)">
                        本月最后一个星期
                        <input class="numberspinner" style="width: 60px;height: 27px" data-options="min:1,max:7"
                               id="weekStart_2" value="1">
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="week" id="week_appoint">
                        指定
                    </label>
                    <div class="imp weekList">
                        <label><input type="checkbox" value="1"> 1</label>
                        <label><input type="checkbox" value="2"> 2</label>
                        <label><input type="checkbox" value="3"> 3</label>
                        <label><input type="checkbox" value="4"> 4</label>
                        <label><input type="checkbox" value="5"> 5</label>
                        <label><input type="checkbox" value="6"> 6</label>
                        <label><input type="checkbox" value="7"> 7</label>
                    </div>
                </div>
            </div>
            <div title="年">
                <div class="line">
                    <label>
                        <input type="radio" checked="checked" name="year" onclick="unAppoint(this)">
                        不指定 允许的通配符[, - * /] 非必填
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="year" onclick="everyTime(this)">
                        每年
                    </label>
                </div>
                <div class="line">
                    <label>
                        <input type="radio" name="year" onclick="cycle(this)">
                        周期 从
                        <input class="numberspinner" style="width: 90px;height: 27px;" data-options="min:2010,max:2099"
                               id="yearStart_0" value="2017">
                        -
                        <input class="numberspinner" style="width: 90px;height: 27px;" data-options="min:2011,max:2099"
                               id="yearEnd_0" value="2018">
                    </label>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="col-xs-4" style="height: 100%;padding-left: 0px;padding-right: 0px;" data-options="border:false">
        <div class="easyui-tabs" data-options="fit:true,border:false">
            <div title="表达式预览">
                <table class="corn-preview">
                    <tbody>
                    <tr style="display: none;">
                        <td>
                        </td>
                        <td align="center">
                            秒
                        </td>
                        <td align="center">
                            分钟
                        </td>
                        <td align="center">
                            小时
                        </td>
                        <td align="center">
                            日
                        </td>
                        <td align="center">
                            月<br/>
                        </td>
                        <td align="center">
                            星期
                        </td>
                        <td align="center">
                            年
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td>
                            表达式字段:
                        </td>
                        <td>
                            <input type="text" name="v_second" class="col" value="*" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_min" class="col" value="*" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_hour" class="col" value="*" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_day" class="col" value="*" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_mouth" class="col" value="*" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_week" class="col" value="?" readonly="readonly"/>
                        </td>
                        <td>
                            <input type="text" name="v_year" class="col" readonly="readonly"/>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap="nowrap">表达式:</td>
                        <td colspan="6"><input type="text" name="cron" style="width: 100%;" value="* * * * * ?"
                                               id="cron"
                        /></td>
                        <td><input type="button" value="预览 " id="btnFan" onclick="$('#cron').blur();"/></td>
                    </tr>
                    <tr>
                        <td colspan="8">最近5次运行时间:</td>
                    </tr>
                    <tr>
                        <td colspan="8" id="runTime">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="color:red;">(仅参考,无结果请自行验证正确性)</td>
                    </tr>
                    </tbody>
                </table>
                <div style="text-align: center; margin-top: 5px;">
                    <div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        setTimeout(function () {
            $('.easyui-layout').css('visibility','visible')
        },800);

        $(".imp label").click(function () {
            $(this).parents(".line").find("input[type=radio]").attr("checked", true).change();
        });
    })
</script>
</body>
</html>
