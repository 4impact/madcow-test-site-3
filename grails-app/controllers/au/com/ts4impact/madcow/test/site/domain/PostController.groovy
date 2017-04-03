package au.com.ts4impact.madcow.test.site.domain

import grails.converters.*
import java.util.List

/**
 * Endpoint that echoes print parameters onto the page.
 */
class PostController {

    static allowedMethods = [post: "POST"]

    def post = {
        println "PostController params : $params"
        List paramsToPrint = paramAsList('print')

        //minimal escaping; not as strong as string.encodeAsHTML()
        paramsToPrint.collect{ string -> string.replace("<", "&lt;")}

        render(view: "post", model: ["paramsToPrint": paramsToPrint]) as XML
    }

    private java.util.List paramAsList(String paramName) {
        def param = params[paramName] // can be List, String or null
        if (param instanceof String)
            param = [param]

        return param ?: []
    }
}