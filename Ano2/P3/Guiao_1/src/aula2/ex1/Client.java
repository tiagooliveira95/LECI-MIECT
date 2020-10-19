package aula2.ex1;

public class Client extends Individual {
	private final int nmec;
	private final int courseId;

	public Client(String name, int partnerId, int cc, long birthTimeStamp, int nmec, int courseId) {
		super(name, partnerId, cc, birthTimeStamp);
		this.nmec = nmec;
		this.courseId = courseId;
	}

	public int getNmec() {
		return nmec;
	}

	public int getCourseId() {
		return courseId;
	}
}
