class Lab < ActiveRecord::Base
  belongs_to :offering
  belongs_to :user
  has_many :comments
  has_many :labquestions
  has_many :questions, :through => :labquestions

  validates_associated :offering
  validates_presence_of :title
  validates_length_of :title, 
    :maximum => 96
  #validates_numericality_of :week, 
  #  :only_integer => true
  
  DDIR = "public/data"
  LDIR = "public/data/labs"
  
  def add_questions_from_draft(draft)
    questions << draft.questions
  end

  def gen_latex
    File.open(filename("tex"), "w") do |f|
      f.puts IO.read("#{DDIR}/labpreamble.snip")
      f.puts "\\lhead{#{offering.display_name}}"
      f.puts "\\chead{Lab}"
      f.puts "\\rhead{#{Time.new.strftime('%Y-%m-%d')}}"
      f.puts "\\begin{document}"
      f.puts "\\begin{enumerate}"
      f.puts "\\section{#{title}}"
      questions.each do |q| 
        f.puts "\\item #{q.body}"
        f.puts "\\\\\\\\\\\\\\\\\\\\*"
      end
      f.puts "\\end{enumerate}"
      f.puts "\\end{document}"
    end
  end

  def gen_pdf
    gen_latex
    system "latex --output-directory=#{LDIR} #{filename("tex")}"
    system "dvipdf -o #{filename("pdf")} #{filename("dvi")}"
  end

  def filename(ext)
    "#{LDIR}/lab_#{id}.#{ext}"
  end
end
