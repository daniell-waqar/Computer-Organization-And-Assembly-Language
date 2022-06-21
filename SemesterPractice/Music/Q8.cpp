#include <iostream>
using namespace std;

class node
{   
    public:
    node *next;
    node *prev;
    int data;

    public:

    node(int val)
    {
        data = val;
        next = NULL;
        prev = NULL;

    }
};



class Doubly_Link_list
{
    private:
    node *head;
    int length;
        

    public:
    Doubly_Link_list()
    {
        head = NULL;
        length = 0;

    }


    void insertAtHead(int val)
    {
        node *n = new node(val);
    
        head = n;
        length++;

    }

    void insert(int val)
	{

		node * n = new node(val);

		node *curr = head;
	
		while (curr->next != NULL)
		
			curr = curr->next;
		
		
		curr->next = n;
		n->prev = curr;
	}



    // void insert (int val , int pos)
    // {   
    //     node *n = new node(val);
    //     node *curr = head;
    //     if(pos < 1 || pos > (length+1))
    //     {
    //         cout << "Invalid position cannot insert!";
    //         return;
    //     }

        
    //     if(pos == 1)
    //     {   
    //         n->next = head;
    //         head->prev = n;
    //         head = n;
    //         length++;
        
    //     }

    //     else
    //     {
    //         for(int i =1; i< pos-1; i++)
    //         {
    //             curr = curr->next;
    //         }

    //         n->next = curr->next;
    //         n->prev = curr;
    //         if(curr->next != NULL)
    //             curr->next->prev = n;
    //         curr->next = n;

    //         length++;
    //     }

    // }


    void print()
    {   
        node *curr = head;
        if(head == NULL)
        {
            cout<<"Link list is Empty!!"<<endl;
        }

        
        while(curr!=NULL)
        {

            cout<<curr->data<<",";
            curr = curr->next;
        }


    }



void  mergeTwoList(Doubly_Link_list *sec)
	{   
		if (head == NULL || 
            sec == NULL || 
            sec->head == NULL || 
            head == sec->head)
		{
			//(head==null or sec.head==null)
			// That means one of linked list are empty
			// when sec ==null , that means invalid object
			// when head==sec.head, means same linked list object
			return;
		}
		else
		{
			node *obj1 = head;
			node *obj2 = sec->head;
			node *reverse = NULL;
			if (obj1->data > obj2->data)
			{
				
				head = obj2;
			}

			while (obj1 != NULL && obj2 != NULL)
			{
				if (obj1->data >= obj2->data)
				{
					// Add obj2 node in resultant list
					if (reverse != NULL)
					{
						// When resultant list not empty
						// Add new node
						reverse->next = obj2;
						// connection to previous node   
						obj2->prev = reverse;
					}
					// Get new resultant node
					reverse = obj2;
					// Visit to next node
					obj2 = obj2->next;
				}
				else
				{
					// Add obj1 node in resultant list
					if (reverse != NULL)
					{
						// When resultant list not empty
						// Add new node
						reverse->next = obj1;
						// connection to previous node
						obj1->prev = reverse;
					}
					// Get new resultant node
					reverse = obj1;
					// Visit to next node
					obj1 = obj1->next;
				}
			}
			if (obj1 != NULL)
			{
				reverse->next = obj1;
				obj1->prev = reverse;
			}
			if (obj2 != NULL)
			{
				reverse->next = obj2;
				obj2->prev = reverse;
			}
			// After change sec linked list empty
			sec->head = NULL;
		}
	}


};


int main()
{

   
    Doubly_Link_list l;
    Doubly_Link_list l1;

    l.insertAtHead(2);
    l.insert(3);
    l.insert(6);
    l.insert(8);

    l.print();
    cout << endl;

    l1.insertAtHead(2);
    l1.insert(9);
    l1.insert(3);
    l1.insert(5);

    l1.print();

    l.mergeTwoList(l1);
    l.print();






    

    cout << endl;

}
    
        




