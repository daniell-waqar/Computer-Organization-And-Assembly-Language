#include<iostream>
using namespace std;

class node
{   
    public:
    node *next;
    int data;

    public:

    node(int val)
    {
        data = val;
        next = NULL;

    }
};

class CircularLinkedList
{
   private:
   node *head;
   int length;

   public:
   CircularLinkedList();
   void insertAtHead(int);
   void insert(int , int);
   void remove();
   void print(); 
};

CircularLinkedList::CircularLinkedList()
{
  
    head = NULL;
    length = 0;

}

void CircularLinkedList::insertAtHead(int val)
{
    node *n = new node(val);
    head = n;
    head->next = head;
    length++;

}

void CircularLinkedList::insert(int val , int pos)
{   
    node *n = new node(val);
     node *curr = head;
    if(pos < 1 || pos > (length+1))
    {
        cout << "Invalid position cannot insert!";
        return;
    }
    
    else if(pos == 1)
    {
        n->next = head;
        
        while(curr->next != head)
            curr = curr->next;

        head = n;
        curr->next = head;
        length++;
       

    }
    else
    {
        for(int i =1; i<pos-1; i++)
        {
            curr = curr->next;
        }
        n->next = curr->next;
        curr->next = n;

        length++;
    }
    
  
}

void CircularLinkedList::print()
{
    node *curr = head;
    for(int i =1; i< (length + 1); i++)
    {
        cout << curr->data<<" ";
        curr = curr->next;
    }
}

void CircularLinkedList::remove()
{   
    node *curr = head;
    if(head == NULL)
    {
        cout << "List is Empty nothing to remove!";
        return;
    }

    if(length == 1)
    {
       
        head->next = NULL;
      
        delete head;
        length--;
    }

    else
    {
        node *prev = NULL;
        while(curr->next != head)
        {
            prev = curr;
            curr = curr->next;
        }
        prev->next = curr->next;
        delete curr;
        length--;
    }


}




int main()
{
    CircularLinkedList c;
    c.insertAtHead(6);
    c.insert(9,2);
    c.insert(8,3);
    c.insert(91,4);
    c.print();
    cout << endl;
    c.remove();
    c.print();

}


