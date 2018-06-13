class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end


  # SAVING######################
  def self.save(name, type, db)
    sql_string = <<-SQL_STRING
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL_STRING
    db.execute(sql_string, name, type)

  end
  # FIND########################

  def self.find(id, db)
    sql_string = <<-SQL_STRING
      SELECT *
      FROM pokemon
      WHERE id IS ?
    SQL_STRING
    array_var = db.execute(sql_string, id).flatten
    # p array_var
    hash = {"name" => array_var[1], "type" => array_var[2], "db" => db,"hp" =>array_var[3], "id" => array_var[0]}
    # p hash
    Pokemon.new(hash)
  end

  def alter_hp(new_hp, db)
    sql_string = <<-SQL_STRING
    UPDATE pokemon
      SET hp = ?
      WHERE id = ?;
    SQL_STRING
    array = db.execute(sql_string, new_hp, self.id).flatten
    p array

  end





  # UPDATING







  # REMOVING

end
