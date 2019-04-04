#include <bits/stdc++.h>
#define enl '\n'
using namespace std;
int ans[10][10];
vector<int> possib[10][10];

bool possiblev(int r, int c)
{
    int i, j;
    int vis[10]= {0};
    for(i=0;i<9;i++)    vis[ans[i][c]]=1;
    for(j=0;j<9;j++)    vis[ans[r][j]]=1;
    int boxi= floor(r/3), boxj= floor(c/3);
    boxi*= 3;   boxj*=3;
    for(i=boxi; i<= boxi +2; i++)
        for(j=boxj; j<= boxj+ 2; j++)
            vis[ans[i][j]]= 1;
    j=0;
    for(i=1;i<=9;i++)
    {
        if(vis[i]==0) {  possib[r][c].push_back(i); j=1;}
    }
    return j&1;
}

bool solve(int arr[][10], int r, int c)
{
    if(r>=8 && c>=8 && ans[8][8]!=0)    return 1;
    int i=r, k, j=c;
    for(;i<9;i++)
    {
        for(;j<9;j++)
        {
            if(ans[i][j]==0)
            {
                bool f= possiblev(i,j);
                if(f==0){   return 0;}

                for(k=0;k<possib[i][j].size();k++)
                {
                    ans[i][j]= possib[i][j][k];

                    bool v= solve(arr, i%9, j%9);
                    if(v==1)    return 1;
                }
                if(k==possib[i][j].size()){ ans[i][j]=0;
                    possib[i][j].clear(); return 0;}
            }
        }
        j=0;
    }
}


int main() {
	ios_base::sync_with_stdio(0);
	cin.tie(0); cout.tie(0);
	int arr[10][10]= {{2,0,0,3,1,0,0,0,0},
	                    {8,0,4,0,6,2,0,0,3},
	                    {0,1,3,8,0,0,2,0,0},
	                    {0,0,0,0,2,0,3,9,5},
	                    {5,0,7,0,0,0,6,2,1},
	                    {0,3,2,0,0,6,0,8,0},
	                    {0,2,0,0,0,9,1,4,0},
	                    {6,0,1,2,5,0,8,0,9},
	                    {0,0,0,0,0,1,0,0,2}};
	int i, j;
	for(i=0;i<9;i++)
	    for(j=0;j<9;j++)    ans[i][j]= arr[i][j];
	 bool v= solve(arr,0,0);
	 for(i=0;i<9;i++)
	 {
	    for(j=0;j<9;j++)    cout<<ans[i][j]<<" ";
	    cout<<enl;
	 }
	return 0;
}

