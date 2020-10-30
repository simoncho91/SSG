<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/sitims/INCLUDE/cm_server_common.jsp" %>
<%@ include file="/WEB-INF/jsp/sitims/INCLUDE/cm_poBody_start.jsp" %>
<script type='text/javascript'>

var layoutMain,grdMain,frmSearch,chkRowId;
$(function(){
	layoutMain = new dhx.Layout('layoutObj',{
	     css: "dhx_layout-cell--bordered",
			rows:[
				 {id:'form'},
				 {id:'toolbar'}
			]		
	});
	
	var frmRegPopCell = layoutMain.getCell('form');
	
	frmRegPop = new dhx.Form(null,{
		rows:[
			{type:'input',id:'i_sRegEnName',name:'i_sRegEnName',label:'영문명' ,labelPosition: "left", labelWidth: "110", width: "500", placeholder:"영문명을 입력해주세요" }
			,{type:'input',id:'i_sRegKoName',name:'i_sRegKoName',label:'한글명' ,labelPosition: "left", labelWidth: "110", width: "500", placeholder:"한글명을 입력해주세요" }
			,{type:'input',id:'i_sRegCnName',name:'i_sRegCnName',label:'중문명' ,labelPosition: "left", labelWidth: "110", width: "500", placeholder:"중문명을 입력해주세요" }
			,{type:'input',id:'i_sRegJpName',name:'i_sRegJpName',label:'일문명' ,labelPosition: "left", labelWidth: "110", width: "500", placeholder:"일문명을 입력해주세요" }
// 			,{cols:[
// 	        	{type: "button",id:'btnReg', value: "ë±ë¡",size: "medium",view: "flat",color: "primary"}
// 		       ,{type: "button",id:'btnClose', value: "ë«ê¸°",size: "medium",view: "flat",color: "primary"}   
// 			]}
		]
	});
	frmRegPopCell.attach(frmRegPop);
	
	frmRegPop.events.on("ButtonClick", function(id,e){	
		var data = frmRegPop.getValue();
		if(id=='btnReg'){
			fn_save(data);
		}else if(id=='btnClose'){
        	fn_popClose();
		}
	});

 	var gridMainToolbar = new dhx.Toolbar(null,{
		data:[
			{type:"spacer"},
		 	{type:"button",value:"등록",id:'btnAdd'},
		 	{type:"button",value:"닫기",id:'btnClose'}
 		]
 	});
 	layoutMain.getCell('toolbar').attach(gridMainToolbar);
    
    gridMainToolbar.events.on("Click", function(id){
    	if(id=='btnAdd'){
    		alert("add");
    	} else if(id== 'btnClose'){
    		fn_close();
    	}
    });
});

function fn_save(data){
	alert("save");
	
// 	var dataKeys = Object.keys(data);
// 	for(var i=0;i<dataKeys.length;i++){
// 		var key = dataKeys[i];
// 		if(key.indexOf('sFlag') > -1){
// 			data[key]=data[key]?'Y':'N';
// 		}		
// 	}
// 	if(fn_isNull(data.i_sTitle)){
// 		alert("Titleì ìë ¥í´ ì£¼ì¸ì.");
// 		return;
// 	}
// 	if(fn_isNull(data.i_iSeqNo)){
// 		alert("ì¡°íììë¥¼ ìë ¥í´ ì£¼ì¸ì.");
// 		return;
// 	}
	
// 	console.log(data);
// 	fn_s_ajaxSaveForm({
// 		url      : "/si/cm/020/si_cm_020_pop_save.do"
//         , postParam   : data
//         , success : function(){
//         	//parent.fn_searchMain();
//         	parent.mainPage.initPaging();
//         	//parent.dhxWindow.hide();
//         	fn_popClose();
//         	//parent.dhxWins.window("dhxWin").close(); // close a window
// 		}
//      });
};

</script>
<div class="inputData">
	<input type="hidden" name="i_sClasscd" value="${i_sClasscd}"/>
	<input type="hidden" name="i_sUClasscd" value="${!empty reqVo.i_sUClasscd ? reqVo.i_sUClasscd : 'S000001'}"/>
	<input type="hidden" name="i_sTitle" value="${rvo.v_class_nm }"/>
	<input type="hidden" name="i_iSeqNo" value="${rvo.n_seq_no }" class="onlyNumber"/>
	<input type="hidden" name="i_sFlagUse" value="${rvo.v_use_yn }"/>
    
</div>

<div id="appAreaWrap">
	<div id="appArea">
		<div id="layoutObj"></div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/sitims/INCLUDE/cm_body_end.jsp" %>