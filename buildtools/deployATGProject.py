connect('weblogic','weblogic1', 't3://localhost:7001')

edit()
startEdit()

try:
    undeploy(appName='ATGProject',  timeout=60000)
    deploy(appName='ATGProject', path='/opt/oracle/product/atg/ATG11.1/home/bin/ATGProject.ear', targets='sonae_live', stageMode='nostage')
    save()
    activate()          
    print "~~~~COMMAND SUCCESFULL~~~~"

except:
    print "Unexpected error:", sys.exc_info()[0]
    undo('true','y')
    stopEdit('y')
    print "~~~~COMMAND FAILED~~~~"
    raise
























