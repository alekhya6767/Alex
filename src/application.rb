 #require './department' # Include other files in the same directory
require_relative './department'
class Application
   attr_accessor :departments
  def initialize
    self.departments=[]
    ['EEE','MECH','CSE','CIVIL'].each do |dept|
    self.departments<<Department.new(dept)
    end
    #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new dept }
  end

  def enroll(student_name, student_department)
    #This is a sample implementation. you can write your own code
    str="a"
    department = self.departments.detect { |dept| dept.get_name == student_department }
    roll = department.enroll(student_name)
    section =roll[3]
    if roll == 0
      str=""
      str=str+ "Error: Seats are not available in #{student_department}"
    else
      str=""
      str=str+"You have been enrolled to #{student_department}" 
      str=str+"\nYou have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    end
    return str
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    str="a"
    department1= self.departments.detect {|dept| dept.get_dep(student_name)!=nil}
    if department1==nil
      return "abc"
    end
    department2 = self.departments.detect {|dept| dept.get_name == student_department}
    if department2==nil
      return "abc"
    end
    roll = department2.enroll student_name
    section =roll[3]
    if roll != 0
      str=""
      department1.delete(student_name)
      str=str+"You have been enrolled to #{student_department}" 
      str=str+"\nYou have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    else
      str=""
     str=str+"Error: Seats are not available in #{student_department} "
    end
    return str
  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    str="a"
    department= self.departments.detect {|dept| dept.get_dep(student_name)!=nil}
    if department==nil
      return "abc"
    end
    if department.get_section(section)!=nil
      department.delete student_name
      roll = department.enroll1 student_name,section
      section =roll[3]
      str=""
      str=str+"You have been allotted section #{section}" 
      str=str+"\nYour roll number is #{roll}"
    else
      str=""
     str=str+"Error: Seats are not available in #{section} section"
    end
    return str
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.get_name == student_dept }
    if department==nil
      return "abc"
    end
    return department.get_dep_view
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    department= self.departments.detect {|dept| dept.get_name == student_dept}
    if department==nil
      return "abc"
    end
    return department.sect_view section
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    department= self.departments.detect {|dept| dept.get_dep(student_name)!=nil}
    if department==nil
      return "abc"
    end
    return department.stud_info student_name
  end
end