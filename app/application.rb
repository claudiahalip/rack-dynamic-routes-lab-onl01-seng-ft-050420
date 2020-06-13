require 'pry'
class Application 
  
  @@items = []
  
  def call(env) 
    resp = Rack::Response.new 
    req = Rack::Request.new(env) 
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      resp.write item_price
      
    else 
      resp.write "Route not found"       
      resp.status = 404
    end 
  end 
    
    def item_price(item_name)
      if @@items.include?(item_name)
        return item_name.price
      else 
        return "Item not found"
        resp.status = 400
      end 
      
    end 
     
    
  end 
  
  
  
end 