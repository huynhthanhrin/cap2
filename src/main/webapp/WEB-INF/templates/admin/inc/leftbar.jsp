<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="../../tags/taglibs.jsp" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">

                <a class="nav-link" href="/admin/index">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    DASHBOARD
                </a>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                   data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Management
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                     data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <c:if test="${userLogin.role.roleCode == 'STORE_MANAGER'}">
                            <a class="nav-link" href="<%= request.getContextPath()%>/admin/category">Category</a>
                            <a class="nav-link" href="<%= request.getContextPath()%>/admin/product/index">Product</a>
                            <a class="nav-link" href="<%= request.getContextPath()%>/admin/combo/index">Combo</a>
                        </c:if>
                        <c:if test="${userLogin.role.roleCode == 'WARD_MANAGER' || userLogin.role.roleCode == 'STORE_MANAGER'}">
                            <a class="nav-link" href="<%= request.getContextPath()%>/admin/order/index">Order</a>
                        </c:if>
                    </nav>
                </div>
               <c:if test="${userLogin.role.roleCode == 'ADMIN'}">
                   <a class="nav-link" href="${pagecontext.request.contextPath }/admin/store/index">
                       <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                       Store management
                   </a>

               </c:if>
                <c:if test="${userLogin.role.roleCode == 'ADMIN'}">
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                   data-bs-target="#userCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    User
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="userCollapseLayouts" aria-labelledby="headingOne"
                     data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <c:forEach items="${roles}" var="role">
                            <c:if test="${role.roleCode != 'ADMIN'}">
                                <a class="nav-link" href="/admin/user/index/${role.roleId}">${role.roleName}</a>
                            </c:if>
                        </c:forEach>

                    </nav>
                </div>
                </c:if>
            </div>
        </div>

    </nav>
</div>