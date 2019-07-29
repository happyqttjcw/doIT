<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="fields" value="${fn:split(job.field,',')}" />
<c:set var="nums" value="${fn:split(job.num,',')}" />
<c:set var="tasks" value="${fn:split(job.task,'@@')}" />
<c:set var="depts" value="${fn:split(job.dept,',')}" />
<c:set var="positions" value="${fn:split(job.position,',')}" />
<c:set var="cdts" value="${fn:split(job.cdt,'@@')}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<script type="text/javascript">
function addrecruit() {
		$('#rtable').clone().appendTo('#rtable-container');
		$('#rtable-container > #rtable:last-child').attr("id","rtable-add");
		$('#rtable-add:last-child input').val('');
		$('#rtable-add:last-child textarea').val('');
		$('<br>').appendTo("#rtable-container")
}
function delrecruit(b) {
	var cnt = $('#rtable-container').children('table').length;
	if(cnt == 1){
		alert('�ּ� �� �� �̻��� �����䰭�� �Է��ϼ���.');
	}else{
		$(b).closest('table').remove();
	}
}

$(function() {
    //input�� datepicker�� ����
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format ����
        ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
        ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
        ,changeYear: true //�޺��ڽ����� �� ���� ����
        ,changeMonth: true //�޺��ڽ����� �� ���� ����                
        ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
        ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
        ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
        ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
        ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
        ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
        ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
        ,minDate: "0" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
        ,maxDate: "+2M" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
    });                    
    
    //�ʱⰪ�� ���� ��¥�� ����
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)     
    
    $("#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format ����
        ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
        ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
        ,changeYear: true //�޺��ڽ����� �� ���� ����
        ,changeMonth: true //�޺��ڽ����� �� ���� ����                
        ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
        ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
        ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
        ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
        ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
        ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
        ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
        ,minDate: "0" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
        ,maxDate: "+2M" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
    });                    
    
    //�ʱⰪ�� ���� ��¥�� ����
    $('#datepicker2').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)            
});
</script>
</head>
<body>
<div class="w3-container w3-center" style="min-width: 1000px;"><br>
<h3 style="color:grey;">���� �����ϱ�</h3>
<h1>� ���縦 ���� ��ȹ�̼���?(���İ���)</h1>
<br>
<form:form modelAttribute="job" method="post" action="updatejob.shop?comid=${sessionScope.logincom.comid}" >
	<form:hidden path="comno" value="${sessionScope.logincom.comno }"/>
</form:form>
</div>
</body>
</html>