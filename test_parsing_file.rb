#Tested and Validated this works
def add_verses_to_model_from_file
f = File.open("test_verses.txt", "r")
f.each_line do |line|
  Verse.create(reference:line.chomp)
end
f.close
end

def add_information_to_join_table 
f = File.open("csv.txt", "r")
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

add_verses_to_model_from_file
add_information_to_join_table 
