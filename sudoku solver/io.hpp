#pragma once
#include<iostream>
#include<vector>

#include<fstream>
vector<vector<int>> read_input(const string& fileName) {
	vector<vector<int>> mat(9, vector<int>(9));
	ifstream inp(fileName, ios_base::in);
	for (auto& vk: mat) {
		for (auto& el: vk) {
			inp >> el;
		}
	}
	return mat;
}

void write_output(const vector<vector<int>>& mat, const string& fileName) {
	ofstream out(fileName);
	for (int i = 0; i < len(mat); i++) {
		for (int j = 0; j < len(mat[i]); j++) {
			out << mat[i][j] << ' ';
		} out << '\n';
	}
}
