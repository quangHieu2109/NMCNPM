<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title><fmt:message key="sua_nguoi_dung"/> #${requestScope.user.id}</title>
</head>

<body>
<jsp:include page="_headerAdmin.jsp"/>

<section class="section-content">
  <fmt:setLocale value="vi_VN" />
  <c:if test="${sessionScope.lang!=null&&sessionScope.lang=='en'}">
    <fmt:setLocale value="en_US" />
  </c:if>
  <fmt:setBundle basename="lang" />
  <div class="container">
    <header class="section-heading py-4">
      <h3 class="section-title"><fmt:message key="sua_nguoi_dung"/> #${requestScope.user.id}</h3>
    </header> <!-- section-heading.// -->
    <c:if test="${sessionScope.currentUser.googleUser}">
      <s:set var="disable" value="disabled"/>  </c:if>
    <main class="row mb-5">
      <form class="col-lg-6" method="POST" action="${pageContext.request.contextPath}/admin/userManager/update">
        <c:if test="${not empty requestScope.successMessage}">
          <div class="alert alert-success mb-3" role="alert">
              ${requestScope.successMessage}
          </div>
        </c:if>
        <c:if test="${not empty requestScope.errorMessage}">
          <div class="alert alert-danger mb-3" role="alert">
              ${requestScope.errorMessage}
          </div>
        </c:if>
        <div class="mb-3">
          <label for="user-username" class="form-label"><fmt:message key="ten_dang_nhap"/><span class="text-danger">*</span></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.usernameViolations
                   ? 'is-invalid' : (not empty requestScope.user.username ? 'is-valid' : '')}"
                 id="user-username"
                 name="username"
                 value="${requestScope.user.username}"
                 required
                 >
          <c:if test="${not empty requestScope.violations.usernameViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.usernameViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="user-password" class="form-label"><fmt:message key="mat_khau"/></label>
          <input type="password"
                 class="form-control ${not empty requestScope.violations.passwordViolations
                   ? 'is-invalid' : (not empty requestScope.user.password ? 'is-valid' : '')}"
                 id="user-password"
                 name="password"
                 value="${requestScope.user.password}"
                 placeholder="<fmt:message key="nhap_mat_khau_moi_hoac_de_trong"/>"
          >
          <c:if test="${not empty requestScope.violations.passwordViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.passwordViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="user-fullname" class="form-label"><fmt:message key="ho_va_ten"/> <span class="text-danger">*</span></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.fullnameViolations
                   ? 'is-invalid' : (not empty requestScope.user.fullname ? 'is-valid' : '')}"
                 id="user-fullname"
                 name="fullname"
                 value="${requestScope.user.fullname}"
                 required>
          <c:if test="${not empty requestScope.violations.fullnameViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.fullnameViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="user-email" class="form-label">Email <span class="text-danger">*</span></label>
          <input type="email"
                 class="form-control ${not empty requestScope.violations.emailViolations
                   ? 'is-invalid' : (not empty requestScope.user.email ? 'is-valid' : '')}"
                 id="user-email"
                 name="email"
                 value="${requestScope.user.email}"
                 required>
          <c:if test="${not empty requestScope.violations.emailViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.emailViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="user-phoneNumber" class="form-label"><fmt:message key="so_dien_thoai"/> <span class="text-danger">*</span></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.phoneNumberViolations
                   ? 'is-invalid' : (not empty requestScope.user.phoneNumber ? 'is-valid' : '')}"
                 id="user-phoneNumber"
                 name="phoneNumber"
                 value="${requestScope.user.phoneNumber}"
                 required>
          <c:if test="${not empty requestScope.violations.phoneNumberViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.phoneNumberViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label class="form-label d-block"><fmt:message key="gioi_tinh"/> <span class="text-danger">*</span></label>
          <div class="form-check d-inline-block me-4">
            <input class="form-check-input ${not empty requestScope.violations.genderViolations
                     ? 'is-invalid' : (not empty requestScope.user.gender ? 'is-valid' : '')}"
                   type="radio"
                   name="gender"
                   id="user-gender-male"
                   value="0" ${requestScope.user.gender == '0' ? 'checked' : ''}
                   required>
            <label class="form-check-label" for="user-gender-male"><fmt:message key="nam"/></label>
          </div>
          <div class="form-check d-inline-block">
            <input class="form-check-input ${not empty requestScope.violations.genderViolations
                     ? 'is-invalid' : (not empty requestScope.user.gender ? 'is-valid' : '')}"
                   type="radio"
                   name="gender"
                   id="user-gender-female"
                   value="1" ${requestScope.user.gender == '1' ? 'checked' : ''}
                   required>
            <label class="form-check-label" for="user-gender-female"><fmt:message key="nu"/></label>
          </div>
          <c:if test="${not empty requestScope.violations.genderViolations}">
            <div class="is-invalid"></div>
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.genderViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
<%--        <div class="mb-3">--%>
<%--          <label for="user-address" class="form-label"><fmt:message key="dia_chi"/> <span class="text-danger">*</span></label>--%>
<%--          <input type="text"--%>
<%--                 class="form-control ${not empty requestScope.violations.addressViolations--%>
<%--                   ? 'is-invalid' : (not empty requestScope.user.address ? 'is-valid' : '')}"--%>
<%--                 id="user-address"--%>
<%--                 name="address"--%>
<%--                 value="${requestScope.user.address}"--%>
<%--                 required>--%>
<%--          <c:if test="${not empty requestScope.violations.addressViolations}">--%>
<%--            <div class="invalid-feedback">--%>
<%--              <ul class="list-unstyled">--%>
<%--                <c:forEach var="violation" items="${requestScope.violations.addressViolations}">--%>
<%--                  <li>${violation}</li>--%>
<%--                </c:forEach>--%>
<%--              </ul>--%>
<%--            </div>--%>
<%--          </c:if>--%>
<%--        </div>--%>
        <div class="mb-3">
          <label for="user-role" class="form-label"><fmt:message key="quyen"/> <span class="text-danger">*</span></label>
          <select class="form-select ${not empty requestScope.violations.roleViolations
                    ? 'is-invalid' : (not empty requestScope.user.role ? 'is-valid' : '')}"
                  id="user-role"
                  name="role"
                  required>
            <option ${empty requestScope.user.role ? 'selected' : ''} disabled>
              <fmt:message key="chon_mot_quyen"/>...
            </option>
            <option value="ADMIN" ${requestScope.user.role == 'ADMIN' ? 'selected' : ''}>
              <fmt:message key="quan_tri_vien"/>
            </option>
            <option value="EMPLOYEE" ${requestScope.user.role == 'EMPLOYEE' ? 'selected' : ''}>
              <fmt:message key="nhan_vien"/>
            </option>
            <option value="CUSTOMER" ${requestScope.user.role == 'CUSTOMER' ? 'selected' : ''}>
              <fmt:message key="khach_hang"/>
            </option>
          </select>
          <c:if test="${not empty requestScope.violations.roleViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.roleViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <input type="hidden" name="id" value="${requestScope.user.id}">
        <button type="submit" class="btn btn-primary me-2 mb-3">
          <fmt:message key="sua"/>
        </button>
        <button type="reset"
                class="btn btn-warning me-2 mb-3"
                onclick="return confirm('<fmt:message key="ban_co_muon_de_gia_tri_mac_dinh"/>?')">
          <fmt:message key="mac_dinh"/>
        </button>
        <a class="btn btn-danger mb-3"
           href="${pageContext.request.contextPath}/admin/userManager"
           role="button"
           onclick="return confirm('<fmt:message key="ban_co_muon_huy"/>?')">
          <fmt:message key="huy"/>
        </a>
      </form>
    </main>
  </div> <!-- container.// -->
</section> <!-- section-content.// -->

<jsp:include page="_footerAdmin.jsp"/>
</body>

</html>
