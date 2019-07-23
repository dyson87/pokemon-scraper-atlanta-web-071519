class Pokemon
attr_accessor :name, :id, :type, :db, :hp

    def initialize(props={}, hp=nil)
        @id = props[:id]
        @name = props[:name]
        @type = props[:type]
        @db = props[:db]
        @hp = hp
    end
    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES(\"#{name}\", \"#{type}\")"
        db.execute(sql)
    end
    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        name = pokemon[1]
        type = pokemon[2]
        hp = pokemon[3]
        pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
    end
    def alter_hp(new_hp,db)
        db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = self.id")
    end
end
