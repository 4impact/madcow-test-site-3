package au.com.ts4impact.madcow.test.site.domain

class PostCodeReferenceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "create", params: params)
    }

    def list = {
        int pageSize = grailsApplication.config.grails.scaffolds.pageSize ?: 10
        params.max = Math.min(params.max ? params.int('max') : pageSize, 100)
        [postCodeReferenceInstanceList: PostCodeReference.list(params), postCodeReferenceInstanceTotal: PostCodeReference.count()]
    }

    def create = {
        def postCodeReferenceInstance = new PostCodeReference()
        postCodeReferenceInstance.properties = params
        return [postCodeReferenceInstance: postCodeReferenceInstance]
    }

    def save = {
        def postCodeReferenceInstance = new PostCodeReference(params)
        if (postCodeReferenceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), postCodeReferenceInstance.id])}"
            redirect(action: "show", id: postCodeReferenceInstance.id)
        }
        else {
            render(view: "create", model: [postCodeReferenceInstance: postCodeReferenceInstance])
        }
    }

    def show = {
        def postCodeReferenceInstance = PostCodeReference.get(params.id)
        if (!postCodeReferenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
            redirect(action: "list")
        }
        else {
            [postCodeReferenceInstance: postCodeReferenceInstance]
        }
    }

    def edit = {
        def postCodeReferenceInstance = PostCodeReference.get(params.id)
        if (!postCodeReferenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [postCodeReferenceInstance: postCodeReferenceInstance]
        }
    }

    def update = {
        def postCodeReferenceInstance = PostCodeReference.get(params.id)
        if (postCodeReferenceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (postCodeReferenceInstance.version > version) {

                    postCodeReferenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'postCodeReference.label', default: 'PostCodeReference')] as Object[], "Another user has updated this PostCodeReference while you were editing")
                    render(view: "edit", model: [postCodeReferenceInstance: postCodeReferenceInstance])
                    return
                }
            }
            println "update params: ${params}"
            def stateInstance = State.get(params."state.id");
            params.put("State",stateInstance)
            postCodeReferenceInstance.properties = params
            if (!postCodeReferenceInstance.hasErrors() && postCodeReferenceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), postCodeReferenceInstance.id])}"
                redirect(action: "show", id: postCodeReferenceInstance.id)
            }
            else {
                render(view: "edit", model: [postCodeReferenceInstance: postCodeReferenceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def postCodeReferenceInstance = PostCodeReference.get(params.id)
        if (postCodeReferenceInstance) {
            try {
                postCodeReferenceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'postCodeReference.label', default: 'PostCodeReference'), params.id])}"
            redirect(action: "list")
        }
    }
}
