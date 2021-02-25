#pragma once
#include<vector>
using namespace std;

#define len(x) x.size()
#define range(x) x.begin(), x.end()

template<class T>
ostream& operator << (ostream& o, const vector<T>& vec) {
	o << "[ ";
	for (const auto& v : vec) {
		o << v << ' ';
	}
	o << "]";
	return o;
}
template<class T>
istream& operator >>(istream& in, vector<T>& vec) {
	for (auto& v: vec) in >> v;
	return in;
}
template<class T>
ostream& operator << (ostream& o, const vector<vector<T>>& mat) {
	int ic = 0;
	for (const auto& vek : mat) {
		if (!ic) { o << "["; }
		else { o << ' '; }
		o << vek << (ic == len(mat)-1 ? "]\n" : "\n");
		ic++;
	}
	return o;
}
