#include<iostream>
using namespace std;

class MinHeap
{
    private:
    int *h;
    int maxSize;
    int n;

    public:

    MinHeap(int *arr , int ms , int sz)
    {
        h = arr;
        maxSize = ms;
        n = sz;

    }
    MinHeap(int arr_size)
    {
        maxSize = arr_size;
        h = new int [maxSize + 1];
        n = 0;


    }
    
    void insert(int );
    void print();

    

};

void MinHeap::insert(int x)
{
    if(n == maxSize)
    {
        cout << "Heap is Full!!" << endl;
        return;
    }
    
    n++;
    int i;

    for(i = n; i> 1; i/2)
    {
        if(x >= h[i/2]);
            break;

        h[i] = h[i/2];
    }

    h[i] = x;
}

void MinHeap::print()
{
    for(int i = 0; i<=n ; i++)
    {
        cout << h[i] <<"  ";
    }
}

int main()
{
    MinHeap h(15);
    h.insert(11);
    h.insert(14);
    h.insert(9);

    // h.insert(5);
    // h.insert(6);
    // h.insert(25);
    // h.insert(4); 
        
    // h.insert(10);
    // h.insert(12); 
    // h.insert(45);
    // h.insert(22);  
    // h.insert(15);


    cout<<"------------------------------"<<endl;
    int arr[] = {0, 65, 31, 32, 26, 21, 19, 68, 13, 24, 15, 14, 16, 5, 70, 12};
    int arr_size = sizeof(arr) / sizeof(int);

    
    cout<<"Size of array: "<<arr_size<<endl;
    MinHeap h2(arr, arr_size, arr_size-1);
    cout<<"Before heap: "<<endl;
    h2.print();


}