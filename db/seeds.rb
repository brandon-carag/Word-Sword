# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_basic_categories
  categories=['Anger','Lust','Fear','Depression','Anxiety']
  categories.each do |category|
    Category.create(name:category)
  end
end


def add_verses_to_model_from_file
f = File.open("seed_file.txt", "r")
f.each_line do |line|
  #The next line checks for duplicates
  Verse.create(reference:line.chomp.split(',', 2).first) unless Verse.find_by(reference:line.chomp.split(',', 2).first)
end
f.close
end


def add_information_to_join_table 
#MAKE SURE YOU VALIDATE WHETHER THE CATEGORIES EXIST
f = File.open("seed_file.txt", "r")
f.each_line do |line|
  line.chomp!
  ref=line.split(',', 2).first
  categ=line.split(',', 2).last
  vers_obj=Verse.find_by(reference:ref)
  cat_obj=Category.find_by(name:categ)
  vers_id=vers_obj.id
  cat_id=cat_obj.id
  #GOOD TO THIS POINT
  # vers_id=Verse.find_by(reference:ref).id
  # cat_id=Category.find_by(name:cat).id
  VerseCategory.create(verse_id:vers_id,category_id:cat_id)
end
f.close

end

def print_input_file_lines 
f = File.open("seed_file.txt", "r")
f.each_line do |line|
  line.chomp!
  puts line
end
f.close
end

def delete_all_data
  arr=[Verse,Category,VerseCategory]
  arr.each{|arr_element|arr_element.delete_all}
end

create_basic_categories
add_verses_to_model_from_file
add_information_to_join_table 

