package au.com.ts4impact.madcow.test.site.domain

class PostCodeReference {

    static constraints = {
    }

    String postCode
    String locality
    State state

    String toString(){
        "$postCode : $locality : ${state.name}"
    }
}
