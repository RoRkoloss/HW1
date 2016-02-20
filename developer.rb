class Developer

MAX_TASKS = 10

  attr_reader :task_list
  attr_writer :task_list

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
    @task_list.each_with_index{|a, i| puts "#{i + 1}. #{a}"}
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
    when can_work?
    	puts %Q{"свободен"}
    when can_add_task?
    	puts %Q{"работаю"}
    else
    	puts %Q{"занят"}
    end
  end

  def can_add_task?
    @task_list.length < MAX_TASKS
  end

  def can_work?
    @task_list.empty?
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


# class for check homework
/class Check
sdev = SeniorDeveloper.new("Senior")
dev = Developer.new("Jun")
5.times do |i| 
	dev.add_task("Kактус")
	sdev.add_task("Морковка")
end
sdev.add_task("Полить морковку")
dev.tasks 
sdev.work!
#sdev.tasks
#jdev.work!
#jdev.tasks
#sdev.status
#jdev.status
end/