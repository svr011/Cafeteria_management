class Menuitem < ActiveRecord::Base
  def self.selected
    all.where(selected: true)
  end
  def self.notcompleted
    all.where(completed: false)
  end
end
