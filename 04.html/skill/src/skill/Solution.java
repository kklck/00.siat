package skill;

import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;
import java.io.FileInputStream;

public class Solution{
	
	public static void main(String args[]) throws Exception{
		
		Scanner sc = new Scanner(System.in);
		int T;
		T=sc.nextInt();
		int[][] won = new int[T][2];
		for(int test_case = 1; test_case <= T; test_case++){
			won[test_case-1][0] = sc.nextInt();
			won[test_case-1][1] = sc.nextInt();
//			for(int i : won[test_case-1]) {
//				System.out.println(i);
//			}
			System.out.println(won[test_case][1]);
//		System.out.println("#"+test_case +" " + price(won[test_case-1]));
			
		} 
	}

	private static int price(String[] won) {
		int[] arr = {};
		for(int i = 0; i<arr.length;i++) {
			arr[i] = won[0].charAt(i);
		}
		System.out.println(won[1]);
//		System.out.println();
//		Arrays.sort(arr, Collections.reverseOrder());
		
		return 0;
	}
}

/*
10
123 1
2737 1
757148 1
78466 2
32888 2
777770 5
436659 2
431159 7
112233 3
456789 10
*/