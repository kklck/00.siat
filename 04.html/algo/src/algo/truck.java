package algo;

import java.util.ArrayDeque;
import java.util.Queue;

public class truck {
	public static int solution(int bridge_length, int weight, int[] truck_weights) {
		Queue<Integer> bridge = new ArrayDeque<>();

		for(int i = 0; i<truck_weights.length;i++) {
			
		}
        int answer = 0;
        return answer;
    }

	public static void main(String[] args) {
		int[] a1 = {7,4,5,6};
		int[] a2 = {10};
		int[] a3 = {10,10,10,10,10,10,10,10,10,10};
		System.out.println(solution(2, 10, a1));
		System.out.println(solution(100, 100, a2));
		System.out.println(solution(100, 100, a3));
	}
}
