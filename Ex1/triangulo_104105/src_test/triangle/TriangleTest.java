package triangle;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TriangleTest {

	private Triangle t1 = new Triangle(9,9,9);
	private Triangle t2 = new Triangle(3,6,6);
	private Triangle t3 = new Triangle(1,2,3);
	private Triangle t4 = new Triangle(4,3,5);;
	
	@Test
	public void isTriangleTest(){
		int result = t4.isTriangle();
		assertEquals(1, result);
	}
	@Test
	public void isNotTriangleTest() {
		int result = t3.isTriangle();
		assertEquals(0, result);
	}
	@Test
	public void isEquilateralTest() {
		int result = t1.isEquilateral();
		assertEquals(1, result);
	}
	@Test
	public void isIsocelesTest() {
		int result = t2.isIsoceles();
		assertEquals(1, result);
	}
}
