class DiceController < ApplicationController
  def start_roll
    faces = [1,2,3,4,5,6]
    @pair_of_dice = faces.product(faces)
    @roll = @pair_of_dice.sample;

    @sum = @roll.first + @roll.last

    if @sum == 7 || @sum == 11 then
      @feedback = "YOU WIN!"
      @button_label = "Start Over"
      @button_action= {:action => "index"}
    elsif @sum == 2 || @sum == 3 || @sum == 12 then
      @feedback = "YOU LOSE"
      @button_label = "Start Over"
      @button_action= {:action => "index"}
    else
      @feedback = "Your goal is now #{@sum}. Now try to get #{@sum} again before you roll a 7"
      @button_label = "Roll the dice"
      @button_action= {:action => "roll", :goal => @sum}
    end
  end

  def roll
    faces = [1,2,3,4,5,6]
    @pair_of_dice = faces.product(faces)
    @roll = @pair_of_dice.sample;
    @sum = @roll.first + @roll.last

    @goal = Integer(params[:goal])

    if @sum == @goal then
      @feedback = "YOU WIN!"
      @button_label = "Start Over"
      @button_action= {:action => "index"}
    elsif @sum == 7
      @feedback = "YOU LOSE"
      @button_label = "Start Over"
      @button_action= {:action => "index"}
    else
      @feedback = "Not yet! Keep trying"
      @button_label = "Roll the dice"
      @button_action= {:action => "roll", :goal => @goal}
    end
  end

end
