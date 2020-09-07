class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    puts "#{id}#{". "}#{display_status} #{todo_text} #{display_date}"
  end

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
  end
  def self.duelater
    where("due_date > ?", Date.today)
  end
  def self.duetoday
    where("due_date = ?", Date.today)
  end
  def self.completed
    all.where(completed: true)
  end
  def self.notcompleted
    all.where(completed: false)
  end
  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n"
    puts "Due Today\n"
    puts duetoday.map { |todo| todo.to_displayable_string }
    puts "\n"
    puts "Due Later\n"
    puts duelater.map { |todo| todo.to_displayable_string }
  end
  def self.add_task(todo_hash)
    return(Todo.create!(todo_text: todo_hash[:todo_text], due_date: todo_hash[:due_in_days], completed: false))
  end
  def self.mark_as_complete!(todo_id)
    todo_item = Todo.find(todo_id)
    todo_item.completed = true
    todo_item.save
    return todo_item
  end
end
