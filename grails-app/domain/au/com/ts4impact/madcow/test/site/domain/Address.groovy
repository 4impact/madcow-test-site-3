package au.com.ts4impact.madcow.test.site.domain

class Address extends AbstractModel{

    static constraints = {
    }

    String addressLine1
    String addressLine2
    PostCodeReference postCode

    Boolean wirelessAccessPointDetected
}
