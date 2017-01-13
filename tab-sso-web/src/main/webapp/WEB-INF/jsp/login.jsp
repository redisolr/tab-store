<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<title>TAB-欢迎登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="shortcut icon" type="image/x-icon" href="/images/fav-icon.png" />
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="/css/font-awesome.css" rel="stylesheet"> 
<style type="text/css">
    .header-search-child {
        position: relative;
    }
    .user {
        border:1px solid #f44336 !important;
    }
</style>
<!-- js -->
<script src="/js/jquery-2.2.3.min.js"></script> 
<script src="/js/jquery-scrolltofixed-min.js" type="text/javascript"></script><!-- fixed nav js -->
<script src="/js/vue.js"></script> 
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
</head>
<body>
    <!-- header -->
    <div class="header">
        <div class="header-two"><!-- header-two -->
            <div class="container">
                <div class="header-logo">
                    <h1><a href="http://qinteng.xin"><span>tab</span></a></h1>
                </div>  
                <div class="header-search">
                    <div class="header-search-child">
                        <input type="search" name="Search" placeholder="solr.solr.solr." required="" v-model="searchValue" @keyup.enter="search">
                        <button type="button" target="_blank" class="btn btn-default" aria-label="Left Align" @click="search">
                            <i class="fa fa-search" aria-hidden="true"> </i>
                        </button>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>      
        </div><!-- //header-two -->
    <!-- //header -->   
    <!-- login-page -->
    <div class="login-page">
        <div class="container"> 
        <h3 class="w3ls-title w3ls-title1">Login to your account</h3>
            <div class="login-body">
                  <input type="text" id="username" class="{{usernamerror ? 'user' : ''}}"  placeholder={{usernamePlaceholder}} v-model="username" @blur="usernameblur">
                  <input type="password" autocomplete="off" id="password" class="{{passworderror ? 'user' : 'lock'}}" name="password" placeholder={{passwordPlaceholder}} v-model="password" @blur="passwordblur">
                  <input type="submit" value="登  录" @click="login($event)">
                  <div class="forgot-grid">
                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>自动登录</label>
                      <div class="forgot">
                          <a href="#">忘记密码</a>
                      </div>
                      <div class="clearfix"> </div>
                  </div>
            </div>  
            <h6> 没有账户? <a href="/page/register">立即注册»</a> </h6> 
            <div class="login-page-bottom social-icons">
                <h5>使用第三方账户</h5>
                <ul>
                    <li><a href="#" class="fa fa-facebook icon facebook"> </a></li>
                    <li><a href="#" class="fa fa-twitter icon twitter"> </a></li>
                    <li><a href="#" class="fa fa-google-plus icon googleplus"> </a></li>
                    <li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
                    <li><a href="#" class="fa fa-rss icon rss"> </a></li> 
                </ul> 
            </div>
        </div>
    </div>
</body>
</html>
<script>
    var redirectUrl = "${redirect}";
    var login = new Vue({
        el:"body",
        data: {
            searchValue:"",
            usernamerror:false,
            usernamePlaceholder:"用户名",
            username: "",
            passworderror:false,
            passwordPlaceholder:"密码",
            password: ""
        },
        methods:{
            search:function(){
                if(login.searchValue.trim()){
                    window.open("http://qinteng.xin:8085/search?q="+login.searchValue);
                }
            },
            usernameblur:function(){
            	login.usernamerror = false;
            },
            passwordblur:function(){
            	login.passworderror = false;
            },
            login:function(e){

            	if(login.username.trim() == ""){
            		$("#username").focus();
            		login.usernamePlaceholder ="请输入用户名";
            		login.usernamerror = true;
            		return false;
            	}
            	if(login.password.trim() == ""){
                    $("#password").focus();
                    login.passwordPlaceholder = "请输入密码";
                    login.passworderror = true;
                    return false;
                }
            	this.loginSubmit();
            },
            loginSubmit:function(){
            	var param={
            		username: login.username,
            		password: login.password
            	}
                $.ajax({   
                    url: "http://qinteng.xin:8088/user/login",
                    data: param,
                    type: "post",
                    dataType: "json",
                    success: function(data){
                    	if (data.status == 200) {
                    		if (redirectUrl == "") {
                    			window.location= "http://qinteng.xin";
                    		}else {
                    			window.location = redirectUrl;
                    		}
                    		
                    	}else if(data.status == 300){
                    		$("#username").focus();
                    		login.username = "";
                    		login.usernamerror = true;
                    		login.usernamePlaceholder = data.msg;
                    	}else if(data.status == 400){
                    		$("#password").focus();
                    		login.password = "";
                    		login.passworderror = true;
                    		login.passwordPlaceholder = data.msg;
                    	}
                    }
                });
            },
        },
        ready:function(){
           
        }
    });
</script>