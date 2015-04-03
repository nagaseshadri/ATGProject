<%@include file="includes/taglibs.jspf" %>
<dsp:page>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/sample/droplet/EmployeeDroplet"/>
  
  <dsp:droplet name="EmployeeDroplet">
    <dsp:param name="id" param="id"/>
    <dsp:oparam name="output">
      <dsp:droplet name="ForEach">
        <dsp:param name="array" param="element"/>
        <dsp:param name="elementName" value="employee"/>
        <dsp:oparam name="output">
          <dsp:valueof param="employee.firstName"/> :: <dsp:valueof param="employee.lastName"/> <br/>
          <dsp:droplet name="ForEach">
            <dsp:param name="array" param="employee.interests"/>
            <dsp:param name="elementName" value="interest"/>
            <dsp:oparam name="output">
              <dsp:valueof param="interest"/><br/>
            </dsp:oparam>
          </dsp:droplet>
          <dsp:droplet name="ForEach">
            <dsp:param name="array" param="employee.projects"/>
            <dsp:param name="elementName" value="project"/>
            <dsp:oparam name="output">
              <dsp:valueof param="index"/>
              <dsp:valueof param="project"/><br/>
            </dsp:oparam>
          </dsp:droplet>
          <dsp:droplet name="ForEach">
            <dsp:param name="array" param="employee.addresses"/>
            <dsp:param name="elementName" value="address"/>
            <dsp:oparam name="output">
              <dsp:valueof param="key"/>
              <dsp:valueof param="address.address1"/><br/>
            </dsp:oparam>
          </dsp:droplet>
        </dsp:oparam>
      </dsp:droplet>
    </dsp:oparam>
  </dsp:droplet>
  
</dsp:page>