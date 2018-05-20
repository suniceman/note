<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/inputEffect.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tooltips.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spop.min.css" />

<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/snow.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pure.tooltips.js"></script>
<script src="${pageContext.request.contextPath}/js/spop.min.js"></script>
<script>
    (function() {
        // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
        if (!String.prototype.trim) {
            (function() {
                // Make sure we trim BOM and NBSP
                var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                String.prototype.trim = function() {
                    return this.replace(rtrim, '');
                };
            })();
        }

        [].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
            // in case the input is already filled..
            if( inputEl.value.trim() !== '' ) {
                classie.add( inputEl.parentNode, 'input--filled' );
            }

            // events:
            inputEl.addEventListener( 'focus', onInputFocus );
            inputEl.addEventListener( 'blur', onInputBlur );
        } );

        function onInputFocus( ev ) {
            classie.add( ev.target.parentNode, 'input--filled' );
        }

        function onInputBlur( ev ) {
            if( ev.target.value.trim() === '' ) {
                classie.remove( ev.target.parentNode, 'input--filled' );
            }
        }
    })();
    
    $(function() {  
        $('#login #login-password').focus(function() {
            $('.login-owl').addClass('password');
        }).blur(function() {
            $('.login-owl').removeClass('password');
        });
        $('#login #register-password').focus(function() {
            $('.register-owl').addClass('password');
        }).blur(function() {
            $('.register-owl').removeClass('password');
        });
        $('#login #register-repassword').focus(function() {
            $('.register-owl').addClass('password');
        }).blur(function() {
            $('.register-owl').removeClass('password');
        });
        $('#login #forget-password').focus(function() {
            $('.forget-owl').addClass('password');
        }).blur(function() {
            $('.forget-owl').removeClass('password');
        });
    });
    
    function goto_register(){
        $("#register-username").val("");
        $("#register-password").val("");
        $("#register-repassword").val("");
        $("#register-email").val("");
        $("#tab-2").prop("checked",true);
    }
    
    function goto_login(){
        $("#login-username").val("");
        $("#login-password").val("");
        $("#tab-1").prop("checked",true);
    }
    function login(){//登录
        var username = $("#login-username").val(),
            password = $("#login-password").val(),
            flag = false;
        //判断用户名密码是否为空
        if(username == ""){
            $.pt({
                target: $("#login-username"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"用户名不能为空"
            });
            flag = true;
        }
        if(password == ""){
            $.pt({
                target: $("#login-password"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"密码不能为空"
            });
            flag = true;
        }
        //用户名只能是15位以下的字母或数字
        var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
        if(!regExp.test(username)){
            $.pt({
                target: $("#login-username"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"用户名必须为15位以下的字母或数字"
            });
            flag = true;
        }
        
        if(flag){
            return false;
        }else{//登录
            $.ajax({
                headers: { 
                    'Accept': 'application/json',
                    'Content-Type': 'application/json' 
                },
                type : "POST",
                url : "${pageContext.request.contextPath}/user/dologin.action",
                data : JSON.stringify({
                    name: username,
                    password: password
                }),
                dataType : 'json',
                success : function(resData) {
                    if (resData.status === 'ok') {
                    	location.href = "${pageContext.request.contextPath}/main/main.action";
                    } else {
                        spop({          
                            template: '<h4 class="spop-title">用户名或密码错误</h4>',
                            position: 'top-center',
                            style: 'error',
                            autoclose: 3000
                        });
                        return false;
                    }
                }
            });
            return false;
        }
    }
    
    //注册
    function register(){
        var username = $("#register-username").val(),
            password = $("#register-password").val(),
            repassword = $("#register-repassword").val(),
            email = $("#register-email").val(),
            flag = false
        //判断用户名密码是否为空
        if(username == ""){
            $.pt({
                target: $("#register-username"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"用户名不能为空"
            });
            flag = true;
        }
        if(password == ""){
            $.pt({
                target: $("#register-password"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"密码不能为空"
            });
            flag = true;
        }else{
            if(password != repassword){
                $.pt({
                    target: $("#register-repassword"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content:"两次输入的密码不一致"
                });
                flag = true;
            }
        }
        //检查邮箱格式
        var emailReg = new RegExp("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$");
        if(!emailReg.test(email)){
            $.pt({
                target: $("#register-email"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"邮箱格式不正确， 请重新输入"
            });
            flag = true;
        }
        //用户名只能是15位以下的字母或数字
        var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
        if(!regExp.test(username)){
            $.pt({
                target: $("#register-username"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"用户名必须为15位以下的字母或数字"
            });
            flag = true;
        }
        
        //检查用户名是否已经存在
        //调后台代码检查用户名是否已经被注册
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/user/checkName.action",
            data : "name=" + username,
            dataType : "text",
            success : function(resData) {
                if (resData !== 'success') {
                	flag = true;
                    $.pt({
                        target: $("#register-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content:"用户名已经存在"
                    });
                }
                if(flag){
                    return false;
                }else{//注册
                    $.ajax({
                        headers: { 
                            'Accept': 'application/json',
                            'Content-Type': 'application/json' 
                        },
                        type : "POST",
                        url : "${pageContext.request.contextPath}/user/register.action",
                        data : JSON.stringify({
                            name: username,
                            password: password,
                            email: email
                        }),
                        dataType : 'json',
                        success : function(resData) {
                            if (resData.status === 'ok') {
                                spop({          
                                    template: '<h4 class="spop-title">注册成功</h4>即将于3秒后返回登录',
                                    position: 'top-center',
                                    style: 'success',
                                    autoclose: 3000,
                                    onOpen : function(){
                                        var second = 2;
                                        var showPop = setInterval(function(){
                                            if(second == 0){
                                                clearInterval(showPop);
                                            }
                                            $('.spop-body').html('<h4 class="spop-title">注册成功</h4>即将于'+second+'秒后返回登录');
                                            second--;
                                        },1000);
                                    },
                                    onClose : function(){
                                        goto_login();
                                    }
                                });
                                return false;
                            }
                        }
                    });
                }
            }
        });
    }
</script>
<style type="text/css">
html{width: 100%; height: 100%;}

body{

    background-repeat: no-repeat;

    background-position: center center #2D0F0F;

    background-color: #00BDDC;

    background-image: url(${pageContext.request.contextPath}/images/snow.jpg);

    background-size: 100% 100%;

}

.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>
</head>
<body>
    <!-- 雪花背景 -->
    <div class="snow-container"></div>
    <!-- 登录控件 -->
    <div id="login">
        <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
        <input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
        <input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
        <div class="wrapper">
            <!-- 登录页面 -->
            <div class="login sign-in-htm">
                <form class="container offset1 loginform">
                    <!-- 猫头鹰控件 -->
                    <div id="owl-login" class="login-owl">
                        <div class="hand"></div>
                        <div class="hand hand-r"></div>
                        <div class="arms">
                            <div class="arm"></div>
                            <div class="arm arm-r"></div>
                        </div>
                    </div>
                    <div class="pad input-container">
                        <section class="content">
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="text" id="login-username" 
                                    autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />
                                <label class="input__label input__label--hideo" for="login-username">
                                    <i class="fa fa-fw fa-user icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="password" id="login-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
                                <label class="input__label input__label--hideo" for="login-password">
                                    <i class="fa fa-fw fa-lock icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                        </section>
                    </div>
                    <div class="form-actions">
                        <a tabindex="5" class="btn btn-link text-muted" onclick="goto_register()">注册</a>
                        <input class="btn btn-primary" type="button" tabindex="3" onclick="login()" value="登录" 
                            style="color:white;"/>
                    </div>
                </form>
            </div>
            <!-- 注册页面 -->
            <div class="login sign-up-htm">
                <form action="#" method="post" class="container offset1 loginform">
                    <!-- 猫头鹰控件 -->
                    <div id="owl-login" class="register-owl">
                        <div class="hand"></div>
                        <div class="hand hand-r"></div>
                        <div class="arms">
                            <div class="arm"></div>
                            <div class="arm arm-r"></div>
                        </div>
                    </div>
                    <div class="pad input-container">
                        <section class="content">
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="text" id="register-username" 
                                    autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
                                <label class="input__label input__label--hideo" for="register-username">
                                    <i class="fa fa-fw fa-user icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="password" id="register-password" placeholder="请输入密码" maxlength="15"/>
                                <label class="input__label input__label--hideo" for="register-password">
                                    <i class="fa fa-fw fa-lock icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="password" id="register-repassword" placeholder="请确认密码" maxlength="15"/>
                                <label class="input__label input__label--hideo" for="register-repassword">
                                    <i class="fa fa-fw fa-lock icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                            <span class="input input--hideo">
                                <input class="input__field input__field--hideo" type="email" id="register-email" autocomplete="off" placeholder="请输入邮箱"/>
                                <label class="input__label input__label--hideo" for="register-email">
                                    <i class="fa fa-fw fa-envelope-o icon icon--hideo"></i>
                                    <span class="input__label-content input__label-content--hideo"></span>
                                </label>
                            </span>
                        </section>
                    </div>
                    <div class="form-actions">
                        <a class="btn pull-left btn-link text-muted" onclick="goto_login()">返回登录</a>
                        <input class="btn btn-primary" type="button" onclick="register()" value="注册" 
                            style="color:white;"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>