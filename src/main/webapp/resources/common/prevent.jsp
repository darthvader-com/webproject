<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<script type = "text/javascript" >
    $(document).ready(function() {
        $(document).bind('keydown', function(e) {
            if (e.keyCode == 123) {
                e.preventDefault();
                e.returnValue = false;
            }
        });
    });
document.onmousedown = disableclick;
status = "마우스 우클릭은 사용하실 수 없습니다."
function disableclick(event) {
    if (event.button == 2) {
        alert(status);
        return false;
    }
}
</script>