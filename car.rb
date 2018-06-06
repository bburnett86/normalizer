# ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin16]
require 'date'
class Car

  attr_accessor :year, :make, :model, :trim
  attr_reader :possible_makes, :possible_models, :possible_trims

  def initialize(year, make, model, trim)
    @year = year
    @make = make
    @model = model
    @trim = trim
    @possible_makes = ["Chevrolet", "Ford"]
    @possible_models = ["Impala", "Focus"]
    @possible_trims = ['ST', 'SE']
  end

  # Update year if year has a length of four, returns integer.
  def update_year
    @year = @year.to_i if (@year.length == 4 && (@year.to_i >= 1900 && DateTime.new(@year.to_i, DateTime.now.month, DateTime.now.day, 24) <= DateTime.now.next_year.next_year))
  end

  # Update make if the shortened name is spelled the same as a possible_makes index, returns reformatted string.
  def update_make
    @possible_makes.map{|make| @make = make if @make.downcase.capitalize == make[0...ma_l = @make.length]}

    return @make
  end

  # Update model and trim fields if it appears the trim field has been included in the model.
  def check_model_word_count
    @trim = @model.split[1] if @model.split.length == 2
    @model = @model.split[0] if @model.split.length == 2
  end

  # Update model if the shortened/regular name is spelled the same as a possible_models index, returns reformatted string.
  def update_model
    @possible_models.map{|model| @model = model if (@model.downcase.capitalize == model[0...@model.length])}

    return @model
  end

  # Update trim value to nil if 'blank' is present,
  def update_trim
    @trim = nil if @trim == 'blank'
    @possible_trims.map{|trim| @trim = trim if @trim && @trim.upcase == trim}

    return @trim
  end

  # Return a hash of original data and data available to be normalized
  def normalize_data
    self.update_year
    self.update_make
    self.check_model_word_count
    self.update_model
    self.update_trim
    return { :year => @year, :make => @make, :model => @model, :trim => @trim}
  end

end