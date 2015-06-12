<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String basePath = request.getContextPath(); %>
<c:set var="ctx" value="<%=basePath%>"></c:set>
<c:set var="script" value="${ctx}/script"></c:set>
<c:set var="style" value="${ctx}/css"></c:set>
<c:set var="plugin" value="${ctx}/plugin"></c:set>
<c:set var="themes" value="${ctx}/themes"></c:set>
<c:set var="img" value="${ctx}/img"></c:set>
<c:set var="images" value="${ctx}/images"></c:set>
