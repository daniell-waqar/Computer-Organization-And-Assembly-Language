#include <iostream>
using namespace std;
struct node
{
    int info;
    node *next;
    node *prev;

};

class Doubly_Link_list
{
    private:
        node *head ,*temp, *temp1;
        int key;
        bool found;

    public:
        void insert();
        void delet();
        void print();
        Doubly_Link_list();

};
Doubly_Link_list:: Doubly_Link_list()
{
    head = temp = temp1 = NULL;
    found = false;

}

void Doubly_Link_list :: insert()
{
    if(head==NULL)
    {
        head = new node;
        cout<<"Enter the first element: ";
        cin>>head->info;
        head->prev = NULL;
        head->next = NULL;
        return;
    }

    temp = head;
    cout<<"After which number you want to insert node:";
    cin>>key;

    while(temp!=NULL)
    {
        if(temp->info==key)
        {
            temp1 = new node;
            cout<<"Enter the element: ";
            cin>>temp1->info;


            temp1->next = temp->next;
            temp1->prev = temp;
            temp->next = temp1;
            found = true;

            if(temp1->next != NULL)
            {
                temp1->next->prev = temp1;


            }
            temp = temp->next;  


        }
        temp = temp->next;

    }

    if(found == false)
    {
        cout<<key<<" not found in this doubly link list!!!"<<endl;

    }

    found = false;

}

void Doubly_Link_list :: print()
{
    if(head == NULL)
    {
        cout<<"Link list is Empty!!"<<endl;
    }

    temp = head;

    while(temp!=NULL)
    {

        cout<<temp->info<<",";
        temp = temp->next;
    }


}

void Doubly_Link_list::delet()
{
}


int main()
{

    Doubly_Link_list l;
    
    l.insert();
    l.insert();
    l.insert();
  
    l.print();
    l.delet();
}