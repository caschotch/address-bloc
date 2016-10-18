require_relative 'entry'

class AddressBook
    attr_reader :entries
    
    def initialize
       @entries = [] 
    end
    
    def add_entry(name, phone_number, email)#function does not check to see if there is a duplicate entry
        index = 0
        entries.each do |entry|
            #bloc has this as a < due to lexicographically == alphabetical order proceeding entry.name will need further explanation
            if name < entry.name
                break
            end
            index += 1
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    def remove_entry(name, phone_number, email)
        #have to have a variable to eliminate the entry
        delete_entry = nil
        #go through entries and if a match delete said entry
        entries.each do |entry|
            if name == entry.name && phone_number == entry.phone_number && email == entry.email
                delete_entry = entry
            end
        end
        entries.delete(delete_entry)

    end
end