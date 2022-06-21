
#include <iostream>
using namespace std;

class node
{
    public:
    int data;
    node *next;

    node(int val)
    {
        data = val;
        next = NULL;
    }

};

class Stack
{
    private:
        node *top,*temp;
        int size, counter;

    public:
        Stack();
      void  push(int);
      void   pop();
//      void   top();

};

Stack :: Stack()
{
    top = temp = NULL;
    counter = -1;
  
}

void Stack :: push()
{

   


    if(top==NULL)
    {   
        counter ++;
        top = new node;
        cout<<"Enter the element: ";
       
        top->next = NULL;
        counter ++;
        return;
    }
    counter++;
    temp = new node;
    cout<<"Enter the element: ";
    
    temp->next = top;
    top = temp;
    counter++;
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
    counter--;
    return;
}

int main()
{

Stack *s;

s = new Stack;

s->push(4);
s->push(3);
s->pop();

}
