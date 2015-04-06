package sample.droplet;

import java.io.IOException;

import javax.servlet.ServletException;

import sample.manager.EmployeeManager;
import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class EmployeeDroplet extends DynamoServlet {

    public static final String OPARAM_OUTPUT = "output";
    public static final String PARAM_ELEMENT = "element";

    private EmployeeManager employeeManager;

    public EmployeeManager getEmployeeManager() {
        return employeeManager;
    }

    public void setEmployeeManager(EmployeeManager employeeManager) {
        this.employeeManager = employeeManager;
    }

    @Override
    public void service(DynamoHttpServletRequest req, DynamoHttpServletResponse res) throws ServletException, IOException {
        RepositoryItem[] employeeItems = getEmployeeManager().getAllItems();
        req.setParameter(PARAM_ELEMENT, employeeItems);
        req.serviceLocalParameter(OPARAM_OUTPUT, req, res);
    }

}
