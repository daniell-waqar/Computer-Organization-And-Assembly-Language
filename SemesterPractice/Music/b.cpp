#include <iostream>
using namespace std;

int main()
{


    bool found;

    char arr[5] = {'M','A','D','A','M'};

    int siz = 5;


    char new_arr[5];


    char *temp =  arr;

    char *temp1 = new_arr;

    for(int i=0; i<siz; i++)
    {
       *temp1 = *temp;
       temp++;
       temp1++;

    }

    temp = arr;
    temp1 = new_arr;
    temp1 = temp1 + (siz -1);

    for(int i=0;i<siz;i++)
    {

        if(*temp == *temp1)
        {
            temp++;
            temp1--;

            found = true;

        }

        else
        {
            found = false;

        }

    }

    if(found == true )
    {

        cout<<"Its a palindrome"<<endl;

    }

    else
    {

        cout<<"Its not a palindrome"<<endl;

    }

}