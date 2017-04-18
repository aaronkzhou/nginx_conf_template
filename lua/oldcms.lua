--local subdomain =  arg[1]
local subdomain =  ngx.var.subdomain
--ngx.print("\nsubdomain:"..subdomain.."\n")
local DocumentRoot = ""
local InitDocumentRoot = "/data/www/e.skykiwi.com/"
local Subdomain2Root = {
    chch = InitDocumentRoot.."chch/",
    e = InitDocumentRoot,
    ent = InitDocumentRoot.."video/",
    hakazone = InitDocumentRoot.."card/",
    i = InitDocumentRoot.."wap/",
    imedu = InitDocumentRoot.."info/",
    money = InitDocumentRoot.."money/",
    news = InitDocumentRoot.."news/",
    people = InitDocumentRoot.."people/",
    politics = InitDocumentRoot.."politics/",
    radio = InitDocumentRoot.."video/radio/",
    www = InitDocumentRoot
}

--print("The subdomain is : "..subdomain)
--print("The type of Subdomain2Root is : "..type(Subdomain2Root[subdomain]))
if type(Subdomain2Root[subdomain]) ~= "nil" then
    --print("The Subdomain2Root is : "..Subdomain2Root[subdomain])
    DocumentRoot = Subdomain2Root[subdomain]
end

--print("The DocumentRoot is : "..DocumentRoot)
return DocumentRoot
