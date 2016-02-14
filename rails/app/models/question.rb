class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer



  def is_correct?(submission)
    normalize(submission) == normalize(answer)
  end

  private
    def normalize(s)
      t = s.strip.gsub(/\s+/, "\s")
      return t if /^\d+$/.match(t)

      unless t == "zero"
        tmp =  NumbersInWords.in_numbers(t)
        t = tmp == 0 ? t : tmp
      else
        t = 0
      end
      t = t.to_s.downcase
      t
    end
end
