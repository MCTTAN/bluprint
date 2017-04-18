#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <stdlib.h>
using namespace std;

/*
Program Notes


*/

int main()
{
  string input;
  ifstream inFS;

  cout << "Get user input up to the newline." << endl;
  getline(cin, input);
  cin.ignore();
  
  if(input.find("Create") != string::npos || input.find("Make") != string::npos || input.find("Define") != string::npos)
  {
    // open the "Create" folder
    if(input.find("array") != string::npos)
    {
      // open the array template in the "Create" folder
      inFS.open("array.txt");
      if(inFS.fail())
      {
        cout << "Cannot open file" << endl;
        return 1;
      }
      while(!inFS.eof())
      {
        // Read the contents of the file and print them out
      }
      inFS.close();
    }
    
    if(input.find("vector") != string::npos)
    {
      // open the vector template in the "Create folder
      inFS.open("vector.txt");
      if(inFS.fail())
      {
        cout << "Cannot open file" << endl;
        return 1;
      }
      while(!inFS.eof())
      {
        // Read the contents of the file and print them out
      }
      inFS.close();
    }
  }
  
  
  
  return 0;
}

int main()
{
    ofstream outFS;
    ifstream inFS;
    string input_unparsed;
    vector<string> input_parsed;

    // Get user input up to the newline.

    outFS.open("input.txt");

    if(!outFS.is_open())
    {
        cout << "Could not open file." << endl;
        return 1;
    }

    getline(cin, input_unparsed);
    cin.ignore();

    while(!outFS.eof())
    {
      outFS << input_unparsed;
    }

    outFS.close();

    return 0;
}
