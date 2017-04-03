class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller: "Address",
            action: "search")
        "/status" (view: '/status')
		"500"(view:'/error')
	}
}
