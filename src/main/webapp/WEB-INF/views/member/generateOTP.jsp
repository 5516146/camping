<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form class = "content" action="pw_auth.me" method="post">
	<div class="textbox">
  		<input id="text" name=name required="" type="text" />
  		<label for="text">�̸�</label>
   		<div class="error">�̸��� �Է��ϼ���  </div>
 	</div>
	<div class="textbox">
  		<input id="email" name=email required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" />
  		<label for="email">�̸���</label>
  	<div class="error">��ȿ���� ���� �̸����ּ� �Դϴ�  </div>
	</div><br><br>
   	<input type="submit" id="check" value="��й�ȣã��">
</form>
</body>
</html>