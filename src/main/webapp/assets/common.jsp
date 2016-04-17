<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- basic styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
<link href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

<!-- basic scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>	
<script src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>	
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>


<input type="hidden" id="rootpath" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="printBody" value=""/>


<!-- inline scripts related to this page -->
<script type="text/javascript">
var rootpath = $("#rootpath").val();

function getRows(datagrid) {
    // 载入内容
    var rows = datagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行
    return JSON.stringify(rows);
}

function getColunmFields(datagrid){
	var columns;
	if($("#columns").val()){
		columns = $("#columns").val(); // 这段代码是获取当前页的所有行
		return columns;
    }else{
	  	columns = datagrid.datagrid("options").columns;  
	  	return JSON.stringify(columns);
    }
	
}

function Export(strXlsName, exportGrid) {
	var action = rootpath+"/export";
    var f = $('<form action="'+action+'" method="post" id="fm1"></form>');
    var i = $('<input type="hidden" id="txtContent" name="rows" />');
    var l = $('<input type="hidden" id="txtName" name="txtName" />');
    var m = $('<input type="hidden" id="columns" name="columns" />');
    i.val(getRows(exportGrid));
    i.appendTo(f);
    l.val(strXlsName);
    l.appendTo(f);
    m.val(getColunmFields(exportGrid));
    m.appendTo(f);
    f.appendTo(document.body).submit();
}

function CreateFormPage(strPrintName, printDatagrid) {
    var tableString = '<table cellspacing="0" class="pb">';
    var frozenColumns = printDatagrid.datagrid("options").frozenColumns;  // 得到frozenColumns对象
    var columns = printDatagrid.datagrid("options").columns;    // 得到columns对象
    var nameList = '';

    // 载入title
    if (typeof columns != 'undefined' && columns != '') {
        $(columns).each(function (index) {
            tableString += '\n<tr>';
            if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                for (var i = 0; i < frozenColumns[index].length; ++i) {
                    if (!frozenColumns[index][i].hidden) {
                        tableString += '\n<th width="' + frozenColumns[index][i].width + '"';
                        if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                            tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                        }
                        if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                            tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                        }
                        if (typeof frozenColumns[index][i].field != 'undefined' && frozenColumns[index][i].field != '') {
                            nameList += ',{"f":"' + frozenColumns[index][i].field + '", "a":"' + frozenColumns[index][i].align + '"}';
                        }
                        tableString += '>' + frozenColumns[0][i].title + '</th>';
                    }
                }
            }
            for (var i = 0; i < columns[index].length; ++i) {
                if (!columns[index][i].hidden && columns[index][i].title) {
                    tableString += '\n<th width="' + columns[index][i].width + '"';
                    if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                        tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                    }
                    if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                        tableString += ' colspan="' + columns[index][i].colspan + '"';
                    }
                    if (typeof columns[index][i].field != 'undefined' && columns[index][i].field != '') {
                        nameList += ',{"f":"' + columns[index][i].field + '", "a":"' + columns[index][i].align + '"}';
                    }
                    tableString += '>' + columns[index][i].title + '</th>';
                }
            }
            tableString += '\n</tr>';
        });
    }
    // 载入内容
    var rows = printDatagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行
    var nl = eval('([' + nameList.substring(1) + '])');
    for (var i = 0; i < rows.length; ++i) {
        tableString += '\n<tr>';
        $(nl).each(function (j) {
            var e = nl[j].f.lastIndexOf('_0');

            tableString += '\n<td';
            if (nl[j].a != 'undefined' && nl[j].a != '') {
                tableString += ' style="text-align:' + nl[j].a + ';"';
            }
            tableString += '>';
            if (e + 2 == nl[j].f.length) {
                tableString += rows[i][nl[j].f.substring(0, e)];
            }
            else{
            	if(undefined != rows[i][nl[j].f]){
            		 tableString += rows[i][nl[j].f];
            	}else{
            		tableString+="";
            	}
            }
            tableString += '</td>';
        });
        tableString += '\n</tr>';
    }
    tableString += '\n</table>';
	$("#printBody").val(tableString);
    window.open(rootpath+"/print.jsp", "打印窗口", "width=" + 800 + ", height=" + 600 + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
}
</script>
