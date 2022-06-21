#include <iostream>
using namespace std;

class createlist
{   
    public:
    int* arr;;
    int size;
    int length;
    int *curr;


    public:
    createlist(){

        cout << "Enter size of an array : ";
        cin >> size;
        arr=new int[size];
        length=0;
        curr=arr;
        


        for(int i =0; i<size; i++)
        {
            cout << "Enter "<< i+1 << " element : ";
            
            cin >> *curr;
            length++;
            next();

        }



    
    }


    ~createlist()
    {
        delete [] arr;
    }

    void next()
    {   

        curr++;
    }

    void back()
    {
        if(length == 0)
        {
            cout << "pointer is at first position ";
        }

        else
            curr--;
    }

    void start()
    {
        curr = arr;
    }

        

    int Length()
    {
        return length;
    }



    int get(int pos)
    {
        for(int i = 1; i<pos; i++)
        {
            next();
        }
        cout << *curr;
        return *curr;
    }

    void  update(int val, int pos)
    {
        for(int i = 1; i<pos; i++)
        {
            next();
        }

        *curr = val;
    }

    void print()
    {
        start();

        for(int i =0; i<size; i++)
        {
            cout << "Arr["<<i<<"] " << *curr << endl;
            next();
        }
    }
  


};


int main()
{   
    
    createlist l;
    
    l.print();
    l.get(2);
    l.print();
    l.update(3,4);
   

}