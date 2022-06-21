#include <iostream>
using namespace std;

class node
{
    public:

    char data;
    node *next;

    node(char  val)
    {
        data = val;
        next = NULL;

    }

    
};

class list
{
    private:
    node *head;
    int length;

  public:
    list();    
    void insert(char , int);  
    void print();
   

};


list::list()
{
    head = NULL;
    length = 0;
}


void list::insert(char val , int pos)
{
    node *n1 = new node(val);

    if(pos < 1 || pos > length + 1)
    {
        cout << "Invalid position You can not add elements!" << endl;
        return;
    }

    if(pos == 1)
    {
        n1->next = head;
        head = n1;

    }

    else
    {
        node *curr = head;
        for(int i = 1; i<(pos - 1); i++)
        {
            curr = curr->next;  
        
        }

        n1->next = curr->next;
        curr->next = n1;
    }
    length++;

}

void list::reverse(node *l1, node *l2)
{
    
}



void list::print()
{
    node *curr = head;
    
    if(head == NULL)
    {
        cout<<"Link list is empty!"<< endl;
        return;

    }

    while(curr != NULL)
    {

        cout<<curr->data<<" ";
        curr = curr->next;

    }


}

int main()
{



    list l;
  
    l.insert('A',1);
    l.insert('B',2);
    l.insert('C',3);
    l.insert('D',4);
    l.insert('E',5);
    l.insert('F',6);
    l.insert('G',7);
    l.insert('H',8);
    l.insert('I',9);
    l.insert('J',10);
    l.print();

    l.reverse(head,head1);
}