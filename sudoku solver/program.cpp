#include<iostream>
#include<vector>
#include<algorithm>
#include<map>
#include<stack>
using namespace std;

#include"util.hpp"

#include"io.hpp"

void solve_sudoku(const string& inputFileName, const string& outputFileName) {
	auto mat = read_input(inputFileName);
	cout << "input:\n";
	cout << mat << '\n';
	stack<pair<int,int>> st;
	bool backtrack = false;
	for (int i = 0; i < 9; i++) {
		for (int j = 0; j < 9; j++) {
			//cout << ":: " << i << ", " << j << " : " << mat[i][j] << '\n';
			if (mat[i][j] == 0 || backtrack) {
				// check for options
				map<int,bool> invalid;
				for (int r = 0; r < 9; r++) {
					invalid[mat[r][j]] = true;
					invalid[mat[i][r]] = true;
				}
				{
					int x0 = i-i%3, x1 = x0+3;
					int y0 = j-j%3, y1 = y0+3;
					for (int r = x0; r < x1; r++) {
					for (int c = y0; c < y1; c++) {
						invalid[mat[r][c]] = true;
					}
					}
				}
				//
				bool noMove = true;
				for (int a = mat[i][j]+1; a < 10; a++) {
					if (!invalid[a]) {
						mat[i][j] = a;
						noMove = false;
						break;
					}
				}
				if (noMove) {
					//cout << "noMove\n" << mat << '\n';
					mat[i][j] = 0;
					backtrack = true;
					auto top = st.top(); st.pop();
					i = top.first, j = top.second-1;
				} else {
					backtrack = false;
					st.push({i,j});
				}
				//
			}
		}
	}
	write_output(mat, outputFileName);
	cout << "\nres:\n" << mat;
}

int main() {
	solve_sudoku("input.dat", "output.dat");
}
