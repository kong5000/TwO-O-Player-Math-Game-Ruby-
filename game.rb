class Game
  attr_reader :players
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @first_round = true
  end

  def ask_question
    number1 = rand(20) + 1
    number2 = rand(20) + 1
    puts "#{@current_player.name}: what is #{number1} plus #{number2}?"
    answer = gets.chomp.to_i
    return answer == number1 + number2
  end

  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play_round
    if !@first_round
      puts "----- NEW TURN -----"
    end

    if @first_round
      @first_round = false
    end

    if self.ask_question == false
      @current_player.lose_life
      puts "#{@current_player.name}: wrong answer!"
    else
      puts "#{@current_player.name}: you are correct!"
    end
    self.change_player
    puts "P1: #{@player1.lives}/3 vs P1: #{@player2.lives}/3"
    if self.game_over
      if @player1.is_alive
        puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      else
        puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      end
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end

  def game_over
    !@player1.is_alive || !@player2.is_alive
  end
end 