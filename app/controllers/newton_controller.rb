# frozen_string_literal: true

# Class Newton
class NewtonController < ApplicationController
  protect_from_forgery with: :null_session,
                       if: Proc.new { |c| c.request.format =~ %r{application/json} }

  def result
    render xml: find_sqrt
  end

  def find_sqrt
    a = params[:a].to_i
    
    x = (a + 1.0) / 2.0
    loop do
      break if (x * x - a) / a < 0.001
      x = (x + a/x) / 2.0
    end
    [a, x]
  end
end
