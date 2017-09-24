#1
def pet_shop_name(section)
  return section[:name]
end

#2
def total_cash(section)
  return section[:admin][:total_cash]
end

#3&4
def add_or_remove_cash(section, amount)
  section[:admin][:total_cash] += amount
end

#5
def pets_sold(section)
  return section[:admin][:pets_sold]
end

#6
def increase_pets_sold(section, number)
  section[:admin][:pets_sold] += number
end

#7
def stock_count(section)
  return section[:pets].length()
end

#8&9
def pets_by_breed(section, breed_name)
  pet_array = []
  for pet in section[:pets]
    if pet[:breed] == breed_name
      pet_array << pet
    end
  end
  return pet_array
end
#Made mistake of using counter to begin with. Should make sure that I
#check the assert_equal properly.

#10&11
def find_pet_by_name(section, name)
  for pet in section[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

#12
def remove_pet_by_name(section, name)
  section[:pets].delete(find_pet_by_name(section, name))
  # for pet in section[:pets]
  #   if pet[:name] == name
  #     section[:pets].delete(pet)
  #   end
  # end
end

#13
def add_pet_to_stock(section, new_pet)
  section[:pets] << new_pet
end

#14
def customer_pet_count(customer)
  return customer[:pets].length
end

#15
def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end


##################OPTIONAL####################

#Op1&2
def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end
# >= returns boolean.

#Op3&4&5
#We want to sell a pet to a customer and update the database
def sell_pet_to_customer(section, pet_name, customer)
  unless pet_name == nil || customer_can_afford_pet(customer, pet_name) == false
    add_pet_to_customer(customer, pet_name)
    increase_pets_sold(section, 1)
    add_or_remove_cash(section, pet_name[:price])
  # for pet in section[:pets]
    # if pet[:name] == pet_name[:name]
      # find_pet_by_name(section, name)
      # customer[:pets].push(pet[:name])
      # section[:admin][:pets_sold] += 1
      # section[:admin][:total_cash] += pet[:price]
  end
end
