# Question 2: 
# Write a program to calculate grades for students in a classroom. Your program should read a
# CSV that contains the student’s name, student id, assignment name, and numeric score on the
# assignment, and output a list of student names and a letter grade based on the average
# assignment score. If a student does not have an entry for an assignment, they should receive a
# score of 0 for that assignment. All scores will be integers between 0 and 100, and assignments
# are named “Assignment 1”, “Assignment 2”, etc... The grading scale for the class is as follows

# 90 - 100: A
# 80 - 89: B
# 70 - 79: C
# 55 - 69: D
# < 55: F

# Given the follow CSV file:
# Sally Student,S001,Assignment 1,95
# Johnny Readerman,S002,Assignment 1,71
# Tony Thinkerson,S003,Assignment 1,88
# Johnny Readerman,S002,Assignment 2,90
# Sally Student,S001,Assignment 2,100
# Tony Thinkerson,S003,Assignment 2,57
# Sally Student,S001,Assignment 3,85
# Tony Thinkerson,S003,Assignment 3,80

# The output should be:

# Sally Student A
# Johnny Readerman F
# Tony Thinkerson C

### SOLUTION: 

require 'csv'

# convert CSV into array of arrays
raw_data = CSV.parse("Sally Student,S001,Assignment 1,95\nJohnny Readerman,S002,Assignment 1,71\nTony Thinkerson,S003,Assignment 1,88\nJohnny Readerman,S002,Assignment 2,90\nSally Student,S001,Assignment 2,100\nTony Thinkerson,S003,Assignment 2,57\nSally Student,S001,Assignment 3,85\nTony Thinkerson,S003,Assignment 3,80")

students = {} # {Sally: {grades: [95, 100, 85], average_grade: 93, letter_grade: "A"}}

# assign each student to have an empty hash of data and start tracking their grades
raw_data.each do |data|

  if students[data[0]] == nil
    students[data[0]] = {"grades" => [], "average_grade" => nil, "letter_grade" => nil}
  end

  if students[data[0]] != nil
    students[data[0]]["grades"] << data[3].to_i
  end
  
end

# check for the average number of assignments 
average = []
students.each do |student|
  average << student[1]["grades"].length
end
average_number_of_assignments = ((average.sum / 3.to_f) + 0.9).floor

# check if any students are missing assignments (if they are, add 0's for each missing assignment) and get their average grade
students.each do |student|
  if student[1]["grades"].length < average_number_of_assignments
    (average_number_of_assignments - student[1]["grades"].length).times do 
      student[1]["grades"] << 0
    end
  end
  student[1]["average_grade"] = student[1]["grades"].sum / student[1]["grades"].length
end

# convert the average grade into a letter grade
students.each do |student|
  if student[1]["average_grade"] >= 90 
    student[1]["letter_grade"] = "A"
  elsif student[1]["average_grade"] >= 80 
    student[1]["letter_grade"] = "B"
  elsif student[1]["average_grade"] >= 70 
    student[1]["letter_grade"] = "C"
  elsif student[1]["average_grade"] >= 55 
    student[1]["letter_grade"] = "D"
  else
    student[1]["letter_grade"] = "F"
  end
end

# uncomment to see all the data
pp students

students.each do |student,data|
  puts "#{student} #{data["letter_grade"]}"
end