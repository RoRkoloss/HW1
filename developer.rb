class Developer
attr_reader :task_list
#attr_writer :task_list

MAX_TASKS = 10

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


  def tasks()	
    @task_list.each_with_index{|a, i| puts "#{i + 1}. #{a}"}
  end


  def work!
  	if @task_list.empty?	
  	  raise("Нечего делать!") 	
  	end
  	puts %Q{#{@name}: выполнена задача "#{@task_list.shift}". Осталось задач: #{task_list.length}}
  end

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

dev = Developer.new ("Вася")
dev
/5.times do |i| 
	dev.add_task("Полить кактус")
end/
#dev.add_task("Полить морковку")
dev.tasks 
#dev.work!
#dev.tasks
#dev.work!
dev.status
