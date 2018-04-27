<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>项目－NetCTOSS_V1.0</title>
        <!--修改路径../styles/global.css和../styles/global_color.css 去掉'../'  -->
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />
        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc")
                    btnObj.className = "sort_asc";
                else
                    btnObj.className = "sort_desc";
            }

            //启用
            function startFee() {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //删除
            function deleteFee() {
                var r = window.confirm("确定要删除此资费吗？");
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
			<c:import url="../logo.jsp"></c:import>
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
			<c:import url="../menu.jsp"></c:import>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="">
                <!--排序-->
                <div class="search_add">
                    <div>
                        <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="基费" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="时长" class="sort_asc" onclick="sort(this);" />-->
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddCost.do';" />
                </div>
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                  <!--修改路径../images/close.png 去掉'../'  -->
                    <img src="images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>
                <!--数据区域：用表格展示数据-->
                <div id="data">
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>
                       <c:forEach items="${costs }" var="c">
                       <tr>
                            <td>${c.costId }</td>
                            <td><a href="toCostDetail.do?id=${c.costId }">${c.name }</a></td>
                            <td>${c.baseDuration }</td>
                            <td>${c.baseCost }</td>
                            <td>${c.unitCost }</td>
                         <%-- 2018-04-13 15:48:13.0 修改时间格式
                         	<td>${c.createTime }</td>
                            <td>${c.startTime }</td>
                          --%>
                            <td>
                            	<fmt:formatDate value="${c.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            	<%--
                            	<fmt:setLocale value="zh_cn"/>
                            	<fmt:formatDate value="${c.createTime }" type="both" dateStyle="default"/>
                            	--%>
                           	</td>
                            <td>
                                <fmt:formatDate value="${c.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <%--
                                <fmt:setLocale value="zh_cn"/>
                            	<fmt:formatDate value="${c.startTime }" type="both" dateStyle="default"/>
                            	--%>
                            </td>
                            <td>
                            	<c:if test="${c.status==0 }">开通</c:if>
                            	<c:if test="${c.status==1 }">暂停</c:if>
                            </td>
                            <td>
                                <input type="button" value="启用" class="btn_start" onclick="location.href='useCost.do?id=${c.costId}'" />
                                <!--可以通过JS获取获取到id，也可以通过EL表达式获取 location.href='toUpdateCost.do?id='+${c.costId}; 或者location.href='toUpdateCost.do?id=${c.costId}';-->
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateCost.do?id=${c.costId }';" />
                                <input type="button" value="删除" class="btn_delete" onclick="location.href='deleteCost.do?id=${c.costId }';" />
                            </td>
                        </tr>
                         </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                	<!--当前是第一页，则不能点上一页  -->
                	<c:if test="${page==1 }">
        	        	<a href="">上一页</a>
        	        </c:if>
        	        <c:if test="${page!=1 }">
        	        	<a href="findCost.do?page=${page-1 }">上一页</a>
        	        </c:if>
        	        <!--begin:循环起始位置；end：循环终止位置；-->
        	        <c:forEach  var="i" begin="1" end="${totalPage }">
        	        	<!--若循环到了当前页，则将页码高亮显示  -->
        	        	<c:if test="${i==page }">
        	        		<a href="findCost.do?page=${i }" class="current_page">${i }</a>
        	        	</c:if>
        	        	<!--若不是当前页，则去掉高亮的样式 -->
        	        	<c:if test="${i!=page }">
        	        		<a href="findCost.do?page=${i }">${i }</a>
        	        	</c:if>
        	        </c:forEach>
					<!--当前页是最后一页，则不能点下一页-->
					<c:if test="${page==totalPage }">
						<a href="">下一页</a>
					</c:if>
					<c:if test="${page !=totalPage }">
						<a href="findCost.do?page=${page+1 }">下一页</a>
					</c:if>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>版权所有(C)中国电信集团公司 </p>
        </div>
    </body>
</html>
