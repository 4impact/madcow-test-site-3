package au.com.ts4impact.madcow.test.site.domain

class Address extends AbstractModel{

    static constraints = {
        addressLine2 nullable: true;
    }

    String addressLine1
    String addressLine2
    PostCodeReference postCode

    Boolean wirelessAccessPointDetected
}
