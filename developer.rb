class Developer

MAX_TASKS = 10

	def initialize(name)
		@name = name
		@task_list = Array.new()
	end


	def add_task(task)
		@task_list.push(task)
		puts "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@task_list.length}"
	end

end

dev = Developer.new ("Вася")
dev.add_task("Полить кактус")
dev.add_task("Полить морковку")

