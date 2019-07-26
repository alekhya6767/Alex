class Department
    attr_accessor :section, :name, :students, :rolls, :number, :sectA, :sectB, :sectC, :sect1, :sect2, :sect3
    def initialize(dept)
        self.name=dept
        self.section={'A'=>10,'B'=>10,'C'=>10}
        self.sectA=[]
        self.sectB=[]
        self.sectC=[]
        self.sect1=[]
        self.sect2=[]
        self.sect3=[]
        self.students=[]
        self.number=30
        self.rolls=[]
    end
    def get_name
        return self.name
    end

    def get_section(section)
        if self.section[section]!=nil
            return self.section[section]
        else
            return nil
        end
    end

    def stud_info(student_name)
        str=""
        self.sectA.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.name} - Section #{self.sect1[i][3]} - #{self.sect1[i]}"
            end
        end
        self.sectB.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.name} - Section #{self.sect1[i][3]} - #{self.sect2[i]}"
            end
        end
        self.sectC.each_with_index do |stud,i|
            if stud == student_name
                str=str+"#{student_name} - #{self.name} - Section #{self.sect3[i][3]} - #{self.sect3[i]}"
            end
        end
        return str
    end

    def get_dep(student_name)
        x=0
        self.students.each do |stud|
            if stud == student_name
                x=x+1
            end
        end
        if x>0
            return self.name
        else
            return nil
        end     
    end

    def get_dep_view
        str="List of students:"
             self.students.each_index do |i|
                str=str+"\n#{self.students[i]} - #{self.rolls[i]}"
             end
        return str
    end

    def sect_view(section)
        str="List of students:"
        if section=='A'
            self.sectA.each_index do |i|
                str=str+"\n#{self.sectA[i]} - #{self.sect1[i]}"
            end
        elsif section=='B'
            self.sectB.each_index do |i|
                str=str+"\n#{self.sectB[i]} - #{self.sect2[i]}"
            end
        else
            self.sectC.each_index do |i|
                str=str+"\n#{self.sectC[i]} - #{self.sect3[i]}"
            end
        end
        return str
    end

    def delete(student_name)
        self.students.each_with_index do |stud,i|
            if stud == student_name
                self.students.delete(student_name)
                self.number=self.number+1
                self.students.sort!
                self.rolls.delete_at(i)
            end
        end
        self.sectA.each_with_index do |stud,i|
            if stud==student_name
                self.sectA.delete(student_name)
                self.sect1.delete_at(i)
                self.sectA.sort!
                self.section['A']=self.section['A']+1
            end
        end
        self.sectB.each_with_index do |stud,i|
            if stud==student_name
                self.sectB.delete(student_name)
                self.sect1.delete_at(i)
                self.sectB.sort!
                self.section['B']=self.section['B']+1
            end
        end
        self.sectC.each_with_index do |stud,i|
            if stud==student_name
                self.sectC.delete(student_name)
                self.sect1.delete_at(i)
                self.sectC.sort!
                self.section['C']=self.section['C']+1
            end
        end
    end

    def enroll(student_name)
        if self.section['A'] >=1
            number=10-self.section['A']+1
            if section['A']==1
                number=self.name[0..2]+'A'+number.to_s
            else
                number=self.name[0..2]+'A0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectA[10-self.section['A']]=student_name
            self.sect1[10-self.section['A']]=number
            self.sectA.sort!
            self.students.sort!
            self.section['A']=self.section['A']-1
            self.number=self.number-1
        elsif self.section['B'] >=1
            number=10-self.section['B']+1
            if section['B']==1
                number=self.name[0..2]+'B'+number.to_s
            else
                number=self.name[0..2]+'B0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectB[10-self.section['B']]=student_name
            self.sect2[10-self.section['B']]=number
            self.sectB.sort!
            self.students.sort!
            self.section['B']=self.section['B']-1
            self.number=self.number-1
        elsif self.section['C']>=1
            number=10-self.section['C']+1
            if section['C']==1
                number=self.name[0..2]+'C'+number.to_s
            else
                number=self.name[0..2]+'C0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectC[10-self.section['C']]=student_name
            self.sect3[10-self.section['C']]=number
            self.sectC.sort!
            self.students.sort!
            self.section['C']=self.section['C']-1
            self.number=self.number-1
        else
            number=0
        end
        return number
    end
    def enroll1(student_name,section)
        if  section=='A'
            number=10-self.section['A']+1
            if section['A']==1
                number=self.name[0..2]+'A'+number.to_s
            else
                number=self.name[0..2]+'A0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectA[10-self.section['A']]=student_name
            self.sect1[10-self.section['A']]=number
            self.sectA.sort!
            self.students.sort!
            self.section['A']=self.section['A']-1
            self.number=self.number-1
        elsif section=='B'
            number=10-self.section['B']+1
            if section['B']==1
                number=self.name[0..2]+'B'+number.to_s
            else
                number=self.name[0..2]+'B0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectB[10-self.section['B']]=student_name
            self.sect2[10-self.section['B']]=number
            self.sectB.sort!
            self.students.sort!
            self.section['B']=self.section['B']-1
            self.number=self.number-1
        elsif section=='C'
            number=10-self.section['C']+1
            if section['C']==1
                number=self.name[0..2]+'C'+number.to_s
            else
                number=self.name[0..2]+'C0'+number.to_s
            end
            self.students[30-self.number]=student_name
            self.rolls[30-self.number]=number
            self.sectC[10-self.section['C']]=student_name
            self.sect3[10-self.section['C']]=number
            self.sectC.sort!
            self.students.sort!
            self.section['C']=self.section['C']-1
            self.number=self.number-1
        else
            number=0
        end
        return number
    end
end