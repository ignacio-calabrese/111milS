public class Cat extends Pet {
	private String eyeColor;
	
	public Cat(String name, String race, int age, float weight, String eyeColor) {
		super(name, race, age, weight);
		
		this.eyeColor = eyeColor;
	}
	
	public String talk() {
		return getName() + " dice: Miau Miau!";
	}
	
	public String getEyeColor() {
		return eyeColor;
	}
}
