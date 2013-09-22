class TravelGroup < ActiveRecord::Base
  #TODO: Either create a groupe token or invitation to group
  has_and_belongs_to_many :users
  has_many :suggestions
  has_many :excursions, through: :suggestions

  before_save :generate_name
  geocoded_by :destination
  after_validation :geocode
  before_create :generate_code
  after_create :find_excursions


  private

    def generate_name
      self.name ||= self.users.first.first_name + " " + self.destination
    end

    def find_excursions
      r = HTTParty.get("https://dev.xola.com/api/experiences\?geo=#{self.latitude},#{self.longitude}")
      json = JSON.parse(r.body)
      p '*' * 1000
      p json["data"].first
    end

    def generate_code
      self.group_code = SecureRandom.hex(3).downcase
    end

end
