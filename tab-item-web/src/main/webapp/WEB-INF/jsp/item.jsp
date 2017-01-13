<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<title>${item.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<style type="text/css">
    .header-search-child {
        position: relative;
    }
</style>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" /><!-- animation -->
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->   
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<script src="js/owl.carousel.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/vue.js"></script>
<!--flex slider-->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script>
    // Can also be used with $(document).ready()
    $(window).load(function() {
      $('.flexslider').flexslider({
        animation: "slide",
        controlNav: "thumbnails"
      });
    });
</script>
<!--flex slider-->
<script src="js/imagezoom.js"></script>
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();  
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function(i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10, 
                zIndex: 999
            });
        });
    });
</script>
<!-- //scroll to fixed--> 
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script> 
<script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){     
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
    $(document).ready(function() {
    
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear' 
        };
        
        $().UItoTop({ easingType: 'easeOutQuart' });
        
    });
</script>
<!-- //smooth-scrolling-of-move-up -->  
</head>
<body>
    <!-- header -->
    <div class="header">
        <div class="w3ls-header"><!--header-one--> 
            <div class="w3ls-header-left">
                <p><a href="#">开发娱乐网站 | 看看就好 </a></p>
            </div>
            <div class="w3ls-header-right">
                <ul>
                    <li class="dropdown head-dpdn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i> 我的账号<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            
                            <li v-if="!isLogin"><a href="http://qinteng.xin:8088/page/login">登陆 </a></li> 
                            <li v-else><a href="javascript:void(0);">欢迎:{{username}}</a></li>
                            <li><a href="http://qinteng.xin:8088/page/register">免费注册</a></li> 
                            <li><a href="http://qinteng.xin:8090/cart/cart.html">购物车</a></li>  
                            <li><a href="javascript:void(0);">钱包</a></li>
                            <li v-if="isLogin"><a href="javascript:void(0);" @click="signout">退出</a></li>
                        </ul> 
                    </li> 
                    <li class="dropdown head-dpdn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-percent" aria-hidden="true"></i> 今天的交易<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0);">返现优惠</a></li> 
                            <li><a href="javascript:void(0);">产品折扣</a></li>
                            <li><a href="javascript:void(0);">特别优惠</a></li> 
                        </ul> 
                    </li> 
                    <li class="dropdown head-dpdn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gift" aria-hidden="true"></i> 礼品卡<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0);">产品礼品卡</a></li> 
                            <li><a href="javascript:void(0);">场合登记</a></li>
                            <li><a href="javascript:void(0);">查看余额</a></li> 
                        </ul> 
                    </li> 
                    <li class="dropdown head-dpdn">
                        <a href="javascript:void(0);" class="dropdown-toggle"><i class="fa fa-map-marker" aria-hidden="true"></i> 商店搜索</a>
                    </li> 
                    <li class="dropdown head-dpdn">
                        <a href="javascript:void(0);" class="dropdown-toggle"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> 信用卡</a>
                    </li> 
                    <li class="dropdown head-dpdn">
                        <a href="javascript:void(0);" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a>
                    </li>
                </ul>
            </div>
            <div class="clearfix"> </div> 
        </div>
        <div class="header-two"><!-- header-two -->
            <div class="container">
                <div class="header-logo">
                    <h1><a href="http://qinteng.xin"><span>tab</span><i></i></a></h1>
                    <h6></h6> 
                </div>  
                <div class="header-search">
                    <div class="header-search-child">
                        <input type="search" name="Search" placeholder="solr.slor.solr" required="" v-model="searchValue" @keyup.enter="search">
                        <button type="button" target="_blank" class="btn btn-default" aria-label="Left Align" @click="search">
                            <i class="fa fa-search" aria-hidden="true"> </i>
                        </button>
                    </div>
                </div>
                <div class="header-cart"> 
                    <div class="my-account">
                        <a href="http://qinteng.xin:8090/cart/cart.html" ><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>购物车</a>                       
                    </div>
                    <div class="cart"> 
                        <form action="#" method="post" class="last"> 
                            <input type="hidden" name="cmd" value="_cart" />
                            <input type="hidden" name="display" value="1" />
                            <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                        </form>  
                    </div>
                    <div class="clearfix"> </div> 
                </div> 
                <div class="clearfix"> </div>
            </div>      
        </div><!-- //header-two -->
        <div class="header-three"><!-- header-three -->
            <div class="container">
                <div class="menu">
                    <div class="cd-dropdown-wrapper">
                        <a class="cd-dropdown-trigger" href="#0">商城分类</a>
                        <nav class="cd-dropdown"> 
                            <a href="#0" class="cd-close">Close</a>
                            <ul class="cd-dropdown-content"> 
                                <li class="has-children">
                                    <a href="#">图书、音像、电子书刊</a> 
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=音乐">All Electronics</a></li>
                                        <li class="has-children">
                                            <a href="#">电子书刊</a>  
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Electronics</a></li> 
                                                <li class="has-children">
                                                    <a href="#">音像</a> 
                                                    <ul class="is-hidden"> 
                                                        <li class="go-back"><a href="#"> </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=音乐">音乐</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=影视">影视</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=教育音像">教育音像</a></li>
                                                    </ul>
                                                </li>
                                                <li> <a href="http://qinteng.xin:8085/search?q=网络原创">网络原创</a> </li>
                                                <li><a href="http://qinteng.xin:8085/search?q=数字杂志">数字杂志</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=多媒体图书">多媒体图书</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电子书">电子书</a></li> 
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">英文原版</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Electronics </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=少儿">少儿</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=商务投资">商务投资</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=英语学习与考试">英语学习与考试</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=小说">小说</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=传记">传记</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">文艺</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Electronics</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=小说">小说</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=文学">文学</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=传记">传记</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=艺术">艺术</a></li>
                                                <li class="has-children">
                                                    <a href="#">少儿</a>
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#"> </a></li> 
                                                        <li><a href="http://qinteng.xin:8085/search?q=少儿">少儿 </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=0-2岁">0-2岁</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=3-6岁">3-6岁</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=7-10岁">7-10岁</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=11-14岁">11-14岁</a></li>
                                                    </ul>
                                                </li> 
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">人文社科</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#0">All Electronics </a></li>
                                                <li class="has-children"><a href="#">生活</a>
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#0"> </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=生活">生活</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=健身与保健">健身与保健</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=家庭与育儿">家庭与育儿</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=旅游">旅游</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=动漫/幽默">动漫/幽默</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="http://qinteng.xin:8085/search?q=历史">历史</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=哲学">哲学</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=国学">国学</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=政治/军事">政治/军事</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=法律">法律</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=宗教">宗教</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">科技</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#0">All Electronics </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=科技">科技</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=工程">工程</a></li>
                                                <li class="has-children"><a href="#">经管励志</a>
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#0"> </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=经济">经济</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=金融与投资">金融与投资</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=管理">管理</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=励志与成功">励志与成功</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=计算机与互联网">计算机与互联网</a></li> 
                                                        <li><a href="http://qinteng.xin:8085/search?q=体育.运动">体育.运动</a></li> 
                                                    </ul>
                                                </li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=建筑">建筑</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=医学">医学</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=科学与自然">科学与自然</a></li>  
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">教育</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#0">All Electronics </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=教材教辅">教材教辅</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=教育与考试">教育与考试</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=外语学习">外语学习</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=新闻出版">新闻出版</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=语言文学">语言文学</a></li>
                                            </ul>
                                        </li>
                                    </ul> <!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children -->
                                <li class="has-children">
                                    <a href="#">家用电器</a> 
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Fashion Stores</a></li>
                                        <li class="has-children">
                                            <a href="#">大家电</a> 
                                            <ul class="is-hidden">  
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=空调">空调</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=冰箱">冰箱</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=洗衣机">洗衣机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=家庭影院">家庭影院</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=消毒柜">消毒柜</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=热水器">热水器</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">生活电器</a> 
                                            <ul class="is-hidden">  
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电风扇">电风扇</a></li>  
                                                <li><a href="http://qinteng.xin:8085/search?q=净水器">净水器</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=吸尘器">吸尘器</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=清洁机">清洁机</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=加湿器">加湿器</a></li> 
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">厨房电器</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=豆浆机">豆浆机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电饭煲">电饭煲</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电磁炉">电磁炉</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=微波炉">微波炉</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=酸奶机">酸奶机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电水壶">电水壶</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">个人健康 </a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=剃须刀">剃须刀 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=脱毛器">脱毛器 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=口腔护理">口腔护理 </a></li>
                                                <li class="has-children">
                                                    <a href="#">护理 </a>  
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#"> </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=美容器">美容器</a></li>  
                                                        <li><a href="http://qinteng.xin:8085/search?q=美发器">美发器</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=按摩器">按摩器</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=足浴盆">足浴盆</a></li>
                                                    </ul> 
                                                </li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=体温计">体温计</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=血压计">血压计</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">五金</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电动工具">电动工具</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=手动工具">手动工具</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=龙头">龙头</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=厨卫五金">厨卫五金</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=家具五金">家具五金</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="http://qinteng.xin:8085/search?q=">家装</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Fashion Stores</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=灯具">灯具</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=门铃">门铃</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=插座">插座</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电器开关">电器开关</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电线/线缆">电线/线缆</a></li>   
                                            </ul>
                                        </li>
                                    </ul> <!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children -->
                                <li class="has-children">
                                    <a href="http://qinteng.xin:8085/search?q=电脑、办公">电脑、办公</a> 
                                    <ul class="cd-secondary-dropdown is-hidden"> 
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Kids Fashions</a></li>
                                        <li class="has-children">
                                            <a href="http://qinteng.xin:8085/search?q=">电脑整体</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Kids Fashions</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=笔记本">笔记本 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=超极本">超极本 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=游戏本">游戏本 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=台式机">台式机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=服务器/工作站">服务器/工作站</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children"><a href="#">电脑配件</a>
                                            <ul class="is-hidden">  
                                                <li class="go-back"><a href="#">All Kids Fashions</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=CPU">CPU</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=主板">主板 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=显卡">显卡</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=硬盘">硬盘</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=显示器">显示器</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children"><a href="#">外设产品</a>
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Kids Fashions</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=移动银盘">移动银盘 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=U盘">U盘 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=鼠标">鼠标</a></li> 
                                                <li class="has-children">
                                                    <a href="#">外置</a> 
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#"> </a></li> 
                                                        <li><a href="http://qinteng.xin:8085/search?q=UPS电源">UPS电源 </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=电脑工具">电脑工具 </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=游戏设备">游戏设备</a></li>  
                                                    </ul>
                                                </li>  
                                                <li><a href="http://qinteng.xin:8085/search?q=">键盘</a></li>    
                                            </ul><!-- .cd-secondary-dropdown --> 
                                        </li> <!-- .has-children -->                                
                                        <li class="has-children"><a href="#">网络产品 </a>
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#">All Kids Fashions</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=路由器">路由器</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=网卡">网卡 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=交换机">交换机</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=网络盒子">网络盒子 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=网络配件">网络配件</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children"><a href="#">办公设备 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#">All Kids Fashions</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=投影仪">投影仪</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=打印机">打印机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=碎纸机">碎纸机</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=保险柜">保险柜</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=监控">监控</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=验钞/点钞机">验钞/点钞机</a></li>
                                            </ul>   
                                        </li> 
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children --> 
                                <li class="has-children">
                                    <a href="#">个人化妆</a> 
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">面部护肤</a> 
                                            <ul class="is-hidden">  
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=清洁">清洁 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=护肤">护肤 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=面膜">面膜 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=剃须">剃须 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=套装">套装</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">口腔护理 </a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牙膏">牙膏</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=牙刷">牙刷</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牙粉">牙粉</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牙线">牙线</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=漱口水">漱口水</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=套装">套装</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">洗发护发 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=洗发">洗发</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=护发">护发</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=染发">染发</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=造型">造型</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=假发">假发</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=套装">套装</a></li>
                                            </ul>
                                        </li>  
                                        <li class="has-children">
                                            <a href="#">香水彩妆 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"> </a></li>  
                                                <li><a href="http://qinteng.xin:8085/search?q=香水">香水</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=底妆">底妆</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=腮红">腮红</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=眼部">眼部</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=唇部">唇部</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=美甲">美甲</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">女性护理</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=卫生巾">卫生巾 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=卫生护垫">卫生护垫</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=私密护理">私密护理 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=脱毛膏">脱毛膏</a></li>
                                            </ul>
                                        </li>  
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children -->  
                                <li class="has-children">
                                    <a href="#">母婴</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">营养辅食 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=益生菌/初乳">益生菌/初乳 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=米粉/菜粉">米粉/菜粉  </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=果泥/果汁">果泥/果汁 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=宝宝零食">宝宝零食</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=锌铁钙/维生素">锌铁钙/维生素 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">尿裤湿巾</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=婴儿尿裤">婴儿尿裤 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=拉拉裤">拉拉裤 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=湿巾">湿巾 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=成人尿裤">成人尿裤 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=尿不湿">尿不湿</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">喂养用品 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=奶瓶奶嘴">奶瓶奶嘴 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=吸奶器">吸奶器 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=水壶/水杯">水壶/水杯 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牙胶安抚">牙胶安抚</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=碗盆叉勺">碗盆叉勺</a></li> 
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">洗护用品 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=宝宝护肤">宝宝护肤</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=宝宝洗浴 ">宝宝洗浴 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=奶瓶清洗">奶瓶清洗</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=驱蚊防蚊">驱蚊防蚊 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=理发器">理发器</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=日常护理">日常护理</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">童车同床</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=婴儿推车">婴儿推车 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=餐椅摇椅">餐椅摇椅 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=婴儿床">婴儿床 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=学步车">学步车 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=三轮车">三轮车 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">妈妈专区</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=妈咪包/背婴带">妈咪包/背婴带 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=产后塑身">产后塑身 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=防辐射服">防辐射服 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=孕妇装">孕妇装 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=孕期营养">孕期营养 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=孕妈美容">孕妈美容 </a></li> 
                                            </ul>
                                        </li>   
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children -->  
                                <li class="has-children">
                                    <a href="#">食品饮料</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">进口食品 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=饼干蛋糕">饼干蛋糕 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=糖果巧克力">糖果巧克力 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=休闲食品">休闲食品</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=粮油调味">粮油调味 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牛奶">牛奶</a></li> 
                                            </ul> 
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">地方特产</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=北京">北京 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=新疆">新疆 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=山西">山西 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=内蒙古">内蒙古 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=福建">福建 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">休闲食品 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=坚果炒货">坚果炒货 </a></li>  
                                                <li><a href="http://qinteng.xin:8085/search?q=肉干肉脯">肉干肉脯 </a></li>                 <li><a href="http://qinteng.xin:8085/search?q=">糖果/巧克力 </a></li>       
                                                <li><a href="http://qinteng.xin:8085/search?q=无糖食品">无糖食品</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=休闲食品">休闲食品 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=果干">果干 </a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">粮油调味 </a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=米面杂粮">米面杂粮 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=食用油">食用油</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=调味品">调味品 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=有机食品">有机食品 </a></li> 
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">饮料冲调 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=饮用水">饮用水</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=饮料">饮料 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=牛奶乳品">牛奶乳品 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=咖啡/奶茶">咖啡/奶茶 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=蜂蜜/柚子茶">蜂蜜/柚子茶 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">茗茶 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=铁观音">铁观音</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=普洱">普洱 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=龙井">龙井</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=绿茶">绿茶</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=红茶">红茶</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=乌龙茶">乌龙茶</a></li>
                                            </ul>
                                        </li> 
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li> <!-- .has-children -->  
                                <li class="has-children">
                                    <a href="#">汽车用品</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">维修保养</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=润滑油">润滑油</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=添加剂">添加剂 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=防冻液 ">防冻液 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=滤清器">滤清器 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=雨刷">雨刷 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">车载电器 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=导航仪">导航仪 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=安全预警仪">安全预警仪 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=行车记录仪">行车记录仪 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=刀车雷达">刀车雷达</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=蓝牙设备">蓝牙设备</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">美容清洗 </a> 
                                            <ul class="is-hidden">  
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=车蜡">车蜡 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=补漆笔">补漆笔 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=玻璃水">玻璃水</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=清洁剂">清洁剂 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=洗车工具">洗车工具</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">汽车装饰 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=脚垫">脚垫 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=坐垫">坐垫 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=座套 ">座套 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=后备箱垫">后备箱垫</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=头枕腰靠">头枕腰靠</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">安全自驾</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=安全座椅">安全座椅</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=胎压充气">胎压充气</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=防盗设备">防盗设备</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=应急救援">应急救援</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=保温箱">保温箱</a></li>
                                            </ul>
                                        </li> 
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li> 
                                <li class="has-children">
                                    <a href="#">玩具乐器</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">遥控/电动</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=遥控车">遥控车 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=遥控飞机">遥控飞机 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=遥控船">遥控船 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=机器人">机器人 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">娃娃玩具</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=芭比娃娃">芭比娃娃</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=卡通娃娃">卡通娃娃  </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=智能娃娃">智能娃娃</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">健身玩具 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=炫舞毯">炫舞毯 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=爬行毯">爬行毯</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=户外玩具">户外玩具</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=戏水玩具 ">戏水玩具 </a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">益智玩具 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=摇铃/床铃">摇铃/床铃 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=健身架">健身架 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=早教启智">早教启智 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=拖拉玩具">拖拉玩具</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">乐器相关 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=钢琴">钢琴 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=吉他">吉他 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=民族管弦乐">民族管弦乐</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=西洋打击乐">西洋打击乐</a></li> 
                                            </ul>
                                        </li>  
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li>
                                <li class="has-children">
                                    <a href="#">手机数码</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">手机配件 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=手机电池">手机电池 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=蓝牙耳机">蓝牙耳机 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=充电线">充电线 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=手机储蓄卡">手机储蓄卡</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=手机保护套">手机保护套</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">手机品牌 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=iphone">iphone</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=华为">华为</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=三星">三星</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=小米">小米</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=魅族">魅族</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">摄影摄像 </a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=数码相机">数码相机 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=单反相机">单反相机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=摄像机">摄像机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=运动相机">运动相机 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=镜头">镜头 </a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">数码配件</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=读卡器">读卡器 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=滤镜">滤镜 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=闪光灯">闪光灯</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=三脚架">三脚架 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=相机包">相机包 </a></li>
                                            </ul>
                                        </li>  
                                        <li class="has-children">
                                            <a href="#">智能设备 </a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=智能手环">智能手环 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=智能手表">智能手表 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=智能眼镜">智能眼镜</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=智能家居">智能家居</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=健康监测">健康监测 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">电子教育</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电子词典">电子词典 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=录音笔">录音笔 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=复读机">复读机</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=学生平板">学生平板</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=早教机">早教机 </a></li>
                                            </ul>
                                        </li> 
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li>
                                <li class="has-children">
                                    <a href="#">家具家装</a>
                                    <ul class="cd-secondary-dropdown is-hidden">
                                        <li class="go-back"><a href="#">Menu</a></li>
                                        <li class="see-all"><a href="http://qinteng.xin:8085/search?q=">All Products</a></li>
                                        <li class="has-children">
                                            <a href="#">家纺</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li class="has-children"><a href="#">床上用品 </a>
                                                    <ul class="is-hidden">
                                                        <li class="go-back"><a href="#"> </a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=被子">被子</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=枕芯">枕芯</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=床单被罩">床单被罩</a></li>
                                                        <li><a href="http://qinteng.xin:8085/search?q=毯子">毯子</a></li>
                                                    </ul>                                               
                                                </li>
                                                <li><a href="http://qinteng.xin:8085/search?q=蚊帐">蚊帐 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=毛巾浴巾 ">毛巾浴巾 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=抱枕靠垫">抱枕靠垫 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=电热毯">电热毯 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">灯具</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=台灯">台灯 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=节能灯">节能灯 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=装饰灯">装饰灯 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=落地灯">落地灯</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=应急灯">应急灯 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">生活日用</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=收纳用品">收纳用品 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=雨伞雨具">雨伞雨具 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=浴室用品">浴室用品</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=缝纫/针织用品">缝纫/针织用品 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=净化除味">净化除味 </a></li>
                                            </ul>
                                        </li>
                                        <li class="has-children">
                                            <a href="#">家装软饰</a> 
                                            <ul class="is-hidden"> 
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=桌布/罩件">桌布/罩件 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=地毯地垫">地毯地垫 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=相框/照片墙">相框/照片墙</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=装饰字画">装饰字画 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=手工/十字绣">手工/十字绣 </a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">清洁用品</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=制品湿巾">制品湿巾 </a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=衣物清洁">衣物清洁 </a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=驱蚊用品">驱蚊用品</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=家庭清洁">家庭清洁</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=一次性用品">一次性用品</a></li>
                                            </ul>
                                        </li> 
                                        <li class="has-children">
                                            <a href="#">宠物生活</a> 
                                            <ul class="is-hidden">
                                                <li class="go-back"><a href="#"></a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=宠物主粮">宠物主粮</a></li> 
                                                <li><a href="http://qinteng.xin:8085/search?q=宠物零食">宠物零食</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=医疗保健">医疗保健</a></li>
                                                <li><a href="http://qinteng.xin:8085/search?q=家居日用">家居日用</a></li> 
                                            </ul>
                                        </li> 
                                    </ul><!-- .cd-secondary-dropdown --> 
                                </li>  
                            </ul> <!-- .cd-dropdown-content -->
                        </nav> <!-- .cd-dropdown -->
                    </div> <!-- .cd-dropdown-wrapper -->     
                </div>
                <div class="move-text">
                    <div class="marquee"><a href="offers.html"> 仅供参考 <span>本网站只是个人为了娱乐开发 </span> <span> 不涉及任何盈利行为</span></a></div>
                    <script type="text/javascript" src="js/jquery.marquee.min.js"></script>
                    <script>
                      $('.marquee').marquee({ pauseOnHover: true });
                      //@ sourceURL=pen.js
                    </script>
                </div>
            </div>
        </div>
    </div>
    <!-- //header --> 
    <!-- breadcrumbs --> 
    <div class="container"> 
        <ol class="breadcrumb breadcrumb1">
            <li><a href="http://qinteng.xin">主页</a></li>
            <li class="active">商品详情</li>
        </ol> 
        <div class="clearfix"> </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- products -->
    <div class="products">   
        <div class="container">  
            <div class="single-page">
                <div class="single-page-row" id="detail-21">
                    <div class="col-md-6 single-top-left">  
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="${item.images[0]}">
                                    <div class="thumb-image detail_images"> <img src="${item.images[0]}" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>
                                <li data-thumb="${item.images[1]}">
                                     <div class="thumb-image"> <img src="${item.images[1]}" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>
                                <li data-thumb="${item.images[2]}">
                                   <div class="thumb-image"> <img src="${item.images[2]}" data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li> 
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 single-top-right">
                        <h3 class="item_name">${item.title}</h3>
                        <p>发货时间: 下单后该商品会在2-3个工作日发货 </p>
                        <div class="single-rating">
                            <ul>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li class="rating">20 条评论</li>
                                <li><a href="#">添加你的评论</a></li>
                            </ul> 
                        </div>
                        <div class="single-price">
                            <ul>
                                <li>￥${item.price / 100 }</li>  
                                <li><del>￥${item.price / 50 }</del></li> 
                                <li><span class="w3off">50% OFF</span></li> 
                                <li>结束日期: 12-12</li>
                                <li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i> 优惠券</a></li>
                            </ul>   
                        </div> 
                        <p class="single-price-text">${item.sellPoint} </p>
                        <form action="#" method="post">
                            <input type="hidden" name="cmd" value="_cart" />
                            <input type="hidden" name="add" value="1" /> 
                            <input type="hidden" name="w3ls_item" value="${item.barcode}" /> 
                            <input type="hidden" name="amount" value="${item.price / 100 }" /> 
                            <button type="button" class="w3ls-cart" @click="addCard(${item.id})"><i class="fa fa-cart-plus" aria-hidden="true"></i> 加入购物车</button>
                        </form>
                        <button class="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i> 加入到收藏</button>
                    </div>
                   <div class="clearfix"> </div>  
                </div>
                <!-- <div class="single-page-icons social-icons"> 
                    <ul>
                        <li><h4>Share on</h4></li>
                        <li><a href="#" class="fa fa-facebook icon facebook"> </a></li>
                        <li><a href="#" class="fa fa-twitter icon twitter"> </a></li>
                        <li><a href="#" class="fa fa-google-plus icon googleplus"> </a></li>
                        <li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
                        <li><a href="#" class="fa fa-rss icon rss"> </a></li> 
                    </ul>
                </div> -->
            </div> 
            <!-- recommendations -->
            <!-- //recommendations --> 
            <!-- collapse-tabs -->
            <div class="collpse tabs">
                <h3 class="w3ls-title">关于此商品</h3> 
                <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i> 标题 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                ${item.title}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fa fa-info-circle fa-icon" aria-hidden="true"></i> 商品介绍 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a> 
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                ${item.sellPoint}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i> 规格与包装 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                ${itemDesc.itemDesc}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <i class="fa fa-question-circle fa-icon" aria-hidden="true"></i> 售后保障 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
				                               本产品全国联保，享受三包服务，质保期为：一年质保</br>
							如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //collapse --> 
            <!-- offers-cards --> 
            <div class="w3single-offers offer-bottom"> 
                <div class="col-md-6 offer-bottom-grids">
                    <div class="offer-bottom-grids-info2">
                        <h4>特别的礼物卡</h4> 
                        <h6>越来越多的品牌,更多的购物方式. <br> 看看这些理想的礼物!</h6>
                    </div>
                </div>
                <div class="col-md-6 offer-bottom-grids">
                    <div class="offer-bottom-grids-info">
                        <h4>Flat $10 折扣</h4> 
                        <h6>最好的购物提供 <br> 在时尚商店</h6>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <!-- //offers-cards -->
        </div>
    </div>
    <!--//products-->  
    <!-- footer-top -->
    <div class="w3agile-ftr-top">
        <div class="container">
            <div class="ftr-toprow">
                <div class="col-md-4 ftr-top-grids">
                    <div class="ftr-top-left">
                        <i class="fa fa-truck" aria-hidden="true"></i>
                    </div> 
                    <div class="ftr-top-right">
                        <h4>免费送货</h4>
                        <p>全球免费 , 飞来飞去 </p>
                    </div> 
                    <div class="clearfix"> </div>
                </div> 
                <div class="col-md-4 ftr-top-grids">
                    <div class="ftr-top-left">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div> 
                    <div class="ftr-top-right">
                        <h4>客户关怀</h4>
                        <p>客户至上, 客户万岁</p>
                    </div> 
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-4 ftr-top-grids">
                    <div class="ftr-top-left">
                        <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                    </div> 
                    <div class="ftr-top-right">
                        <h4>好的质量</h4>
                        <p>质量第一, 永远第一 </p>
                    </div>
                    <div class="clearfix"> </div>
                </div> 
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //footer-top -->  
    <!-- subscribe -->
    <div class="subscribe"> 
        <div class="container">
            <div class="col-md-6 social-icons w3-agile-icons">
                <h4>保持联络</h4>  
                <ul>
                    <li><a href="#" class="fa fa-facebook icon facebook"> </a></li>
                    <li><a href="#" class="fa fa-twitter icon twitter"> </a></li>
                    <li><a href="#" class="fa fa-google-plus icon googleplus"> </a></li>
                    <li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
                    <li><a href="#" class="fa fa-rss icon rss"> </a></li> 
                </ul> 
                <ul class="apps"> 
                    <li><h4>下载我们的app : </h4> </li>
                    <li><a href="#" class="fa fa-apple"></a></li>
                    <li><a href="#" class="fa fa-windows"></a></li>
                    <li><a href="#" class="fa fa-android"></a></li>
                </ul> 
            </div> 
            <div class="col-md-6 subscribe-right">
                <h4>注册电子邮件，并获得25%关闭！</h4>  
                <form action="#" method="post"> 
                    <input type="text" name="email" placeholder="Enter your Email..." required="">
                    <input type="submit" value="Subscribe">
                </form>
                <div class="clearfix"> </div> 
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <!-- //subscribe --> 
    <!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="footer-info w3-agileits-info">
                <div class="col-md-4 address-left agileinfo">
                    <div class="footer-logo header-logo">
                        <h2><a href="index.html"><span>tab</span></a></h2>
                    </div>
                    <ul>
                        <li><i class="fa fa-map-marker"></i> 北京市,海淀区</li>
                        <li><i class="fa fa-mobile"></i> 18801044566 </li>
                        <li><i class="fa fa-phone"></i> +666 66 6666 </li>
                        <li><i class="fa fa-envelope-o"></i> <a href="javascript:void(0)"> 843014339@qq.com</a></li>
                    </ul> 
                </div>
                <div class="col-md-8 address-right">
                    <div class="col-md-4 footer-grids">
                        <h3>公司</h3>
                        <ul>
                            <li><a href="javascript:void(0)">关于我们</a></li>
                            <li><a href="javascript:void(0)">市场</a></li>  
                            <li><a href="javascript:void(0)">核心价值观</a></li>  
                            <li><a href="javascript:void(0)">隐私权政策</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 footer-grids">
                        <h3>服务</h3>
                        <ul>
                            <li><a href="javascript:void(0)">联系我们</a></li>
                            <li><a href="javascript:void(0)">退换商品</a></li> 
                            <li><a href="javascript:void(0)">常见问题解答</a></li>
                            <li><a href="javascript:void(0)">网站地图</a></li>
                            <li><a href="javascript:void(0)">订单状态</a></li>
                        </ul> 
                    </div>
                    <div class="col-md-4 footer-grids">
                        <h3>支付方式</h3>
                        <ul>
                            <li><i class="fa fa-laptop" aria-hidden="true"></i> 网上银行</li>
                            <li><i class="fa fa-money" aria-hidden="true"></i> 货到付款</li>
                            <li><i class="fa fa-pie-chart" aria-hidden="true"></i>支付宝</li>
                            <li><i class="fa fa-gift" aria-hidden="true"></i> 微信</li>
                            <li><i class="fa fa-credit-card" aria-hidden="true"></i> 信用卡</li>
                        </ul>  
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- //footer -->       
    <div class="copy-right"> 
        <div class="container">
            <p>京ICP备17001595号-1<a href="http://www.miitbeian.gov.cn/"></a></p>
        </div>
    </div> 
    <!-- cart-js -->
    <script src="js/minicart.js"></script>
    <script>
        w3ls.render();

        w3ls.cart.on('w3sb_checkout', function (evt) {
            var items, len, i;

            if (this.subtotal() > 0) {
                items = this.items();

                for (i = 0, len = items.length; i < len; i++) {
                    items[i].set('shipping', 0);
                    items[i].set('shipping2', 0);
                }
            }
        });
    </script>  
    <!-- //cart-js -->   
    <!-- menu js aim -->
    <script src="js/jquery.menu-aim.js"> </script>
    <script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>
