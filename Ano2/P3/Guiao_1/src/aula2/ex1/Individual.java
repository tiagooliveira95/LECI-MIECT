package aula2.ex1;

public class Individual {
	private String name;
	private int partnerId;
	private int cc;
	private long birthTimeStamp;

	public Individual(String name, int partnerId, int cc, long birthTimeStamp) {
		this.name = name;
		this.partnerId = partnerId;
		this.cc = cc;
		this.birthTimeStamp = birthTimeStamp;
	}

	public String getName() {
		return name;
	}

	public int getPartnerId() {
		return partnerId;
	}

	public int getCc() {
		return cc;
	}

	public long getBirthTimeStamp() {
		return birthTimeStamp;
	}
}
