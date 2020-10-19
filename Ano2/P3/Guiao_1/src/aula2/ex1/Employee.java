package aula2.ex1;

public class Employee extends Individual {
	private final int employeeId;
	private final int nif;

	public Employee(String name, int partnerId, int cc, long birthTimeStamp, int employeeId, int nif) {
		super(name, partnerId, cc, birthTimeStamp);
		this.employeeId = employeeId;
		this.nif = nif;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public int getNif() {
		return nif;
	}
}
