class Developer
attr_reader :task_list
#attr_writer :task_list

MAX_TASKS = 10

	def initialize(name)
		@name = name
		@task_list = Array.new()
	end


	def add_task(task)
		@task_list.push(task)
		puts "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@task_list.length}"
	end

	def tasks()
		
		@task_list.each_with_index{|a, i| puts "#{i + 1}. #{a}"}

				
	end

end

dev = Developer.new ("Вася")
dev
dev.add_task("Полить кактус")
dev.add_task("Полить морковку")
dev.tasks

