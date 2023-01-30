require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join
  end

  def score
    word = params[:word]
    @include = word.split(//).all? do |letter|
      params[:letters].include?(letter)
    end

    @valid_word = openUrl(word)
  end

  def openUrl(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    json['found']
  end
end
