class Developer

MAX_TASKS = 10

  attr_reader :task_list
  attr_reader :name

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

  def dev_type
  	:developers
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

  def dev_type
    :juniors
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

  def dev_type
  	:seniors
  end

end

class Team
=begin
  attr_reader :seniors
  attr_reader :juniors
  attr_reader :developers
  attr_reader :priotity
  attr_reader :dev
  attr_writer :dev
 
=end
  require 'pp' 

  def initialize(&block)
    @team_dev = []
    @developers = []
    @juniors = []
    @seniors = []
    @massages = {}
    instance_eval &block
  end
  
  def all
    @team_dev
  end

  def seniors
  	@seniors
  end

  def developers
  	@developers
  end

  def juniors
  	@juniors
  end

  #on_task = {+++++++++++++++++++++++++++++++++++++++++++++
  #  junior: 
  #  developer: ,
  #  senior: '#%s сделает %s, но просит больше с такими глупостями не приставать!'
 # }
  
  def add_task(task)	
    
    dev = @team_dev.sort_by{|dev| [dev.task_list.size, @priority.index(dev.dev_type)]}.first
    dev.add_task(task)
    if @massages.has_key?(cut(dev)) 
       @massages[cut(dev)].call(dev, task)
       #puts dev.name
    end	
  end

  def on_task(type, &block)
    @massages[type] = block
  end
  
=begin
  def print
   	@massages.each{|key, mass| puts "#{key}: #{mass}"}
  end
=end

private
  def have_seniors(*names)
    @seniors = names
    @seniors.each{|name| @team_dev.push(make_developer(SeniorDeveloper, name))}
  end

  
  def have_developers(*names)
    @developers = names
    @developers.each{|name| @team_dev.push(make_developer(Developer, name))}
  end

  
  def have_juniors(*names)
  	@juniors = names
    @juniors.each{|name| @team_dev.push(make_developer(JuniorDeveloper, name))}
  end

  
  def priority(*level)
    @priority = level
  end
  
  
  def make_developer(type, name)
    type.new(name)
  end

  def cut (dev)
    dev.dev_type.to_s.chop.to_sym
  end

end




team = Team.new do

  have_seniors 'S1-1', 'S2-2', 'S3-3' 
  have_developers 'D1-1', 'D2-2'
  have_juniors 'J1-1','J2-2', 'J3-3'
  

  priority :juniors, :seniors, :developers

end

team.on_task (:junior) do |dev, task|
  puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
end

team.on_task (:developer) do |dev, task|
  puts "Девелопер #{dev.name} крутит носом, но задачу #{task} сделает!"
end

team.on_task (:senior) do |dev, task|  
  puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать!"
end

10.times do
team.add_task('Покормить кота')
end

#team.print