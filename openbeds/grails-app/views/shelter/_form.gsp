<%@ page import="openbeds.Shelter" %>



<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'predictedFillTime', 'error')} ">
	<label for="predictedFillTime">
		<g:message code="shelter.predictedFillTime.label" default="Predicted Fill Time" />
		
	</label>
	<g:datePicker name="predictedFillTime" precision="day"  value="${shelterInstance?.predictedFillTime}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'predictedFillTimeFormated', 'error')} ">
	<label for="predictedFillTimeFormated">
		<g:message code="shelter.predictedFillTimeFormated.label" default="Predicted Fill Time Formated" />
		
	</label>
	<g:textField name="predictedFillTimeFormated" value="${shelterInstance?.predictedFillTimeFormated}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'bedCount', 'error')} required">
	<label for="bedCount">
		<g:message code="shelter.bedCount.label" default="Bed Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bedCount" type="number" value="${shelterInstance.bedCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'demographicRequirements', 'error')} required">
	<label for="demographicRequirements">
		<g:message code="shelter.demographicRequirements.label" default="Demographic Requirements" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="demographicRequirements" required="" value="${shelterInstance?.demographicRequirements}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'maxBeds', 'error')} required">
	<label for="maxBeds">
		<g:message code="shelter.maxBeds.label" default="Max Beds" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxBeds" type="number" value="${shelterInstance.maxBeds}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="shelter.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${shelterInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="shelter.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${shelterInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'predictedBedCount', 'error')} required">
	<label for="predictedBedCount">
		<g:message code="shelter.predictedBedCount.label" default="Predicted Bed Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="predictedBedCount" type="number" value="${shelterInstance.predictedBedCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'streetAddress', 'error')} required">
	<label for="streetAddress">
		<g:message code="shelter.streetAddress.label" default="Street Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="streetAddress" required="" value="${shelterInstance?.streetAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelterInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="shelter.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" required="" value="${shelterInstance?.zip}"/>

</div>

