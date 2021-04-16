package skill;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;
import java.io.FileInputStream;

public class maxinos{
   public static void main(String args[]) throws Exception{
      
      Scanner sc = new Scanner(System.in);
      int T;
      T=sc.nextInt();
      int index = 0;
      int[][] maxi = null;
      int m = 0;
      
      //입력
      for(int test_case = 1; test_case <= T; test_case++){
         index = sc.nextInt();
         maxi = new int[index][index];
         for(int i = 0; i< index;i++) {
            for(int j = 0; j< index;j++) {
               maxi[i][j] = sc.nextInt();
               if(maxi[i][j] ==1 && i != 0 && i != index-1 && j != 0 && j != index-1) {
                  m++;
               }
            }
         }
      
      //입력 순 4방향
      int[][] sort = new int[m][4];
      //입력 순 좌표
      int[][] xy = new int[m][2];
      
      //4방향 초기화
      int c = 0;
      for(int i = 1; i<index-1;i++) {
         for(int j = 1; j<index-1;j++) {
            if(maxi[i][j] == 1) {
               sort[c] = check(maxi,i,j);
               xy[c][0] = i;
               xy[c][1] = j;
               c++;
            }
         }
      }
      //전선 겹침 방지
         System.out.println("#"+test_case + " " +recheck(maxi, xy, sort));
      }
   }

