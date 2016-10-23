
<%@ page import="openbeds.Shelter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shelter.label', default: 'Shelter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shelter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shelter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="predictedFillTime" title="${message(code: 'shelter.predictedFillTime.label', default: 'Predicted Fill Time')}" />
					
						<g:sortableColumn property="predictedFillTimeFormated" title="${message(code: 'shelter.predictedFillTimeFormated.label', default: 'Predicted Fill Time Formated')}" />
					
						<g:sortableColumn property="bedCount" title="${message(code: 'shelter.bedCount.label', default: 'Bed Count')}" />
					
						<g:sortableColumn property="demographicRequirements" title="${message(code: 'shelter.demographicRequirements.label', default: 'Demographic Requirements')}" />
					
						<g:sortableColumn property="maxBeds" title="${message(code: 'shelter.maxBeds.label', default: 'Max Beds')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'shelter.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shelterInstanceList}" status="i" var="shelterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shelterInstance.id}">${fieldValue(bean: shelterInstance, field: "predictedFillTime")}</g:link></td>
					
						<td>${fieldValue(bean: shelterInstance, field: "predictedFillTimeFormated")}</td>
					
						<td>${fieldValue(bean: shelterInstance, field: "bedCount")}</td>
					
						<td>${fieldValue(bean: shelterInstance, field: "demographicRequirements")}</td>
					
						<td>${fieldValue(bean: shelterInstance, field: "maxBeds")}</td>
					
						<td>${fieldValue(bean: shelterInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shelterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
