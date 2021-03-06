package skill;

import java.util.Scanner;

public class prospect {
	
	public static int prospect(int[] apt) {
		int lmax = 0, rmax = 0, result = 0;
		for(int i = 2; i<apt.length-2;i++) {
			lmax = apt[i-2]>=apt[i-1]?apt[i-2]:apt[i-1];
			rmax = apt[i+1]>=apt[i+2]?apt[i+1]:apt[i+2];
			int max = lmax>=rmax?lmax:rmax;
			if(apt[i] > max) {
				result += apt[i] - max;
			}
		}
		return result;
	}

	public static void main(String args[]) throws Exception{
		Scanner sc = new Scanner(System.in);
		int T = 10;
		for(int test_case = 1; test_case <= T; test_case++){
			int index = sc.nextInt();
			int[] apt = new int[index];
			for(int i = 0;i<index;i++) {
				apt[i] = sc.nextInt();
			}
			System.out.println("#"+test_case+ " " + prospect(apt));
		}
	}
}
