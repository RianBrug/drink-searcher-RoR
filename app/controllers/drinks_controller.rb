class DrinksController < ApplicationController
  def index
    @drinks = filter(params["search"])
  end

  def filter(query)
   if params["extra_cold"]
     return Drink.where(temperature: "extra_cold")
   end
   if params["distilled"]
     return Drink.where(distilled: true)
   end
    return Drink.all unless query.present?
    Drink.where('lower(name) = ?', "%#{query.downcase}%").or(Drink.where("lower(name) LIKE ?", "%#{query.downcase}%"))
  end

  def distilleds(query)
    return Drink.all unless query.present?
    Drink.where(query.downcase)
  end

end
