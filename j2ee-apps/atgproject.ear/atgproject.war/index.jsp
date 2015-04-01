<%@include file="includes/taglibs.jspf" %>
<dsp:page>
karthik <dsp:valueof bean="/atg/dynamo/service/CurrentDate.secondAsDate"/>


<dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
  <dsp:param name="queryRQL" value="interests INCLUDES \"joking\""/>
  <dsp:param name="repository" value="/sample/EmployeeRepository"/>
  <dsp:param name="itemDescriptor" value="employee"/>
  <dsp:oparam name="outputStart">
   <p>header
  </dsp:oparam>
  <dsp:oparam name="output">
    <p>OUTPUT :: <dsp:valueof param="element.lastName"/>,<dsp:valueof param="element.firstName"/> ::  <dsp:valueof param="count"/> :: <dsp:valueof param="index"/>
  </dsp:oparam>
  <dsp:oparam name="error">
    <p>ERROR :: <dsp:valueof param="error"/>
  </dsp:oparam>
  <dsp:oparam name="empty">
    <p>EMPTY :: <dsp:valueof param="empty"/>
  </dsp:oparam>
  <dsp:oparam name="outputEnd">
   <p>footer
  </dsp:oparam>
</dsp:droplet>

</dsp:page>