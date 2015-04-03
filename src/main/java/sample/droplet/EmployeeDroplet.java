package sample.droplet;

import java.io.IOException;

import javax.servlet.ServletException;

import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class EmployeeDroplet extends DynamoServlet {

    public static final String OPARAM_OUTPUT = "output";
    public static final String PARAM_ELEMENT = "element";

    private Repository employeeRepository;
    private String itemDescriptorName;

    public Repository getEmployeeRepository() {
        return employeeRepository;
    }

    public void setEmployeeRepository(Repository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public String getItemDescriptorName() {
        return itemDescriptorName;
    }

    public void setItemDescriptorName(String itemDescriptorName) {
        this.itemDescriptorName = itemDescriptorName;
    }

    @Override
    public void service(DynamoHttpServletRequest req, DynamoHttpServletResponse res) throws ServletException, IOException {
        // Repository employeeRepository = (Repository) req.resolveName("/sample/EmployeeRepository");
        try {
            RepositoryView employeeView = getEmployeeRepository().getView(getItemDescriptorName());
            RqlStatement getAllStatement = RqlStatement.parseRqlStatement("ALL");
            RepositoryItem[] employeeItems = getAllStatement.executeQuery(employeeView, new Object[] { null });
            req.setParameter(PARAM_ELEMENT, employeeItems);
            req.serviceLocalParameter(OPARAM_OUTPUT, req, res);
        } catch (RepositoryException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
