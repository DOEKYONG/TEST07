function mupdate() {
	if(document.getElementById("custname").value == ""){
		alert("회원이름을 입력해주세요");
		document.getElementById("custname").focus();
		return false;
	}
	if(document.getElementById("phone").value == ""){
		alert("회원전화을 입력해주세요");
		document.getElementById("phone").focus();
		return false;
	}
	if(document.getElementById("address").value == ""){
		alert("회원주소를 입력해주세요");
		document.getElementById("address").focus();
		return false;
	}
	if(document.getElementById("grade").value == ""){
		alert("회원등급을 입력해주세요");
		document.getElementById("grade").focus();
		return false;
	}
	if(document.getElementById("city").value == ""){
		alert("도시코드을 입력해주세요");
		document.getElementById("city").focus();
		return false;
	}
	alert("회원수정 완료");
	document.getElementById("update").submit();
}