class CalculatorConundrum {
    public String calculate(int operand1, int operand2, String operation) {
        if (operation == null) {
        throw new IllegalArgumentException("Operation cannot be null");
        }
        if (operation.isEmpty()) {
            throw new IllegalArgumentException("Operation cannot be empty");
        }
        if (!operation.equals("+") && !operation.equals("*") && !operation.equals("/")) {
            throw new IllegalOperationException("Operation '" + operation + "' does not exist");
        }

        if (operation == "+") {
            return operand1 + " + " + operand2 + " = " + (operand1 + operand2);
        } else if (operation == "*") {
            return operand1 + " * " + operand2 + " = " + (operand1 * operand2);
        }
        
        try {
            return operand1 + " / " + operand2 + " = " + (operand1 / operand2);
        } catch (ArithmeticException e) {
            throw new IllegalOperationException("Division by zero is not allowed", e);
        }
    }
}
