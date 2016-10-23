
<%@ page import="openbeds.Shelter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shelter.label', default: 'Shelter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shelter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shelter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shelter">
			
				<g:if test="${shelterInstance?.predictedFillTime}">
				<li class="fieldcontain">
					<span id="predictedFillTime-label" class="property-label"><g:message code="shelter.predictedFillTime.label" default="Predicted Fill Time" /></span>
					
						<span class="property-value" aria-labelledby="predictedFillTime-label"><g:formatDate date="${shelterInstance?.predictedFillTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.predictedFillTimeFormated}">
				<li class="fieldcontain">
					<span id="predictedFillTimeFormated-label" class="property-label"><g:message code="shelter.predictedFillTimeFormated.label" default="Predicted Fill Time Formated" /></span>
					
						<span class="property-value" aria-labelledby="predictedFillTimeFormated-label"><g:fieldValue bean="${shelterInstance}" field="predictedFillTimeFormated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.bedCount}">
				<li class="fieldcontain">
					<span id="bedCount-label" class="property-label"><g:message code="shelter.bedCount.label" default="Bed Count" /></span>
					
						<span class="property-value" aria-labelledby="bedCount-label"><g:fieldValue bean="${shelterInstance}" field="bedCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.demographicRequirements}">
				<li class="fieldcontain">
					<span id="demographicRequirements-label" class="property-label"><g:message code="shelter.demographicRequirements.label" default="Demographic Requirements" /></span>
					
						<span class="property-value" aria-labelledby="demographicRequirements-label"><g:fieldValue bean="${shelterInstance}" field="demographicRequirements"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.maxBeds}">
				<li class="fieldcontain">
					<span id="maxBeds-label" class="property-label"><g:message code="shelter.maxBeds.label" default="Max Beds" /></span>
					
						<span class="property-value" aria-labelledby="maxBeds-label"><g:fieldValue bean="${shelterInstance}" field="maxBeds"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="shelter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${shelterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="shelter.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${shelterInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.predictedBedCount}">
				<li class="fieldcontain">
					<span id="predictedBedCount-label" class="property-label"><g:message code="shelter.predictedBedCount.label" default="Predicted Bed Count" /></span>
					
						<span class="property-value" aria-labelledby="predictedBedCount-label"><g:fieldValue bean="${shelterInstance}" field="predictedBedCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.streetAddress}">
				<li class="fieldcontain">
					<span id="streetAddress-label" class="property-label"><g:message code="shelter.streetAddress.label" default="Street Address" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress-label"><g:fieldValue bean="${shelterInstance}" field="streetAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelterInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="shelter.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${shelterInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shelterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${shelterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
