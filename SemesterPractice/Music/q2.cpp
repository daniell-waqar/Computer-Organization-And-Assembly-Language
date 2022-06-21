#include <iostream>
using namespace std;

class stack
{
    private:
    int size;
    int top;
    string *arr;
  
    public:
    stack( );
    void push(string);
    void display();
    string pop();
    string postfixEval(string postfix);
    bool isEmpty();
    bool Isoperator(string);
    bool Isoperand(string);

};
stack::stack( )
    {
        size = 5;
        arr = new string [size];
        top = -1;

    }

    string stack::pop()
    {   
        if(top == -1)
            cout << "Stack underflow!";
        else{
        string val = arr[top];
        top--;
        return val;
        }

    }


    void stack:: push(string val)
    {   
        if(top == size-1)
            cout << "Stack overflow!";
        else
        {
            top++;
            arr[top] = val;
        }
    }

    string stack::postfixEval(string postfix)
    {   
        string str;
        string infix = "";

      
        for(int i = 0; i<postfix.length(); i++)
        {
            str = postfix[i];

            // if(isdigit(str))
            // {
            //     str = str - '0';
            // }
            
            if(Isoperand(str))
            {
                push(str);

            }

            else if(Isoperator(str))
            {
                if(!isEmpty())
                {
                    string a = pop();
                    string b = pop(); 

                    string res = a+str+b;

                    push(res);               
                }
            }

        }
        infix = pop();
        return infix;
    }
    bool stack::isEmpty()
    {
        if(top == -1)
            return true;
        return false; 
    }

    bool stack::Isoperator(string str)
    {
        if(str == "+" || str == "-" || str == "*"  || str == "/" || str == "^")
        {
            return true;
        }
        return false;
    }

    bool stack::Isoperand(string str)
    {
        if(str >= "A" && str <= "Z")
            return true;
        if(str >= "a" && str <= "z")
            return true;
        if(str >= "0" && str <= "9")
            return true;
        else 
            return false;
    }


int main()
{
    stack s ;
   
    string x = s.postfixEval("ABC*+");
    cout << "Postfix to Infix: " << x << endl;
   
    
    
}