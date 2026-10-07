def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def power(a, b):
    return a ** b

if __name__ == "__main__":
    print("Calculator Application")
    print("----------------------")
    print("Available operations: +, -, *, /, **")
    print("Type 'q' or 'quit' to exit.")
    
    while True:
        try:
            expr = input("\nEnter calculation (e.g., 10 + 5): ")
            if expr.lower() in ('q', 'quit'):
                print("Goodbye!")
                break
            
            parts = expr.split()
            if len(parts) != 3:
                print("Invalid format. Please use: number operation number (e.g., 10 + 5)")
                continue
                
            a, op, b = float(parts[0]), parts[1], float(parts[2])
            
            if op == '+':
                print(f"Result: {add(a, b)}")
            elif op == '-':
                print(f"Result: {subtract(a, b)}")
            elif op == '*':
                print(f"Result: {multiply(a, b)}")
            elif op == '/':
                print(f"Result: {divide(a, b)}")
            elif op == '**' or op == '^':
                print(f"Result: {power(a, b)}")
            else:
                print(f"Unknown operation: {op}")
        except ValueError as e:
            print(f"Error: {e}")
        except Exception as e:
            print(f"Unexpected error: {e}")
