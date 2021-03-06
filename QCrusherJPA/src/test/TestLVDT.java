package test;

import java.util.Scanner;

public class TestLVDT {
	public static void main(String[] args) {
		LevenshteinDistTest ldt = new LevenshteinDistTest();
		Scanner scanner = new Scanner(System.in);
		String input2 = "notQuit";
		
		while(!input2.equals("quit")){
		System.out.println("String one: ");
		String input1 = scanner.nextLine();
		System.out.println("String two: ");
		input2 = scanner.nextLine();
		
		System.out.println("leven dist: "+ldt.levenshteinDist(input1, input2));
		System.out.println("leven percent: "+ldt.levPercent(input1, input2));
		}
		
		scanner.close();
	}

}
