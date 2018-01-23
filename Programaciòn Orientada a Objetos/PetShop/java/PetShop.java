public class PetShop {
	public static void main(String args[]) {
		Dog myDog = new Dog("Lanudo", "Ovejero Aleman", 2, 2, "Largo");
		
		System.out.println(myDog.talk());
		
		System.out.println(myDog.getName());
		System.out.println(myDog.getRace());
		System.out.println(myDog.getAge());
		System.out.println(myDog.getWeight());
		System.out.println(myDog.getHairLength());
		
		myDog.eat();
		myDog.age();
		System.out.println(myDog.talk());
		
		System.out.println(myDog.getName());
		System.out.println(myDog.getRace());
		System.out.println(myDog.getAge());
		System.out.println(myDog.getWeight());
		System.out.println(myDog.getHairLength());
		
		myDog.poop(2);
		System.out.println(myDog.getWeight());
		
		Cat myCat = new Cat("Manchita", "Siames", 2, 2, "Celestes");
		
		System.out.println(myCat.talk());
		
		System.out.println(myCat.getName());
		System.out.println(myCat.getRace());
		System.out.println(myCat.getAge());
		System.out.println(myCat.getWeight());
		System.out.println(myCat.getEyeColor());
		
		myCat.eat();
		myCat.age();
		System.out.println(myCat.talk());
		
		System.out.println(myCat.getName());
		System.out.println(myCat.getRace());
		System.out.println(myCat.getAge());
		System.out.println(myCat.getWeight());
		System.out.println(myCat.getEyeColor());
		
		myCat.poop(2);
		System.out.println(myCat.getWeight());
	}
}
