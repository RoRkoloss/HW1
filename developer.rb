class Developer

	def initialize(name)
		@name = name
		@task_amount = 0
	end


	def add_task(task)
		puts "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@task_amount += 1}"
	end

end

dev = Developer.new ("Вася")
dev.add_task("Полить кактус")
dev.add_task("Полить морковку")

