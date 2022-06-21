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

class list
{
    private:
    node *head;
    int length;

  public:
    list();     //Constructor to initialize the pointer & variable length
    void insert(int , int);  
    void remove(int);    //this function will delete the node at given position
    void print();
    bool search(int);    //this function will return true if given value is present in link list
    bool empty();
    void swapping_node(int , int);  //funcction for swapping two nodes

   
};

list::list()
{
    head = NULL;
    length = 0;
}

void list::insert(int val , int pos)
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

void list::remove(int pos)
{   
    
    node *curr = head;
    if (head == NULL)
    {
        cout << "No Data for Remove" << endl;
    }   
    
    else if(pos > length || pos < 1)
    {
        cout << "Position does not exist you can not delete element: " << endl;
    }
    else if(pos == 1)
    {
        head = head->next;
        delete curr;
    }
    else
    {
        node  *prev = NULL;
        for(int i = 1; i<pos; i++)
        {
            prev = curr;
            curr = curr->next;
        }

        prev->next = curr->next;
        delete curr;
    }
    length--;
}

void list::print()
{
    node *curr = head;
    
    if(head == NULL)
    {
        cout<<"Link list is empty from print function "<< endl;
        return;

    }

    while(curr != NULL)
    {

        cout<<curr->data<<" ";
        curr = curr->next;

    }


}

bool list::search(int val)
{
    node *curr = head;
    while(curr != NULL)
    {
        if(curr->data == val)
        {
            cout << val << " is presnet in Linked list " << endl;
            return true;
        }

          

        curr = curr->next;
    }
    cout << val << " is not presnet in Linked list " << endl;
    return false;
}

bool list::empty()
{
    if(head == NULL)
    {
        cout << "Linked list is empty from empty function" << endl;
        return true;
    }
    else
        return false;
        
        
}


void list ::swapping_node(int pos1,int pos2)
{
	node *curr = head;
	node *pre1,*pre2,*curr1=curr,*curr2=curr;
	
	if(pos1==pos2)
		return;
		
	if(pos1>length || pos1==0)
		return;
		
	if(pos2>length || pos2==0)
		return;
		
	while(curr1 && curr1->data!=pos1)
	{
		pre1=curr1;
		curr1=curr1->next;
	}
	
	while(curr2 && curr2->data!=pos2)
	{
		pre2=curr2;
		curr2=curr2->next;
	}
	
	
	if(pre1!=NULL)
	{
		pre1->next=curr2;
	}
	else
		head=curr2;
		
	if(pre2!=NULL)
	{
		pre2->next=curr1;
	}
	else
		head=curr1;

	node* s=curr1->next;
	curr1->next=curr2->next;
	curr2->next=s;

}


int main()
{



    list l;
  
    l.insert(3,1);
    l.insert(4,2);
    l.print();

    cout << endl;

    l.remove(2);  //by position
    l.print();

    cout << endl;

    l.search(4);
    cout << endl;

    l.empty();

    l.swapping_node(1,2);
    l.print();
    cout << endl;
    



 
}

    