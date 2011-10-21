require 'nokogiri'

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :solutions
  has_many :notes
  has_many :labquestions
  has_many :labs, :through => :labquestions
  has_many :difficultyquestions
  has_many :difficulties, :through => :difficultyquestions
  has_many :effectivenessquestions
  has_many :effectivenesses, :through => :effectivenessquestions

  validates_associated :user
  validates_presence_of :title, :body, :question_status
  validates_length_of :title, 
    :maximum => 256
  validates_numericality_of :question_status, 
    :only_integer => true

  DDIR = "public/data"
  QDIR = "public/data/questions"

  def self.search(s)
    if s && (s.length > 0)
      find(:all, :conditions => ['title like ?', "%#{s}%"])
    else 
      [] 
    end
  end
  
  def convert_body
    produce_latex
    produce_html
    extract_question
  end

  private

  def produce_latex
    File.open(latex_filename, "w") do |f|
      f.puts IO.read("#{DDIR}/tempheader.snip")
      f.puts body
      f.puts IO.read("#{DDIR}/tempfooter.snip")
    end
  end
  
  def produce_html
    system "hevea #{latex_filename} -o #{html_filename}"
  end

  def extract_question
    doc = Nokogiri::HTML(open(html_filename))
    b = doc.search('body').first
    b.traverse do |n|
      n.remove if ((n.comment?) || (n.name == 'hr'))
    end
    b.inner_html.strip
  end

  def latex_filename
    "#{QDIR}/q_#{id}.tex"
  end

  def html_filename
    "#{QDIR}/h_#{id}.html"
  end
end
