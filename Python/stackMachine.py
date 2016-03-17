import unittest

def stackMachine(S):
    stack = []
    
    for ch in S:
        if ord(ch) in xrange(48,58): # If character is a digit in range 0-9
            stack.append(int(ch))  # Push character

        elif ch is '+' and len(stack) > 1:
        	result = stack.pop() + stack.pop()
        	stack.append(result)

        elif ch is '*' and len(stack) > 1:
        	result = stack.pop() * stack.pop()
        	stack.append(result)
        else:
        	return -1
    return stack[0] if len(stack) == 1 else -1


class TestCases(unittest.TestCase):

    def test_stackMachine_1(self):
        S = "13+62*7+*"
        self.assertEqual(stackMachine(S), 76)

    def test_stackMachine_2(self):
        S = "35+12*4*+"
        self.assertEqual(stackMachine(S), 16)

    def test_stackMachine_error1(self):
        S = "35+12*4+"
        self.assertEqual(stackMachine(S), -1)

    def test_stackMachine_error2(self):
        S = '11++'
        self.assertEqual(stackMachine(S), -1)
    def test_stackMachine_error3(self):
        S = '11+++'
        self.assertEqual(stackMachine(S), -1)

if __name__ == '__main__':
    unittest.main()
