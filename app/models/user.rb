class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def house_rep
    legislators.select { |legislator| legislator.chamber == "house" }[0]
  end

  def senator1
    legislators.select { |legislator| legislator.chamber == "senate" }[0]
  end

  def senator2
    legislators.select { |legislator| legislator.chamber == "house" }[1]
  end

  private

  def legislators
    Congress.legislators_locate(zip)["results"]
  end
end