<script>
    var item = new Vue({
        el:"body",
        data: {
            searchValue:"",
            username:"",
            isLogin:false
        },
        methods:{
        	addCard:function(id){
        		location.href = "http://qinteng.xin:8090/cart/add/"+id+".html?num=" + 1;
        	},
            search:function(){
                if(item.searchValue.trim()){
                    window.open("http://qinteng.xin:8085/search?q="+item.searchValue);
                }
            },
            //获取cookie
            getCookie:function(cookie_name)
            {
                var allcookies = document.cookie;
                var cookie_pos = allcookies.indexOf(cookie_name);   //索引的长度
              
                // 如果找到了索引，就代表cookie存在，
                // 反之，就说明不存在。
                if (cookie_pos != -1)
                {
                    // 把cookie_pos放在值的开始，只要给值加1即可。
                    cookie_pos += cookie_name.length + 1; //这里容易出问题，所以请大家参考的时候自己好好研究一下
                    var cookie_end = allcookies.indexOf(";", cookie_pos);
              
                    if (cookie_end == -1)
                    {
                        cookie_end = allcookies.length;
                    }
              
                    var value = unescape(allcookies.substring(cookie_pos, cookie_end));         //这里就可以得到你想要的cookie的值了。。。
                }
                return value;
            },
            //删除cookie
            delCookie:function(name) {
              var exp = new Date();
              exp.setTime(exp.getTime() + (-1 * 24 * 60 * 60 * 1000));
              var cval = this.getCookie(name);
              document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
            },
            //判断有没有登录
            checkLogin:function(){
                var _ticket = this.getCookie("TT_TOKEN");
                if(!_ticket){
                    return ;
                }
                $.ajax({
                    url : "http://qinteng.xin:8088/user/token/" + _ticket,
                    dataType : "jsonp",
                    type : "GET",
                    success : function(data){
                        if(data.status == 200){
                        	item.isLogin = true;
                        	item.username = data.data.username;
                            
                        }
                    }
                });
            },
            signout:function(){
                var _ticket = this.getCookie("TT_TOKEN");
                $.ajax({
                    url : "http://qinteng.xin:8088/user/signout/" + _ticket,
                    dataType : "jsonp",
                    type : "GET",
                    success : function(data){
                        if(data.status == 200){
                        	item.isLogin = false;
                        	item.username = "";
                        	item.delCookie("TT_TOKEN")
                        }
                    }
                });
            }
        },
        ready:function(){
            this.checkLogin();
        }
    });
</script>