package au.com.ts4impact.madcow.test.site.domain

import grails.converters.*
import grails.transaction.Transactional

class AddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "search", params: params)
    }


    def search = {
    }

    def searchAutoComplete = {
    }

    def ajaxGetSuburbNames = {
        def postCodes = PostCodeReference.findAllByLocalityLike("${params.id}%" , [max:8,
                                                                                    offset:0,
                                                                                    sort:"locality",
                                                                                    order:"asc"])
        println "ajaxGetSuburbNames for locality : ${params.id} -> postCodes : $postCodes"
        render postCodes as JSON
    }

    def ajaxGetSuburbs = {
        def postCodes = PostCodeReference.findAllByPostCode("${params.id}")
        println "ajaxGetSuburbs for id : ${params.id} -> postCodes : $postCodes"
        render postCodes as JSON
    }

    def ajaxCheckForDuplicates = {
        println "Checking for duplicate  addresses. ${params}"

        //Sleep a random amount of time under 5 seconds to make this ajax laggy
        sleep new Random().nextInt(5001)

        if (!params.max){
            params.putAll([max: 10, offset: 0, sort : "id"]);
        }

        def searchResults = Address.createCriteria().list(max: params.max, offset: params.offset) {

            ilike("addressLine1", "%${params.addressLine1}%")

            if (params.addressLine2) {
                and {
                    ilike("addressLine2", "%${params.addressLine2}%")
                }
            }

            and {
                postCode {
                    eq("postCode", "${params.postCodeEntry}")
                }
            }
        }
        println "...returned ${searchResults.totalCount} results"
        render searchResults.totalCount
    }

    def showSearchResults = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        params.offset = params?.offset?.toInteger() ?: 0

        //if state long name is set then use it (for autocomplete page)
        if (params.stateLongName)
        {
            //println "trying to reset value"
            params.state = State.findByLongName(params.stateLongName).id;
        }

        def searchResults = Address.createCriteria().list(max: params.max, offset: params.offset) {
            or {
                ilike("addressLine1", "%${params.addressLines}%")
                ilike("addressLine2", "%${params.addressLines}%")
            }
            if (params.postCode) {
                and {
                    postCode {
                        eq("postCode", "${params.postCode}")
                    }
                }
            }
            if (params.suburb) {
                and {
                    postCode {
                        ilike("locality", "%${params.suburb}%")
                    }
                }
            }
            if (params.state) {
                and {
                    postCode {
                        eq("state.id", new Long(params.state))
                    }
                }
            }
            if (params.order){
                if ("${params.sort}".contains('postCode.state'))
                {
                    postCode {
                        state {
                            order ("longName","${params.order}")
                        }
                    }
                }else if ("${params.sort}".contains('postCode.locality'))
                {
                    postCode {
                        order ("locality","${params.order}")
                    }
                }else{
                    order ("${params.sort}","${params.order}")
                }
            }

            //println "sort: ${params.sort}"
            //println "order: ${params.order}"
        }

        params.totalAddresses = searchResults.totalCount

        [ addressInstanceList: searchResults, params : params]
    }

    def createTableLayout = {
        create()
    }

    def create = {
        create()
    }

    def create(){
        def addressInstance = new Address()
        addressInstance.properties = params
        return [addressInstance: addressInstance]
    }

    @Transactional
    def save(Address address) {
        if (address == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (address.hasErrors()) {
            transactionStatus.setRollbackOnly()
//            respond address.errors, view:'create'
//            address.errors?.allErrors?.each{
//                flash.message += message(it.code, it.arguments, it.defaultMessage)
//            }
            flash.message = address.errors.allErrors.collect{
                //"Field:${it.getField()}| Error: ${message(it.code, it.arguments, it.defaultMessage)}, value:${it.getRejectedValue()}"
                "${message(args: it.arguments, code: it.defaultMessage)} "
            }.join('\n')
            redirect(action: "create", id: params.id)
            return
        }

        address.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), address.id])
                redirect address
            }
            '*' { respond address, [status: CREATED] }
        }
    }


//    def save = {
//        println "AddressController.save params : $params"
//
//        def addressInstance = new Address(params)
//
////        Address.withTransaction{
////            addressInstance.save(failOnError: true)
////        }
//
//        if (addressInstance.save(flush: true)) {
//            flash.message = "${message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])}"
//            redirect(action: "show", id: addressInstance.id)
//        }
//        else {
//            if (params.createTableLayout)
//                render(view: "createTableLayout", model: [addressInstance: addressInstance])
//            else
//                render(view: "create", model: [addressInstance: addressInstance])
//        }
//    }

    def show = {
        def addressInstance = Address.get(params.id)
        if (!addressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "list")
        }
        else {
            [addressInstance: addressInstance]
        }
    }

    def edit = {
        def addressInstance = Address.get(params.id)
        if (!addressInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "show")
        }
        else {
            return [addressInstance: addressInstance]
        }
    }

    def update = {

        // log initial details to save
        println "AddressController.update params : $params"

        def addressInstance = Address.get(params.id)
        if (addressInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (addressInstance.version > version) {

                    addressInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'address.label', default: 'Address')] as Object[], "Another user has updated this Address while you were editing")
                    render(view: "edit", model: [addressInstance: addressInstance])
                    return
                }
            }

            addressInstance.properties = params
            println "AddressController.update addressInstance after applying params : ${addressInstance}"

            if (!addressInstance.hasErrors() && addressInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])}"
                redirect(action: "show", id: addressInstance.id)
            }
            else {
                render(view: "edit", model: [addressInstance: addressInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "show")
        }
    }

    def delete = {
        //println "deleting address "+params.id;

        def addressInstance = Address.get(params.id)
        if (addressInstance) {
            //println "address instance is not null"
            try {
                addressInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "search")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
                redirect(action: "search", id: params.id)
            }
        }
        else {
            //println "address instance is null"
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])}"
            redirect(action: "search")
        }
    }
}

