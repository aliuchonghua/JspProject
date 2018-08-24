<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>vue+ajax排行榜</title>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/axios.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">

</head>
<body>
<div class="container" id="app">
    <div class="row">
        <div class="col-md-12">
            <h3>排行榜</h3>
            <table class="table table-hover">
                <tr>
                    <th>姓名</th>
                    <th>学号</th>
                    <th>删除</th>
                    <th>修改</th>
                </tr>
                <tr v-for="(value,key) in users">
                    <td>{{value}}</td>
                    <td>{{key}}</td>
                    <td v-on:click="remove(value,key)" style='cursor:pointer'>删除</td>
                    <td v-on:click="amend(value,key)" style='cursor:pointer'>修改</td>
                </tr>
            </table>
            <form action="" method="post" class="form-inline" name="form1">
                <div class="form-group">
                    <label>学号:</label>
                    <input type="text" id="number" value="" v-model="number" class="form-control" name="number"
                           placeholder="请输入学号" onkeyup="this.value=this.value.replace(/\D/g, '')"/>
                </div>
                <div class="form-group">
                    <label>姓名:</label>
                    <input type="text" id="name" name="name" v-model="name" value="" class="form-control"
                           placeholder="请输入姓名"/>
                </div>

                <button type="button" class="btn btn-default" v-on:click="add">添加</button>
            </form>
            <span id="helpBlock" class="help-block">{{span1}}</span>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var vue = new Vue({
        //声明作用域
        el: '#app',
        //声明变量
        data: {
            name: '',
            number: '',
            users: {},
            span1: "",
        },
        //方法
        methods: {
            //添加
            add: function () {
                // 创建新的data对象
                var data = {};
                data.name = this.name;
                data.number = this.number;
                //提交地址
                var url = 'renkings-add.jsp';
                //重新置空
                this.name = "";
                this.number = "";
                //上传
                axios.post(url, data).then(function (result) { //回调函数
                    //获取回调的users集合
                    vue.users = result.data.users;
                    //获取消息
                    if (result.data.msg.indexOf('姓名或学号不能为空') >= 0) {
                        vue.span1 = "姓名或学号不能为空";
                    } else if (result.data.msg.indexOf('学号重复无法添加') >= 0) {
                        vue.span1 = "学号重复无法添加";
                    }else {
                        vue.span1 = "";
                    }
                }).catch(function (err) {
                    //错误信息
                    console.log(err);
                });
            },
            //删除
            remove: function (value,key) {//elm是原生DOM事件
                var data = {};
                //target获取触发方法的元素
                //获取当前行的学号
                data.number =key;
                //上传地址
                var url = 'renkings-remove.jsp';
                axios.post(url, data).then(function (result) {
                    //获取回调的users集合
                    vue.users = result.data.users;
                }).catch(function (err) {
                    //错误信息
                    console.log(err);
                })
            },
            //修改
            amend: function (value,key) {
                var data = {};
                //target获取触发方法的元素
                //获取当前行的姓名
                data.name = value;
                //获取当前行的学号
                data.number = key;
                //上传地址
                var url = 'renkings-remove.jsp';
                //将输入框内容设置为需要修改的对象
                this.name = value;
                this.number = key;
                //上传
                axios.post(url, data).then(function (result) {
                    //获取回调的users集合
                    vue.users = result.data.users;
                }).catch(function (err) {
                    //错误信息
                    console.log(err);
                })
            },
        },
        //页面第一次加载完成后执行一次添加以初始化集合
        mounted: function () {
            this.add();
        }
    });
</script>
</html>
