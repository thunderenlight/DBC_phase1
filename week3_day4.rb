class Rating < ActiveRecord::Base

  belongs_to :dog

end
#ratings table has foreign key in the form of dog_id
#belongs_to method wraps the setter and getter methods his is very similar to the attr_reader, 
#attr_writer, and attr_accessor methods. Also build , create and create! comes bundled with the belongs_to
belongs_to :dog, { :class_name => "Dog", :foreign_key => :dog_id }

table1 name(id) = table2 name(table1_id) : this is table2 belongs to table1
table1 name(id) = table2 name(table1_id) : this is table1 has_many table2

has_many :ratings, { foreign_key: :judge_id }
  has_many :dogs, {foreign_key: :owner_id }
#MUST REVIEW 

