public class Dog extends Pet {
	private String hairLength;
	
	public Dog(String name, String race, int age, float weight, String hairLength) {
		super(name, race, age, weight);
		
		this.hairLength = hairLength;
	}
	
	public String talk() {
		return getName() + " dice: Guau Guau!";
	}
	
	public String getHairLength() {
		return hairLength;
	}
}
