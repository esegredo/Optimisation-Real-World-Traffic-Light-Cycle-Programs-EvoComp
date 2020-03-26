#include "simpleXMLParser.hpp"
#include <iostream>

void getPairMap(string s, map<string, string> &m) {
	m.clear();

	// Remove entity name
  int pos = s.find_first_of("<");
  pos = s.find_first_not_of(" ", pos);
  pos = s.find_first_of(" ", pos);
	s.erase(0, pos);

  while (pos != string::npos) {
    int begin = s.find_first_not_of(" ");
    int end = s.find_first_of("=");
    string param = s.substr(begin, end - begin);
	  s.erase(0, end + 2);
    end = s.find_first_of("\"");
    string value = s.substr(0, end);
	  m.insert(pair<string,string>(param, value));
	  s.erase(0, end + 1);
    pos = s.find_first_of("=");
  }
}

bool isSubString(string o, string s, int &pos)
{
	pos = o.find(s);
	return (pos != string::npos);
}
