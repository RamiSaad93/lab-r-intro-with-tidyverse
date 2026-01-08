library(tidyverse)

employees <- data.frame(
  ID = 1:6,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank"),
  Age = c(25, 30, 35, 40, 45, 50),
  Department = c("HR", "IT", "Finance", "IT", "HR", "Finance"),
  Salary = c(50000, 60000, 70000, 80000, 55000, 75000)
)

# Task 1

View(employees)
str(employees)
summary(employees)

# Task 2

# 1. Filter IT department employees
it_employees <- employees %>% filter(Department == "IT")
it_employees

# 2. Select only Name and Salary
name_salary <- employees %>% select(Name, Salary)
name_salary

# 3. Add Bonus column (10% of salary)
employees_bonus <- employees %>% mutate(Bonus = Salary * 0.10)
employees_bonus

# 4. Sort by Salary descending
employees_sorted <- employees %>% arrange(desc(Salary))
employees_sorted 

# 5. Average salary per department
avg_salary <- employees %>% 
  group_by(Department) %>% 
  summarise(avg_salary = mean(Salary))

# Extra 1 — Total salary per department
total_salary <- employees %>%
  group_by(Department) %>%
  summarise(total_salary = sum(Salary))
total_salary

experienced <- employees %>%
  filter(Age > 30) %>%
  mutate(Experience = Age - 25)
experienced

# Extra 2 — HR employees, bonus, sorted by bonus
hr_bonus <- employees %>%
  filter(Department == "HR") %>%
  mutate(Bonus = Salary * 0.10) %>%
  arrange(desc(Bonus))
hr_bonus
