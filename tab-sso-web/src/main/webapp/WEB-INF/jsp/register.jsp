<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<html lang="en">
<head>
<title>TAB-个人注册</title>
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
                    <form action="#" method="post">
                        <input type="search" name="Search" placeholder="solr.solr.solr." required="" @keyup.enter="search">
                        <button type="button" target="_blank" class="btn btn-default" aria-label="Left Align" @click="search">
                            <i class="fa fa-search" aria-hidden="true"> </i>
                        </button>
                    </form>
                </div>
                <div class="clearfix"> </div>
            </div>      
        </div><!-- //header-two -->
    <!-- //header -->   
    <!-- login-page -->
    <div class="login-page">
        <div class="container"> 
            <h3 class="w3ls-title w3ls-title1">Create your account</h3>  
            <div class="login-body">
                 <input type="text" class="{{usernameerror ? 'user' : ''}}" id="username" placeholder={{usernameplaceholder}} v-model="username" @blur="inputblur(1)">
                 <input type="text" class="{{phoneerror ? 'user' : ''}}" id="phone" placeholder={{phonenumplaceholder}} v-model="phonenum" @blur="inputblur(2)">
                 <input type="text" class="{{emailerror ? 'user' : ''}}" id="email" placeholder={{emailplaceholder}} v-model="email" @blur="inputblur(3)">
                 <input type="password" autocomplete="off" id="password" class="{{passworderror ? 'user' : 'lock'}}" placeholder={{passwordplaceholder}} v-model="password" @blur="inputblur(4)">
                 <input type="password" autocomplete="off" id="password1" class="{{password1error ? 'user' : 'lock'}}" placeholder={{password1placeholder}} v-model="password1" @blur="inputblur(5)">
                 <input type="submit" value="注  册" @click="register">
            </div>  
            <h6>已有账号? <a href="javascript:void(0);" @click="login">立即登录 »</a> </h6>  
        </div>
    </div>
</body>
</html>
<script>
    var register = new Vue({
        el:"body",
        data: {
            searchValue:"",
            usernameplaceholder: "用户名",
            usernameerror:false,
            username: "",
            phonenumplaceholder: "手机号",
            phoneerror:false,
            phonenum: "",
            emailplaceholder: "邮箱",
            emailerror:false,
            email: "",
            passwordplaceholder: "密码",
            passworderror:false,
            password: "",
            password1placeholder: "确认密码",
            password1error:false,
            password1:""
        },
        methods:{
            search:function(){
                if(register.searchValue.trim()){
                    window.open("http://qinteng.xin:8085/search?q="+register.searchValue);
                }
            },
            inputblur:function(index){
            	if(index==1){
            		this.usernameerror = false;
            	}else if(index==2){
            		this.phoneerror = false;
            	}else if(index==3){
                    this.emailerror = false;
                }else if(index==4){
                    this.passworderror = false;
                }else if(index==5){
                    this.password1error = false;
                }
            },
            register:function(){
            	var usernamere = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
            	if(!usernamere.test(this.username)){
            		$("#username").focus();
            		this.username = "";
                    this.usernameplaceholder ="用户名5-16位,可以由字母数字下划线组成,必须以字母开头";
                    this.usernameerror = true;
                    return false;
            	}
            	var phonenumre = /^1(3|4|5|7|8)\d{9}$/;
            	if(!phonenumre.test(this.phonenum)){
            		$("#phone").focus();
                    this.phonenum = "";
                    this.phonenumplaceholder ="请输入合法的手机号";
                    this.phoneerror = true;
                    return false;
            	}
            	var emailre = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            	if(!emailre.test(this.email)){
            		$("#email").focus();
                    this.email = "";
                    this.emailplaceholder ="请输入合法的邮箱";
                    this.emailerror = true;
                    return false;
            	}
            	var passwordre = /^[0-9_a-zA-Z]{6,20}$/;
            	if(!passwordre.test(this.password)){
            		$("#password").focus();
                    this.password = "";
                    this.passwordplaceholder ="密码6-20,可以由字母数字下划线组成";
                    this.passworderror = true;
                    return false;
            	}
            	if(this.password != this.password1){
            		$("#password1").focus();
                    this.password1 = "";
                    this.password1placeholder ="两次密码不一致";
                    this.password1error = true;
                    return false;
            	}
            	this.beforeSubmit();
            },
            beforeSubmit:function(){
            	$.ajax({   
                    url: "http://qinteng.xin:8088/user/check/"+escape(register.username)+"/1?r=" + Math.random(),
                    success: function(data){
                    	if(data.data){
                    		$.ajax({   
                                url: "http://qinteng.xin:8088/user/check/"+register.phonenum+"/2?r=" + Math.random(),
                                success: function(data){
                                    if (data.data) {
                                    	$.ajax({   
                                            url: "http://qinteng.xin:8088/user/check/"+register.email+"/3?r=" + Math.random(),
                                            success: function(data){
                                                if (data.data) {
                                                    register.registerSubmit();
                                                } else {
                                                	$("#email").focus();
                                                	register.email = "";
                                                    register.emailplaceholder ="此邮箱已被注册";
                                                    register.emailerror = true;
                                                }
                                            }
                                        });
                                    } else {
                                        $("#phone").focus();
                                        register.phonenum = "";
                                        register.phonenumplaceholder ="此手机号已经被注册";
                                        register.phoneerror = true;
                                    }
                                }
                            });
                    	}else{
                    		$("#username").focus();
                    		register.username = "";
                    		register.usernameplaceholder ="此用户名已经被占用，请选择其他用户名";
                    		register.usernameerror = true;
                    	}
                    }
                });
            },
            registerSubmit:function(){
            	var param={
                    username: register.username,
                    password: register.password,
                    phone: (register.phonenum).toString(),
                    email: register.email
                }
                $.ajax({   
                    url: "http://qinteng.xin:8088/user/register",
                    data: param,
                    type: "post",
                    dataType: "json",
                    success: function(data){
                    	if(data.status == 200){
                            alert('用户注册成功，请登录！');
                            register.login();
                        } else {
                            alert("注册失败！");
                        }
                    }
                });
            },
            login:function() {
                location.href = "/page/login";
                return false;
            },
        },
        ready:function(){
           
        }
    });
</script>