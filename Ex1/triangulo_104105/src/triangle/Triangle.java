package triangle;

public class Triangle {

	private int sideA;
	private int sideB;
	private int sideC;
	
	public Triangle(int sideA, int sideB, int sideC) {
		this.sideA=sideA;
		this.sideB=sideB;
		this.sideC=sideC;
	}
	
	public int isTriangle() {
		int sumAB = this.sideA+this.sideB;
		int sumAC = this.sideA+this.sideC;
		int sumBC = this.sideB+this.sideC;
		
		if(sumAB < this.sideC || sumAC < this.sideB || sumBC< this.sideA)
			return 0;
		
		return 1;
	}
	public int isEquilateral() {
		if(this.isTriangle() == 1)
			if(sideA == sideB && sideA ==sideC) return 1;
		
		return 0;
	}
	
	public int isIsoceles() {
		if(this.isTriangle() == 1)
			if(this.isEquilateral()==0) {
				if(sideA == sideB || sideA == sideC || sideB == sideC)
					return 1;
			}
		return 0;
	}
	public int isScalene() {
		if(this.isTriangle() == 1)
			if(this.isEquilateral()==0 && this.isIsoceles()==0) return 1;
		return 0;
		
	}
}
