public abstract class Pet{
	protected int age;
	protected float weight;
	protected String race;
	protected String name;
	
	public Pet(String name, String race, int age, float weight) {
		this.name = name;
		this.race = race;
		
		age = 0;
		
		if(age < 0) {
			this.age = 0;
		} else {
			this.age = age;
		}
		
		if(weight < 1) {
			this.weight = 1;
		} else {
			this.weight = weight;
        }
	}
	
	public abstract String talk();
	
	public int getAge (){
		return age;
	}
	
	public void age() {
		age++;
    }
	
	public float getWeight (){
		return weight;
	}
	
	public void eat() {
		weight++;
	}
	
	public void eat(int food) {
		if(food > 0)
			weight += food;
	}
	
	public void poop() {
		if(weight > 1)
			weight--;
	}
	
	public void poop(int shit) {
		if(shit > 0 && weight > shit)
			weight -= shit;
    }
	
	public String getRace (){
		return race;
	}
	
	public String getName (){
		return name;
	}
}