   private static int recheck(int [][] maxi, int[][] xy, int[][] sort) {
      //순번 우선순위
   int a = 0;
   int[] prop = new int[xy.length];
   for(int i = 0; i<sort.length;i++) {
      a = 0;
      for(int j = 0; j<4;j++) {
         if(sort[i][j] != 0) {
            a++;
         }
      }
      prop[i] = a;
   }
   
   int [][] s = new int[xy.length][4];
   
      //좌표 내 적은 전선 순
      for(int i = 0; i<xy.length;i++) {
         s[i][0] = sort[i][0];
         s[i][1] = sort[i][1];
         s[i][2] = sort[i][2];
         s[i][3] = sort[i][3];
         Arrays.sort(s[i]);
      }
      
      int t = 0;
      for(int i = 0; i<s.length;i++) {
         if(prop[i] == 1) {
            t++;
         }
      }
      int[] tt = new int[t];
      int xx = 0;
      for(int i = 0; i<s.length;i++) {
         if(prop[i] == 1) {
         tt[xx] = s[i][3];
         xx++;
         }
      }
      Arrays.sort(tt);
//      for(int i = 0; i<s.length;i++) {
//         for(int q : sort[i]) {
//            System.out.print(q);
//         }
//         System.out.print(" : ");
//         for(int q : s[i]) {
//            System.out.print(q);
//         }
//         System.out.println();
//      }
      xx=0;
      int[] x = {0,0,0,0};
      for(int i = 0; i<s.length;i++) {
         if(prop[i] == 1) {
            for(int j = 0; j<s[j].length;j++) {
               if(sort[i][j] != 0) {
//                  System.out.println(sort[i][j] + " " + tt[xx]);
                  sort[i][j] = tt[xx];
                  xx++;
               }
            }
         }
      }
      
   int index = 0;
   
   int result = 0;
   int[][] ss = new int[xy.length][4];
   for(int i = 1; i<=4 ;i++) {
      for(int j = 0; j<s.length;j++) {
         if(prop[j] == i) {
            if(prop[j] == 1) {
//               for(int k = 0; k<s.length;k++) {
//                  for(int q = 0; q<s.length;q++) {
//                     if(s[k][q] == tt[q]) {
//                        ss[index] = s[j];
//                        result +=(indexCheck(maxi, xy[j], ss[index], sort[j]));                     
//                        index++;
//                     }
//                  }
//               }
            }else{
               ss[index] = s[j];
               result +=(indexCheck(maxi, xy[j], ss[index], sort[j]));
               index++;
            }
            
         }
      }
   }
   return result;
}


private static int indexCheck(int maxi[][], int[] xy, int[] ss, int[] sort) {
   
   System.out.print(xy[0]+ " " + xy[1] + " : ");
   for(int z : ss) {
      System.out.print(z);
   }
   System.out.print(" : ");
   for(int z : sort) {
      System.out.print(z);
   }
   System.out.println();
   

   //전선 수
   int p = 1;
   //방향
   int q = nextLine(ss,sort, 0);;

         
      while(true) {
         p=1;
         if(q==0) {
//            System.out.println("--");
            while(true) {
               if(xy[0]-p == -1) {
                  System.out.println("q : " + q);
                  return p-1;
               }else if(maxi[xy[0]-p][xy[1]]==1) {
                  System.out.println("break0");
                  break;
               }
               System.out.println(q + "방향 0");
               maxi[xy[0]-p][xy[1]]=1;
               p++;
            }
         }else if(q==1) {
            while(true) {
               if(xy[1]+p == maxi.length) {
                  System.out.println("q : " + q);
                  return p-1;
               }else if(maxi[xy[0]][xy[1]+p]==1) {
                  System.out.println("break1");
                  break;
               }
               System.out.println(q + "방향 1");
               maxi[xy[0]][xy[1]+p]=1;
               p++;
            }
         }else if(q==2) {
            while(true) {
               if(xy[0]+p == maxi.length) {
                  System.out.println("q방향 : " + q + " p전선 : " + p);
                  return p-1;
               }else if(maxi[xy[0]+p][xy[1]]==1) {
                  System.out.println("break2");
                  break;
               }
               System.out.println(q + "방향 2");
               maxi[xy[0]+p][xy[1]]=1;
               p++;
            }
         }else if(q==3) {
            while(true) {
               if(xy[1]-p == -1) {
                  System.out.println("q : " + q);
                  return p-1;
               }else if(maxi[xy[0]][xy[1]-p]==1) {
//                  System.out.println("break3");
                  break;
               }
               System.out.println(q + "방향 3");
               maxi[xy[0]][xy[1]-p]=1;
               p++;
            }
         }else {
            System.out.println("무야호");
            return 0;
         }
         
         q = nextLine(ss,sort,sort[q]);
         System.out.println("넥스트 q : " + q);
   }
}

private static int nextLine(int[] ss, int[] sort, int n) {
   int p = 0;
   for(int i = 0; i<ss.length;i++) {
      if(ss[i] == n) {
         p = i + 1;
      }
   }
   
   System.out.println("라인 p : " + p);
   int q = -1;
   for(int i = p; i<ss.length; i++) {
      for(int j = 0; j<ss.length;j++) {
         if(ss[i] != 0 && sort[j] != 0) {
            System.out.println(ss[i] + " " + sort[j]);
            if(ss[i] == sort[j]) {
               System.out.println("라인 j : " + j);
               return j;
            }
         }
      }
   }
   return -1;
}

private static int[] check(int[][] maxi, int x, int y) {
   int index = maxi.length;
      int xmax = x+1, xmin = x-1, ymax = y+1, ymin = y-1;
      int xmaxline = 0, xminline = 0, ymaxline = 0, yminline = 0;
      boolean xmaxflag=true, xminflag=true, ymaxflag=true, yminflag=true;
      while(true) {
         if(xmaxflag == true) {
//            System.out.println(x + " " + y + " : " + xmax + " " + " " + y + " / " + xmaxline);
            if(xmax < index&&maxi[xmax][y] == 1) {
               xmaxline=0;
               xmax = index;
               xmaxflag=false;
            }else if(xmax != index && maxi[xmax][y] != 1) {
               xmaxline++;
               xmax++;
            } 
         }
         if(xminflag ==true) {
            if(xmin > -1 && maxi[xmin][y] == 1) {
               xminline=0;
               xmin =-1;
               xminflag=false;
            }else if(xmin != -1 && maxi[xmin][y] != 1) {
               xminline++;
               xmin--;
            } 
         }
         if(ymaxflag ==true) {
            if(ymax < index && maxi[x][ymax] == 1) {
               ymaxline=0;
               ymax = index;
               ymaxflag=false;
            }else if(ymax != index && maxi[x][ymax] != 1) {
               ymaxline++;
               ymax++;
            }
         }
         if(yminflag ==true) {
            if(ymin > -1 && maxi[x][ymin] == 1) {
               yminline=0;
               ymin = -1;
               yminflag=false;
            }else if(ymin != -1 && maxi[x][ymin] != 1) {
               yminline++;
               ymin--;
            }
         }
         if(xmax == index&& xmin==-1&&ymax==index&&ymin==-1) {
            break;
         }
      }
      int[] s = {xminline, ymaxline, xmaxline, yminline};
//      System.out.println(x + " " + y + " : " + s[0] +" " + s[1]+ " " + s[2] + " " + s[3] );
      return s;
      
   }
}

/*
1
7    
0 0 1 0 0 0 0
0 0 1 0 0 0 0
0 0 0 0 0 1 0
0 0 0 0 0 0 0
1 1 0 1 0 0 0
0 1 0 0 0 0 0
0 0 0 0 0 0 0

1
7
0 0 0 0 0 1 0
0 0 0 0 0 1 1
0 0 0 0 0 1 0
1 1 1 0 0 0 0
0 1 0 0 0 0 0
0 0 0 0 0 0 0
0 0 0 0 0 0 0
 * 
 */