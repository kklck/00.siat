package skill;

import java.util.Arrays;
import java.util.Scanner;
import java.io.FileInputStream;

/*
   ����ϴ� Ŭ�������� Solution �̾�� �ϹǷ�, ������ Solution.java �� ����� ���� �����մϴ�.
   �̷��� ��Ȳ������ �����ϰ� java Solution �������� ���α׷��� �����غ� �� �ֽ��ϴ�.
 */
public class stock {
	
	private static long stock(long[] days) {
		//�ְ� ��������
		long[] sort = new long[days.length];
		for(int i = 0; i<days.length; i++) {
			sort[i] = days[i];
		}
		Arrays.sort(sort);
		
		//�ִ� �ְ�
		int min = 0;
		
		//�ִ� �ְ���
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