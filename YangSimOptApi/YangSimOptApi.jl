using HTTP, JSON

function yangsimoptapi(req::HTTP.Request)
    d=String(req.body)
    println(d)
    d = JSON.parse(d)
    #timeout = pop!(d, "timeout_seconds")
    #tol = pop!(d, "tolerance")
    
    @info "Starting YangSimOpt API ..."
	error_response = Dict()
	results = Dict()
    results = d	
    println(d)

	if isempty(error_response)
    	@info "Hahaha."
    	return HTTP.Response(200, JSON.json(Dict("Jab"=>"dfa")))
	else
		@info "An error occured in the Julia code."
		return HTTP.Response(500, JSON.json(error_response))
	end
end

function health(req::HTTP.Request)
    return HTTP.Response(200, JSON.json(Dict("Julia-api"=>"healthy!")))
end

# define REST endpoints to dispatch to "service" functions
const ROUTER = HTTP.Router()

HTTP.@register(ROUTER, "POST", "/yangsimoptapi", yangsimoptapi)
HTTP.@register(ROUTER, "GET", "/health", health)
HTTP.serve(ROUTER, "0.0.0.0", 9527, reuseaddr=true)