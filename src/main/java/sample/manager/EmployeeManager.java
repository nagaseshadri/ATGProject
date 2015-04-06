package sample.manager;

import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class EmployeeManager {

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

    public RepositoryItem[] getAllItems() {
        RepositoryItem[] employeeItems = null;
        try {
            RepositoryView employeeView = getEmployeeRepository().getView(getItemDescriptorName());
            RqlStatement getAllStatement = RqlStatement.parseRqlStatement("ALL");
            employeeItems = getAllStatement.executeQuery(employeeView, new Object[] { null });

        } catch (RepositoryException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return employeeItems;
    }

}