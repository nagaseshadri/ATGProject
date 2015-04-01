cd $DYNAMO_HOME/bin
./runAssembler ATGProject.ear -m DafEar.Admin ATGProject
rm -rf ATGProject.ear/atgproject.war
ln -s $DYNAMO_ROOT/ATGProject/j2ee-apps/atgproject.ear/atgproject.war ATGProject.ear/atgproject.war

