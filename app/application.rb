class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/items/)
            item_search = req.path.split("/items/").last
            if item_in_list = @@items.find{|item| item.name == item_search}
                resp.write "#{item_in_list.price}\n"
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
    
end # end Application class