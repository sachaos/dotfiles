# Alias
require 'ostruct'
OST = OpenStruct

# Rails
FG = FactoryGirl
AR = ActiveRecord

Pry.config.editor = "emacsclient -t"
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'w', 'whereami'

Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
