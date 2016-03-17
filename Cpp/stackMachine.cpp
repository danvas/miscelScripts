//
//  main.cpp
//  CodilityTests
//
//  Created by Danvas on 2016-03-15.
//  Copyright © 2016 heylight. All rights reserved.
//

#include <iostream>
#include <stack>

int stackMachine(std::string &S) {
    std::stack<unsigned int> stack;
    
    for(char& ch : S){
        
        unsigned int ascii = (unsigned int)ch;
        
        if ((ascii >= 48) && (ascii <58)){ // If char is a digit in range 0-9
            int num = ch - '0';   // Convert char to int
            stack.push(num);
            
        } else if (ch == '+' && stack.size() > 1){
            int rhs = stack.top();
            stack.pop();
            int lhs = stack.top();
            stack.pop();
            stack.push(lhs + rhs);
            
        } else if (ch == '*' && stack.size() > 1){
            int rhs = stack.top();
            stack.pop();
            int lhs = stack.top();
            stack.pop();
            stack.push(lhs * rhs);
            
        } else {
            return -1;
        }
    }
    
    return (stack.size() == 1)? stack.top() : -1;
}

int main(int argc, const char * argv[]) {
    
    // Testing stackMachine...
    std::cout << "\nTesting stackMachine..." << std::endl;
    std::string S;
    int expected;
    
    S = "13+62*7+*";
    expected = 76;
    std::cout << S << " = " << stackMachine(S) << ((stackMachine(S) == expected)? "  PASS" : "  FAIL") << std::endl;
    
    S = "35+12*4*+";
    expected = 16;
    std::cout << S << " = " << stackMachine(S) << ((stackMachine(S) == expected)? "  PASS" : "  FAIL") << std::endl;
    
    S = "35+12*4+";
    expected = -1;
    std::cout << S << " = " << stackMachine(S) << ((stackMachine(S) == expected)? "  PASS" : "  FAIL") << std::endl;
    
    S = "11++";
    expected = -1;
    std::cout << S << " = " << stackMachine(S) << ((stackMachine(S) == expected)? "  PASS" : "  FAIL") << std::endl;
    
    
    return 0;
}
