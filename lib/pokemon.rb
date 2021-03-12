class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
    end
      
    def self.find(id, db)
     d = db.execute("SELECT * FROM pokemon WHERE id = ? ", id)[0]
     self.new(id: d[0], name: d[1], type: d[2], db: db)
    end
      
    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
end
