class Employee

  attr_reader :salary, :name, :title

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def boss=(boss)
    @boss = boss
    @boss.add_employee(self)
  end



  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end


class Manager < Employee
  attr_reader :employees, :name, :title, :salary
  def initialize(name, title, salary)
    @employees = []
    super(name,title, salary)
  end

  def add_employee(employee)
    employees << employee
  end

  def bonus(multiplier)
      bonus = total_sub_salary * multiplier
  end

  def total_sub_salary
    total = 0
    @employees.each do |employee|
      if employee.employees.empty?
        total += employee.salary
      else
        total += employee.total_sub_salary
      end
    end
    total
  end
end
ned = Manager.new("Ned","Founder",1000000)
darren = Manager.new("Darren","TA Manager",78000)
shawna = Employee.new("Shawna","TA",12000)
david = Employee.new("David","TA",10000)



p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
