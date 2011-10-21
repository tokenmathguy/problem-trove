class Draft
  attr_reader :questions

  def initialize()
    @questions = []
  end

  def add_question(q)
    @questions << q
  end

  def remove_question(q)
    @questions.delete(q)
  end
end
