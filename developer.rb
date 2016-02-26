class Developer

MAX_TASKS = 10

  attr_reader :task_list

  def initialize(name)
    @name = name
    @task_list = Array.new()
  end


  def add_task(task)
  	if @task_list.length == MAX_TASKS	
  	  raise("Слишком много работы!") 	
  	end
    @task_list.push(task)
    puts %Q{#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@task_list.length}}
  end

# prints the list of tasks 
  def tasks()	
    @task_list.map.with_index {|task, num| %Q(#{num+1}."#{task}")}
  end

# prints and deletes work
  def work!
  	if @task_list.empty?	
  	  raise("Нечего делать!") 	
  	end
  	puts %Q{#{@name}: выполнена задача "#{@task_list.shift}". Осталось задач: #{task_list.length}}
  end

# checks possibility to work
  def status
  	case 
    when !can_work?
    	puts %Q{свободен}
    when can_add_task?
    	puts %Q{работаю}
    else
    	puts %Q{занят}
    end
  end

  def can_add_task?
    @task_list.length < self.class::MAX_TASKS
  end

  def can_work?
    !@task_list.empty?
  end

end

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def add_task(task)
  	if @task_list.length == MAX_TASKS	
  	  raise("Слишком много работы!")
    elsif task.length > 20
      raise("Слишком сложно!")
    end
      @task_list.push(task)
      puts %Q{#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@task_list.length}} 
  end

# prints and deletes work
def work!
  	if @task_list.empty?	
  	  raise("Нечего делать!") 	
  	end
  	puts %Q{#{@name}: пытаюсь делать задачу "#{@task_list.shift}". Осталось задач: #{task_list.length}}
  end

end

class SeniorDeveloper < Developer
  
MAX_TASKS = 15

  def add_task(task)
  	if @task_list.length == MAX_TASKS	
  	  raise("Слишком много работы!")
  	end
    @task_list.push(task)
    puts %Q{#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@task_list.length}}
  end

# makes a choise
  def work!
    case Random.rand < 0.5
      when true
      	several_tasks
      else
      	puts 'Что-то лень'
    end	
  end

# does several tasks
  def several_tasks
  	if @task_list.empty?	
  	  raise("Нечего делать!") 	
  	end
  	  puts %Q{#{@name}: выполнена задача "#{@task_list.shift}". Осталось задач: #{task_list.length}}
  	unless @task_list.empty?
  	  puts %Q{#{@name}: выполнена задача "#{@task_list.shift}". Осталось задач: #{task_list.length}}	
  	end
  end

end

class Team
  attr_reader :seniors
  attr_reader :developers
  attr_reader :juniors
  
  def initialize(&block)
    instance_eval &block
  end

  private
  def have_juniors(*names)
  	@developers = names
  end
  
  private
  def have_seniors(*names)
    @seniors = names
  end
  
  private
  def have_developers(*names)
  	@developers = names
  end
end

# Мы хотим, чтобы работал вот такой код (упрощённый вариант домашки)
# А значит:
# * метод Team#initialize должен принимать блок
# * этот блок должен выполняться в контексте самого объекта,
# * ...создавая в нём senior programmers
# * ...поэтому в initialize мы используем instance_eval
=begin s = Team.new{
  have_seniors 'Вася', 'Маша'
}

d = Team.new {
  have_developers 'Олеся','Василий', 'Игорь-Богдан'
}

j = Team.new {
  have_juniors 'Коля','Паша', 'Максим'
}
end

p s.seniors
p d.developers
p j.developers
=end

# class for check homework
begin 
class Check
jdev = JuniorDeveloper.new("Junior")

3.times do |i| 
jdev.add_task("Kактус")
	#sdev.add_task("Морковка")
end
#jdev.add_task("Полить морковку ")
#puts dev.tasks 
jdev.can_work?
#sdev.work!
#puts sdev.tasks
#jdev.work!
#jdev.tasks
#sdev.status
p jdev.status
p jdev.can_add_task?
end
end
