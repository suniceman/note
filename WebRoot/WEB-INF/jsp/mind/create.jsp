<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>创建思维导图</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/jsmind.css" />
    <style type="text/css">
        li{margin-top:2px; margin-bottom:2px;}
        button{width:140px;}
        select{width:140px;}
        #layout{width:1230px;}
        #jsmind_nav{width:210px;height:600px;border:solid 1px #ccc;overflow:auto;float:left;}
        .file_input{width:100px;}
        button.sub{width:100px;}

        #jsmind_container{
            float:left;
            width:1000px;
            height:600px;
            border:solid 1px #ccc;
            background:#f4f4f4;
        }
    </style>
  </head>
  <body>
<div id="layout">
    <div id="jsmind_nav">
        <div>编辑</div>
        <ol type='A'>
            <li><button onclick="add_node();">添加子节点</button></li>
            <li><button onclick="move_to_first();">移动到最前节点</button></li>
            <li><button onclick="move_to_last();">移动到最后节点</button></li>
            <li><button onclick="remove_node();">删除节点</button></li>
        </ol>
        <div>样式</div>
        <ol type='A'>
            <li><button onclick="change_text_font();">改变字体</button></li>
            <li><button onclick="change_text_color();">改变字体颜色</button></li>
            <li><button onclick="change_background_color();">改变背景颜色</button></li>
        </ol>
        <div>适应</div>
        <ol type='A'>
            <button id="zoom-in-button" style="width:50px" onclick="zoomIn();">放大</button>
            <button id="zoom-out-button" style="width:50px" onclick="zoomOut();">缩小</button>
        </ol>

        <div>操作</div>
        <ol type='A'>
           <li><button class="sub" onclick="save_file();">保存思维导图</button></li>
           <li><input id="file_input" class="file_input" type="file"/></li>
           <li><button class="sub" onclick="open_file();">打开思维导图</button></li>
           <li><button class="sub" onclick="create_mind();">新建思维导图</button></li>
        </ol>
    </div>
    <div id="jsmind_container"></div>
    <div style="display:none">
      <input class="file" type="file" id="image-chooser" accept="image/*"/>
    </div>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsmind.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsmind.draggable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jsmind.screenshot.js"></script>
<script type="text/javascript">
    var _jm = null;
    function open_empty(){
        var options = {
            container:'jsmind_container',
            theme:'greensea',
            editable:true
        }
        _jm = jsMind.show(options);
        // _jm = jsMind.show(options,mind);
    }

    function screen_shot(){
        _jm.screenshot.shootDownload();
    }

    function show_data(){
        var mind_data = _jm.get_data();
        var mind_string = jsMind.util.json.json2string(mind_data);
        prompt_info(mind_string);
    }

    function save_file(){
        var mind_data = _jm.get_data();
        var mind_name = mind_data.data.topic;
        var mind_str = jsMind.util.json.json2string(mind_data);
        jsMind.util.file.save(mind_str,'text/jsmind',mind_name+'.jm');
    }

    function create_mind(){
    	location.href = '${pageContext.request.contextPath}/mind/create.action';
    }
    
    function open_file(){
        var file_input = document.getElementById('file_input');
        var files = file_input.files;
        if(files.length > 0){
            var file_data = files[0];
            jsMind.util.file.read(file_data,function(jsmind_data, jsmind_name){
                var mind = jsMind.util.json.string2json(jsmind_data);
                if(!!mind){
                    _jm.show(mind);
                }else{
                    prompt_info('文件格式不正确， 请重新选择');
                }
            });
        }else{
            prompt_info('请先选择一个文件')
        }
    }

    function show_selected(){
        var selected_node = _jm.get_selected_node();
        if(!!selected_node){
            prompt_info(selected_node.topic);
        }else{
            prompt_info('nothing');
        }
    }

    function get_selected_nodeid(){
        var selected_node = _jm.get_selected_node();
        if(!!selected_node){
            return selected_node.id;
        }else{
            return null;
        }
    }

    function add_node(){
        var selected_node = _jm.get_selected_node(); // as parent of new node
        if(!selected_node){prompt_info('请先选择一个节点.');return;}

        var nodeid = jsMind.util.uuid.newid();
        var topic = '* 子节点'+nodeid.substr(0,5)+' *';
        var node = _jm.add_node(selected_node, nodeid, topic);
    }

    var imageChooser = document.getElementById('image-chooser');

    imageChooser.addEventListener('change', function (event) {
        // Read file here.
        var reader = new FileReader();
        reader.onloadend = (function () {
            var selected_node = _jm.get_selected_node();
            var nodeid = jsMind.util.uuid.newid();
            var topic = undefined;
            var data = {
                "background-image": reader.result,
                "width": "100",
                "height": "100"};
        });

        var file = imageChooser.files[0];
        if (file) {
            reader.readAsDataURL(file);
        };

    }, false);

    function move_to_first(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.move_node(selected_id,'_first_');
    }

    function move_to_last(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.move_node(selected_id,'_last_');
    }

    function move_node(){
        // move a node before another
        _jm.move_node('other','open');
    }

    function remove_node(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.remove_node(selected_id);
    }

    function change_text_font(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.set_node_font_style(selected_id, 28);
    }

    function change_text_color(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.set_node_color(selected_id, null, '#000');
    }

    function change_background_color(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.set_node_color(selected_id, '#eee', null);
    }

    var zoomInButton = document.getElementById("zoom-in-button");
    var zoomOutButton = document.getElementById("zoom-out-button");

    function zoomIn() {
        if (_jm.view.zoomIn()) {
            zoomOutButton.disabled = false;
        } else {
            zoomInButton.disabled = true;
        };
    };

    function zoomOut() {
        if (_jm.view.zoomOut()) {
            zoomInButton.disabled = false;
        } else {
            zoomOutButton.disabled = true;
        };
    };

    function expand(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.expand_node(selected_id);
    }

    function collapse(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.collapse_node(selected_id);
    }

    function toggle(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('请先选择一个节点.');return;}

        _jm.toggle_node(selected_id);
    }

    function expand_all(){
        _jm.expand_all();
    }

    function expand_to_level2(){
        _jm.expand_to_depth(2);
    }

    function expand_to_level3(){
        _jm.expand_to_depth(3);
    }

    function collapse_all(){
        _jm.collapse_all();
    }

    function prompt_info(msg){
        alert(msg);
    }

    open_empty();
</script>
  </body>
</html>

