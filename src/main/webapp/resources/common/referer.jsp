<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String strReferer = request.getHeader("referer");
if(strReferer == null){
%>
 <script>
  alert("정상적인 접근이 아닙니다");
  document.location.href="/"
 </script>
<%
  return;
 }
%>
