local memcached = require "resty.memcached"
local memc = memcached:new()
memc:set_timeout(1000) -- 500 ms
local ok, err = memc:connect("127.0.0.1", 11311)
if not ok then
    ngx.log(ngx.ERR, "failed to connect to memcached: ", err)
    return ngx.exit(501)
end

local key = "property_" .. ngx.var[1]
local incredval, err = memc:incr(key, 1)
if not incredval then
    -- ngx.log(ngx.ERR, "failed to incr the key in memcached: ", err)
    -- return ngx.exit(502)
    incredval = 0
end

-- the connection pool capacity is set to 1024 connections
memc:set_keepalive(0, 1024)
ngx.print([[{"]], key, [[":]], incredval, [[}]])

