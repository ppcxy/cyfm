<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="header navbar navbar-default navbar-static-top">
	<div class="front-topbar">
		<div class="container">
			<div class="row">
				<%--<div class="col-md-9 col-sm-9">
					<ul class="list-unstyled inline">
						<li><i class="fa fa-phone topbar-info-icon top-2"></i>联系我们: 15611688520</li>
						<li class="sep"><span>|</span></li>
						<li><i class="fa fa-envelope-o topbar-info-icon top-2"></i>Email: <span>25004762@qq.com</span></li>
					</ul>
				</div>--%>
				<div class="col-md-3 col-sm-3 login-reg-links pull-right">
					<ul class="list-unstyled inline pull-right">
					    <shiro:guest>  
                        <li><a href="${ctx }/login.html">登录</a></li>
                        <li class="sep"><span>|</span></li>
                        <li><a href="${ctx }/register.html">注册</a></li>
                        </shiro:guest>
                        
                        <shiro:user> 
						<li><a href="${ctx }/<shiro:hasRole name="admin">admin/main</shiro:hasRole><shiro:lacksRole name="admin">user/</shiro:lacksRole>"><shiro:principal property="name"/></a></li>
						<li class="sep"><span>|</span></li>
						<li><a href="${ctx }/exitSystem">退出</a></li>
						</shiro:user>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="navbar-header">
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<button class="navbar-toggle btn navbar-btn" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN LOGO (you can use logo image instead of text)-->
			<a class="navbar-brand logo-v2" href="${ctx}/">PPCXY品牌程序员网</a>
			<!-- END LOGO -->
		</div>

		<!-- BEGIN TOP NAVIGATION MENU -->
		<div id="main_navbar" class="navbar-collapse collapse pull-right">
			<ul class="nav navbar-nav">
				<li class="dh" id="root"><a href="${ctx }/">首页</a></li>
				<li class="dh" id="coderHelp"><a href="${ctx }/coderHelp/question.html" class="yrb" title="程序猿要团结，在猿人帮中，我们程序猿之间要互相团结，互相帮助，先来者为后来者答疑解惑，同时自己也得到锻炼的机会。学习雷锋，”奉献他人，提升自己；“">猿人帮</a></li>
				<li class="xdh"><a href="javascript:;" class="nrb" data-info="为牛人排一个榜，位居榜首将得到莫大的荣誉，提升了逼格，同时为今后仕途有所助益。">牛人榜</a></li>
				<li class="xdh"><a href="javascript:;" class="ssh" data-info="程序猿也是人，程序员也有生活，大胆的秀出我们的生活，让世人都看到我们(为单身的程序猿们提供一个平台哦亲)">晒生活</a></li>
				<li class="xdh"><a href="javascript:;" class="xbg" data-info="程序猿们都有自己的自信，有自己的世界，有自己的任性，有自己的逼格。让我门大胆的秀出自己的逼格吧，技能方面：做过哪些牛逼项目，得过那些牛逼奖项，生活上做过什么牛逼的大事，感觉自己哪里最牛逼，都大胆的秀出来吧。">秀逼格</a></li>
				<li class="xdh"><a href="javascript:;" class="tct" data-info="生活难免不如意，工作中忍着别吐槽，和同事吐槽更是职场之大忌讳，来这里吧，ppcxy为广大程序猿们提供了吐槽桶栏目，在这里大家可以匿名的尽情吐槽，把想要吐槽的都吐出来，自由桶帮你接着，让大家来倾听你的吐槽。">吐槽桶</a></li>
				<li class="xdh"><a href="javascript:;" class="bgs" data-info="在公司很孤单吧？没朋友？想找一些志同道合的朋友来？---公司领导想招人么？奈何没人了解公司的好？都来这里爆出公司的好吧，这里汇聚了广大程序猿们，相信你们会找到自己想要的。">爆公司</a></li>
				<li class="xdh"><a href="javascript:;" class="zgz" data-info="这里不是智联招聘，不是58同城，但是这里有广大的程序猿门，话说猿多力量大，总有一个公司适合你，秀出你的需求，秀出你的需要，让程序猿们互相找工作。">找工作</a></li>
				<li class="xdh"><a href="javascript:;" class="bsh" data-info="话说，师傅领进门，修行靠个人，这里提供给大家一个拜师的平台，多说一句，程序猿之间是有友情在的，大多数程序猿谦虚友善，无所谓师徒，互相学习亦师亦友。">拜师汇</a></li>
			</ul>
		</div>
		<!-- BEGIN TOP NAVIGATION MENU -->
	</div>
</div>