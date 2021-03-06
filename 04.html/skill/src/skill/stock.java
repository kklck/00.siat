package skill;

import java.util.Arrays;
import java.util.Scanner;
import java.io.FileInputStream;

/*
   사용하는 클래스명이 Solution 이어야 하므로, 가급적 Solution.java 를 사용할 것을 권장합니다.
   이러한 상황에서도 동일하게 java Solution 명령으로 프로그램을 수행해볼 수 있습니다.
 */
public class stock {
	
	private static long stock(long[] days) {
		//주가 오름차순
		long[] sort = new long[days.length];
		for(int i = 0; i<days.length; i++) {
			sort[i] = days[i];
		}
		Arrays.sort(sort);
		
		//최대 주가
		int min = 0;
		
		//최대 주가일
		long fit = 0L;
		for(int i = sort.length-1; i>=0;i--) {
			for(int j = sort.length-1; j>=min;j--) {
				if(sort[i] == days[j]) {
					fit += profit(days,min,j);
					min = j+1;
				}
			}
		}
		return fit;
	}
	
	private static long profit(long[] days, int min, int max) {
		long shares = 0L, seed = 0L;
		for(int i = min; i<max;i++) {
			shares++;
			seed += days[i];
		}
		return days[max]*shares-seed;
	}

	public static void main(String args[]) throws Exception{
		Scanner sc = new Scanner(System.in);
		int T;
		T=sc.nextInt();
		for(int test_case = 1; test_case <= T; test_case++){
			int day_index = sc.nextInt();
			long[] days = new long[day_index];
			for(int j = 0; j<day_index;j++) {
				days[j] = sc.nextInt();
			}
			System.out.println("#"+ test_case + " " + stock(days));
		}
	}
}

/*
4
3
10 7 6
3
3 5 9
5
1 1 3 1 2
2
522 4575
5
6426 9445 8772 81 3447
*/