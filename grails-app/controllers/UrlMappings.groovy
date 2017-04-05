package au.com.ts4impact.madcow.test.site

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
