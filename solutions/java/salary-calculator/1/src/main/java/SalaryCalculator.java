public class SalaryCalculator {
    public double salaryMultiplier(int daysSkipped) {
        double mult = (daysSkipped >= 5) ? 0.85 : 1.0;
        return mult;
    }

    public int bonusMultiplier(int productsSold) {
        return (productsSold >= 20) ? 13 : 10;
    }

    public double bonusForProductsSold(int productsSold) {
        int payPer = bonusMultiplier(productsSold);
        return (double) productsSold * payPer;
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        double bonus = bonusForProductsSold(productsSold);
        double mult = salaryMultiplier(daysSkipped);
        double salary = (1000.0 + bonus) * mult;
        return (salary > 2000.0) ? 2000.0 : salary;
    } 
}
