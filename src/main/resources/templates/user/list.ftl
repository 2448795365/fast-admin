<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <#include "../resource.ftl"/>
</head>
<body>
<div class="layui-fluid">
<div class="searchTable" style="padding: 20px">
    <form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名:</label>
        <div class="layui-input-inline">
            <input class="layui-input" name="username" autocomplete="off">
        </div>
        <label class="layui-form-label">所属单位:</label>
        <div class="layui-input-inline">
        <input class="layui-input" id="orgname" inputTree="url:'/sys/org/tree',name:'orgid'"
               placeholder="请选择单位" />
    </div>
        <div class="layui-input-inline">
            <button class="layui-btn search-btn" lay-submit lay-filter="reload" data-type="reload"><i class="fa fa-search">&nbsp;</i>搜索</button>
            <button class="layui-btn layui-btn-primary" type="button" data-type="reset"><i class="fa fa-refresh">&nbsp;</i>重置</button>
        </div>
    </div>
    </form>
</div>
<div class="layui-btn-group">
    <!--使用shiro标签进行按钮权限验证-->
    <@shiro.hasPermission name="user:add">
        <button class="layui-btn" data-type="add"><i class="fa fa-plus">&nbsp;</i>增加</button>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="user:update">
        <button class="layui-btn" data-type="edit" style="margin-left: 5px!important;"><i class="fa fa-pencil-square-o">&nbsp;</i>修改</button>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="user:del">
        <button class="layui-btn" data-type="del" style="margin-left: 5px!important;"><i class="fa fa-trash-o">&nbsp;</i>删除</button>
    </@shiro.hasPermission>
    <@shiro.hasPermission name="user:resetPwd">
        <button class="layui-btn" data-type="resetPwd" style="margin-left: 5px!important;"><i class="fa fa-refresh">&nbsp;</i>重置密码</button>
    </@shiro.hasPermission>
</div>

<table id="user-list" lay-filter="user-list"></table>
</div>
<script type="text/html" id="switchTpl">
    <!-- checked状态 -->
    <input type="checkbox" disabled name="statue" value="{{d.statue}}" lay-skin="switch" lay-text="使用中|已注销" lay-filter="statue" {{ d.statue == 1 ? 'checked' : '' }}>
</script>
<script src="/user/user.js"></script>
</body>
</html>