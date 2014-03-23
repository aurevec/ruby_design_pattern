class Hero
	attr_reader :damage, :health, :skills
	attr_accessor :printer

	def initialize(printer)
		@damage = 10
		@health = 5
		@printer = printer

		@skills = [:stealth, :driving, :intimidation]
	end

	def print_stats
		if block_given?
			yield(damage, health, skills)
		else
		  printer.print(damage, health, skills)
	  end
	end
end

class HTMLprinter
  def print(damage, health, skills)
    result = header
    result += content(damage, health, skills)
    result += footer
  end

  def content(damage, health, skills)
    raise "You must implement content"
  end

  def header
  	"<html>"
  end

  def footer
    "</html>"
  end
end

class BattleStats < HTMLprinter
  def content(damage, health, skills)
  	"Damage: #{damage}\nHealth: #{health}\n"
  end
end

class SkillsStats < HTMLprinter
  def content(damage, health, skills)
  	skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
  end
end