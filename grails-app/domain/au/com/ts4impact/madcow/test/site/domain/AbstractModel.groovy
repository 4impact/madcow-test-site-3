package au.com.ts4impact.madcow.test.site.domain

import org.apache.commons.lang.builder.ReflectionToStringBuilder

class AbstractModel {

    String toString(){
        ReflectionToStringBuilder.toString(this)
    }
}
