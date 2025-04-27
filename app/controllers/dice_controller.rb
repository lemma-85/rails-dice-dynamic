class DiceController < ApplicationController

  def homepage
    render({ :template => "dice_templates/home" })
  end

  def two_six
    render({ :template => "dice_templates/2d6" })
  end

  def two_ten
    render({ :template => "dice_templates/2d10" })
  end

  def one_twenty
    render({ :template => "dice_templates/1d20" })
  end

  def five_four
    @dice_rolls = Array.new

    5.times do
      new_roll = rand(1..4)
      @dice_rolls.push(new_roll)
    end

    render({ :template => "dice_templates/5d4" })
  end

  def flexible
    @num_dice = params.fetch("alice").to_i
    @sides_dice = params.fetch("liz").to_i

    @rolls = []

    @num_dice.times do
      die = rand(1..@sides_dice)
      @rolls.push(die)
    end

    render({ :template => "dice_templates/flexible" })
  end

end
