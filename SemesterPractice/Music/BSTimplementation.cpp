#include<iostream>
using namespace std;
class Node{
    public:
        int info;
        Node* left;
        Node* right;
        Node(int val){
            info=val;
            left= right=NULL;
        }
};

class BinarySearchTree{
    public:
	    Node* root;
	    BinarySearchTree(){
	        root=NULL;
	    }
    
    	Node* insert(Node* r, int val )
		{
			if (r==NULL)
			{
				Node* t= new Node(val);
			
			if (r==root)
			{
				root= r=t;
			}
			else
			{
				r=t;
			}
			
			return r;
			}
			else if (r->info== val){
				cout<<"Duplicate: "<<val;
				return r;
			}
			else if (val < r->info)
				r->left = insert(r->left , val );
			
			else if (val > r->info)
				r->right= insert( r->right,val);

		}	
		
		Node* searchInBST(Node* root,int val)
		{
			if(root ==NULL)
			{
				return NULL;
			}
			if(root->info==val)
			{
				return root;
			}
			
			if(root->info > val)
			{
				return searchInBST(root->left, val);
			}
			else{
				return searchInBST(root->right, val);
			}
		}
		
		Node* FindMax(Node* r)
		{
		    while(r->right!=NULL){
		        r= r->right;
		    }
		    return r;
   
		}
		
		Node* DeleteNodeInBST(Node* root, int info)
		{
		   
		    if(root==NULL)
		     return root;
		    else if (info<root->info)
		        root->left = DeleteNodeInBST(root->left, info);
		    else if (info> root->info)
		        root->right = DeleteNodeInBST(root->right, info);
		    else
		    {
		        if(root->right == NULL && root->left == NULL)
		        {
		            delete root;
		            root = NULL;  
		            return root;
		        }
		        else if(root->right == NULL)
		        {
		            Node* temp = root;
		            root= root->left;
		            delete temp;
		        }
		        else if(root->left == NULL)
		        {
		            Node* temp = root;
		            root= root->right;
		            delete temp;
		        }
		        else
		        {
		            Node* temp = FindMax(root->left);
		            root->info = temp->info;
		            root->left = DeleteNodeInBST(root->left, temp->info);
		        }
		    }
		    return root;
		}
		
		void inOrderTraversal(Node* r)
		{
		    if (r==NULL)
		      return ;
		    inOrderTraversal(r->left);
		    cout<<" "<< r->info <<" -> ";
		    inOrderTraversal(r->right);
    
		}
};

int main (){
    BinarySearchTree Tree;
    Tree.insert(Tree.root, 2);
    Tree.insert(Tree.root, 1);
    Tree.insert(Tree.root, 62);
    Tree.insert(Tree.root, 10);
    Tree.insert(Tree.root, 7);
    Tree.insert(Tree.root, 5);
    Tree.insert(Tree.root, 20);
    Tree.insert(Tree.root, 22);
    if(Tree.searchInBST(Tree.root, 1)==NULL)
	{
		cout<<"Not found!!" << endl;
	 } 
	 else
	 {
	 	cout<<"Value found!!" <<endl;
	 }
  
	Tree.DeleteNodeInBST(Tree.root, 4);
	Tree.inOrderTraversal(Tree.root);
    cout << endl;
	return 0;
}