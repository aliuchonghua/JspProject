<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vue+axios实现ajax</title>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/axios.min.js"></script>
</head>
<body>
<div id="app">
    <form method="post" name="form1" action="">
        <ul>
            <li v-for="(value,key) in users">{{key}},{{value}}</li>
        </ul>
        用户名:
        <input name="username" id="username" v-model="username" type="text"/>
        密码:
        <input name="pwd" id="pwd" v-model="pwd" type="password"/>
        <button type="button" id="submitbtn" v-on:click="dojsonpost()">提交</button>
    </form>
</div>
</body>
<script type="text/javascript">
    var vue = new Vue({
        el: '#app',
        data: {
            username: '',
            pwd: '',
            users: {},
            inited: true
        },
        methods: {
            dosubmit: function () {
                var data = {};
                data.username = this.username;
                data.pwd = this.pwd;
                var url = 'doreg.jsp?username=' + data.username + '&pwd=' + data.pwd;
                axios.get(url).then(function (result) {
                    console.log(result);
                    if (vue.inited) {
                        vue.users = result.data.users;
                        vue.inited = false;
                        return;
                    }
                    if (result.data.msg.indexOf("用户名已存在") >= 0) {
                        alert('注册失败');
                    } else {
                        alert('注册成功');
                        vue.users = result.data.users;
                    }
                }).catch(function (err) {
                    console.log(err);
                });
            },
            dopost: function () {
                var url = 'doreg.jsp';
                var paras = new URLSearchParams();
                paras.append("username", this.username);
                paras.append("pwd", this.pwd);
                axios.post(url, paras).then(function (result) {
                    console.log(result);
                    if (vue.inited) {
                        vue.users = result.data.users;
                        vue.inited = false;
                        return;
                    }
                    if (result.data.msg.indexOf("用户名已存在") >= 0) {
                        alert('注册失败');
                    } else {
                        alert('注册成功');
                        vue.users = result.data.users;
                    }
                }).catch(function (err) {
                    console.log(err);
                });
            },
            dojsonpost: function () {
                //初始化一个data
                var data = {};
                data.username = this.username;
                data.pwd = this.pwd;
                // 提交到的文件地址
                var url = 'doreg.jsp';
                //使用json格式提交参数
                axios.post(url, data).then(function (result) {
                    //回调函数
                    console.log(result);
                    if (vue.inited) {
                        vue.inited = false;
                        vue.users = result.data.users;
                        return;
                    }
                    if (result.data.msg.indexOf('用户名已存在') >= 0) {
                        alert('注册失败');
                    } else {
                        alert('注册成功');
                        vue.inited = false;
                        vue.users = result.data.users;
                    }
                }).catch(function (err) {
                    //发生错误时调用
                    console.log(err);
                });
            }
        },
        mounted: function () {
            this.dosubmit();
        }
    });
</script>
</html>
