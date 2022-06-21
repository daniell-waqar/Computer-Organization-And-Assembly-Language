#include <iostream>
using namespace std;

class node
{
    public:
    int data;
    node *next;

};

class Stack
{
    private:
        node *top,*temp;
        int size, lenght;

    public:
        Stack();
      void  push();
      void   pop();
      bool isEmpty();
      node *peak();
      void display();
      void isFull();


};

Stack :: Stack()
{
    top = temp = NULL;
    lenght = 0;
    cout<<"Enter the size for the nodes: ";
    cin>>size;

}
   
void Stack :: push()
{   
    isFull();
    
    if(top==NULL)
    {
        top = new node;
        cout<<"Enter the element: ";
        cin>>top->data;
        top->next = NULL;
        lenght ++;
        return;
    }

    temp = new node;
    cout<<"Enter the element: ";
    cin>>temp->data;
    temp->next = top;
    top = temp;
    lenght++;
    return;

}

void Stack :: pop()
{
    if(top==NULL)
    {

        cout<<"Stack is Empty!!"<<endl;
        return;
    }

    temp = top;
    top  = top->next;
    delete temp;
    temp = NULL;
    lenght--;
    return;
}


bool Stack::isEmpty()
{
    if(lenght == 0)
        return true;
    return false;
}

node *Stack::peak()
{
    return top;
}

void Stack::isFull()
{
    if(lenght == size)
    {
        cout << "Stack overflow!"<< endl;
        return;
    }
}

void Stack::display()
{
    for(int i =1; i<lenght; i++)
    {
        cout << top->data << " ";
        top = top->next;
    }
}

int main()
{

    Stack s;


    s.push();
    s.push();
    s.push();
    s.display();

    cout << endl;
    
    s.pop();
    s.display();

}